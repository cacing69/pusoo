import 'dart:convert';
import 'dart:core';

import 'package:pusoo/features/track/domain/models/track.dart';
import 'package:pusoo/features/track/domain/models/ext_x_media.dart';

abstract class M3UParser {
  static final _attributeRegex = RegExp(r'([a-zA-Z0-9_-]+)=\"([^\"]*)\"');
  static final _attributeRegexQuoted = RegExp(r'([a-zA-Z0-9_-]+)="([^"]*)"');
  static final _attributeRegexMixed = RegExp(r'([a-zA-Z0-9_-]+)=([^,]+?)(?=,|$)');
  static final _extInfRegex = RegExp(r'#EXTINF:(-?\d*),?(.*)');
  static final _extStreamInfRegex = RegExp(r'#EXT-X-STREAM-INF:.*?group-title="([^"]*)"\s+tvg-logo="([^"]*)"\s+tvg-id="([^"]*)"\s*,\s*(.*)');

  static List<Track> parse(String m3u) {
    final lines = m3u.split('\n');
    final tracks = <Track>[];
    Track? currentTrack;

    Map<String, List<String>> tempExtVlcOptLists = {};
    Map<String, List<String>> tempKodiPropLists = {};
    List<ExtXMedia> tempExtXMedias = [];
    String tempDesc = '';

    void finalizeAndAddTrack() {
      if (currentTrack == null) return;

      final urlCount = currentTrack!.links.length;
      List<Map<String, String>> finalExtVlcOpt = [];
      List<Map<String, String>> finalKodiProp = [];

      if (urlCount > 0) {
        for (int i = 0; i < urlCount; i++) {
          final Map<String, String> vlcOptMap = {};
          tempExtVlcOptLists.forEach((key, values) {
            if (i < values.length) {
              vlcOptMap[key] = values[i];
            } else if (values.length == 1) {
              vlcOptMap[key] = values[0];
            }
          });
          finalExtVlcOpt.add(vlcOptMap);

          final Map<String, String> kodiPropMap = {};
          tempKodiPropLists.forEach((key, values) {
            if (i < values.length) {
              kodiPropMap[key] = values[i];
            } else if (values.length == 1) {
              kodiPropMap[key] = values[0];
            }
          });
          finalKodiProp.add(kodiPropMap);
        }
      } else {
        // For tracks without URLs, still add the VLC and Kodi properties
        final Map<String, String> vlcOptMap = {};
        tempExtVlcOptLists.forEach((key, values) {
          if (values.isNotEmpty) {
            vlcOptMap[key] = values[0];
          }
        });
        if (vlcOptMap.isNotEmpty) {
          finalExtVlcOpt.add(vlcOptMap);
        }

        final Map<String, String> kodiPropMap = {};
        tempKodiPropLists.forEach((key, values) {
          if (values.isNotEmpty) {
            kodiPropMap[key] = values[0];
          }
        });
        if (kodiPropMap.isNotEmpty) {
          finalKodiProp.add(kodiPropMap);
        }
      }

      currentTrack = currentTrack!.copyWith(
        extVlcOpts: finalExtVlcOpt,
        kodiProps: finalKodiProp,
        extXMedias: tempExtXMedias,
        desc: tempDesc,
      );
      tracks.add(currentTrack!);
      tempExtVlcOptLists = {};
      tempKodiPropLists = {};
      tempExtXMedias = [];
      tempDesc = '';
    }

    final bool isStrict = m3u.contains('#EXTM3U');
    bool canParse = true; // Always start parsing, even without #EXTM3U header

    for (var i = 0; i < lines.length; i++) {
      final line = lines[i];
      final trimmedLine = line.trim();
      if (trimmedLine.isEmpty || trimmedLine.startsWith('##')) {
        continue;
      }

      if (isStrict && !canParse) {
        if (trimmedLine.startsWith('#EXTM3U')) {
          canParse = true;
        }
        continue;
      }

      if (trimmedLine.startsWith('#EXTINF')) {
        finalizeAndAddTrack();

        var extInfLine = trimmedLine;
        if (i + 1 < lines.length) {
          final nextLine = lines[i + 1].trim();
          if (!nextLine.startsWith('#') && !nextLine.contains('://')) {
            extInfLine += ' ' + nextLine;
            i++;
          }
        }

        final match = _extInfRegex.firstMatch(extInfLine);
        if (match != null) {
          final titlePart = match.group(2) ?? '';

          final attributes = <String, String>{};
          String remainingTitlePart = titlePart;
          
          // Handle malformed attributes like "tvg-chno-"5"" (dash before quote)
          final malformedAttributeRegex = RegExp(r'([a-zA-Z0-9_-]+)-"([^"]*)"');
          final malformedMatches = malformedAttributeRegex.allMatches(titlePart).toList();
          for (var match in malformedMatches) {
            final fullMatch = match.group(0)!;
            final matchedKey = match.group(1)!;
            final value = match.group(2)!;
            
            // If this is at the start of the string (or after whitespace), it's likely a complete malformed attribute
            if (match.start == 0 || (match.start == 1 && remainingTitlePart.startsWith(' '))) {
              attributes[matchedKey] = value;
              // Remove this attribute from the remaining title part
              remainingTitlePart = remainingTitlePart.replaceFirst(fullMatch, '');
            } else {
              // Look backwards to see if there's more context for the key
              final beforeMatch = remainingTitlePart.substring(0, match.start);
              final wordBoundary = RegExp(r'(\s|^)([a-zA-Z0-9_-]+)$');
              final wordMatch = wordBoundary.firstMatch(beforeMatch);
              
              if (wordMatch != null) {
                final fullKey = wordMatch.group(2)! + '-' + matchedKey;
                attributes[fullKey] = value;
                // Remove this attribute from the remaining title part
                final fullPattern = wordMatch.group(2)! + '-' + fullMatch;
                remainingTitlePart = remainingTitlePart.replaceFirst(fullPattern, '');
              }
            }
          }
          
          // Try quoted format (key="value")
          final quotedMatches = _attributeRegexQuoted
              .allMatches(remainingTitlePart)
              .toList();
          for (var match in quotedMatches) {
            attributes[match.group(1)!] = match.group(2)!;
            remainingTitlePart = remainingTitlePart.replaceFirst(match.group(0)!, '');
          }
          
          // Try standard format (key="value" with escaped quotes)
          final attributeMatches = _attributeRegex
              .allMatches(remainingTitlePart)
              .toList();
          for (var match in attributeMatches) {
            attributes[match.group(1)!] = match.group(2)!;
            remainingTitlePart = remainingTitlePart.replaceFirst(match.group(0)!, '');
          }
          
          // Try mixed format (key=value with quotes inside)
          final mixedMatches = _attributeRegexMixed
              .allMatches(remainingTitlePart)
              .toList();
          for (var match in mixedMatches) {
            String key = match.group(1)!.trim();
            String value = match.group(2)!.trim();
            // Remove quotes if present
            if (value.startsWith('"') && value.endsWith('"')) {
              value = value.substring(1, value.length - 1);
            }
            attributes[key] = value;
            remainingTitlePart = remainingTitlePart.replaceFirst(match.group(0)!, '');
          }
          
          // Extract title from remaining part
          String title = remainingTitlePart.trim();
          if (title.startsWith(',')) {
            title = title.substring(1).trim();
          }
          
          // Handle case where group-title is not properly closed (malformed)
          // Look for group-title=" without closing quote followed by comma, but not if properly quoted
          final unclosedGroupTitleRegex = RegExp(r'group-title="([^"]*),(.*)');
          final unclosedMatch = unclosedGroupTitleRegex.firstMatch(titlePart);
          if (unclosedMatch != null && !titlePart.contains('group-title="' + unclosedMatch.group(1)! + '"')) {
            // This is a malformed group-title, treat everything after comma as title
            final groupTitleValue = unclosedMatch.group(1)!;
            final titleAfterComma = unclosedMatch.group(2)!;
            
            // Override the attributes and title
            attributes['group-title'] = groupTitleValue;
            title = '${groupTitleValue},${titleAfterComma}';
          }

          if (title.startsWith('group-title=')) {
            var groupTitleValue = title.substring('group-title='.length);
            if (groupTitleValue.startsWith('"')) {
              groupTitleValue = groupTitleValue.substring(1);
            }
            attributes['group-title'] = groupTitleValue;
            title = ''; // Title is empty for now
          }

          var groupTitle = attributes['group-title'] ?? '';
          if (groupTitle.contains(',')) {
            title = groupTitle;
            groupTitle = groupTitle.split(',')[0];
            attributes['group-title'] = groupTitle;
          }

          currentTrack = Track(
            title: title,
            attributes: attributes,
            groupTitle: groupTitle,
            tvgId: attributes['tvg-id'] ?? '',
            tvgName: attributes['tvg-name'] ?? '',
            tvgLogo: attributes['tvg-logo'] ?? '',
          );
        } else {
          print('Skipped (regex mismatch): $extInfLine\n');
        }
      } else if (trimmedLine.startsWith('#EXT-X-STREAM-INF')) {
        finalizeAndAddTrack();

        var extStreamInfLine = trimmedLine;
        if (i + 1 < lines.length) {
          final nextLine = lines[i + 1].trim();
          if (!nextLine.startsWith('#') && !nextLine.contains('://')) {
            extStreamInfLine += ' ' + nextLine;
            i++;
          }
        }

        final match = _extStreamInfRegex.firstMatch(extStreamInfLine);
        if (match != null) {
          final groupTitle = match.group(1) ?? '';
          final tvgLogo = match.group(2) ?? '';
          final tvgId = match.group(3) ?? '';
          final title = match.group(4) ?? '';

          final attributes = <String, String>{
            'group-title': groupTitle,
            'tvg-logo': tvgLogo,
            'tvg-id': tvgId,
          };

          currentTrack = Track(
            title: title,
            attributes: attributes,
            groupTitle: groupTitle,
            tvgId: tvgId,
            tvgName: '',
            tvgLogo: tvgLogo,
          );
        } else {
          print('Skipped (EXT-X-STREAM-INF regex mismatch): $extStreamInfLine\n');
        }
      } else if (trimmedLine.startsWith('#EXTVLCOPT')) {
        final optionString = trimmedLine.substring(11);
        final separatorIndex = optionString.indexOf('=');
        if (separatorIndex != -1) {
          final key = optionString.substring(0, separatorIndex);
          final value = optionString.substring(separatorIndex + 1);
          tempExtVlcOptLists.putIfAbsent(key, () => []).add(value);
        }
      } else if (trimmedLine.startsWith('KODIPROP:') ||
          trimmedLine.startsWith('#KODIPROP:')) {
        final propString = trimmedLine.startsWith('#')
            ? trimmedLine.substring(10) // Skip #KODIPROP:
            : trimmedLine.substring(9); // Skip KODIPROP:
        final separatorIndex = propString.indexOf('=');
        if (separatorIndex != -1) {
          final key = propString.substring(0, separatorIndex);
          final value = propString.substring(separatorIndex + 1);
          tempKodiPropLists.putIfAbsent(key, () => []).add(value);
        }
      } else if (trimmedLine.startsWith('#EXTHTTP:')) {
        if (currentTrack != null) {
          final jsonString = trimmedLine.substring(9);
          try {
            final headers = json.decode(jsonString) as Map<String, dynamic>;
            final newHeaders =
                headers.map((key, value) => MapEntry(key, value.toString()));

            if (currentTrack!.httpHeaders.isEmpty) {
              currentTrack = currentTrack!.copyWith(
                httpHeaders: [newHeaders],
              );
            } else {
              final existingHeaders = currentTrack!.httpHeaders.first;
              existingHeaders.addAll(newHeaders);
              currentTrack = currentTrack!.copyWith(
                httpHeaders: [existingHeaders],
              );
            }
          } catch (e) {
            print('Error parsing #EXTHTTP JSON: $e');
          }
        }
      } else if (trimmedLine.startsWith('#EXT-X-MEDIA:')) {
        if (currentTrack != null) {
          final mediaString = trimmedLine.substring(13); // Skip #EXT-X-MEDIA:
          final Map<String, String> mediaMap = {};
          
          // Parse comma-separated attributes
          final attributes = mediaString.split(',');
          for (final attr in attributes) {
            final parts = attr.split('=');
            if (parts.length == 2) {
              final key = parts[0].trim();
              String value = parts[1].trim();
              // Remove quotes if present
              if (value.startsWith('"') && value.endsWith('"')) {
                value = value.substring(1, value.length - 1);
              }
              mediaMap[key] = value;
            }
          }
          
          final extXMedia = ExtXMedia.fromMap(mediaMap);
          tempExtXMedias.add(extXMedia);
        }
      } else if (trimmedLine.startsWith('#EXTDESC:')) {
        if (currentTrack != null) {
          final descString = trimmedLine.substring(9); // Skip #EXTDESC:
          tempDesc = descString.trim();
        }
      } else if (!trimmedLine.startsWith('#')) {
        // URL Line - only process if it looks like a valid URL
        if (currentTrack != null && trimmedLine.isNotEmpty) {
          final urlParts = trimmedLine.split('|');
          final link = urlParts[0].trim();
          
          // Validate URL - must start with a valid protocol and contain valid characters
          if (link.startsWith('http://') || 
              link.startsWith('https://') ||
              link.startsWith('udp://') ||
              link.startsWith('rtp://') ||
              link.startsWith('rtsp://') ||
              link.startsWith('rtmp://') ||
              link.startsWith('mms://') ||
              link.startsWith('file://')) {
            // Additional validation - reject obviously invalid URLs
            if (!link.contains('--') && 
                !link.startsWith('=') && 
                !link.startsWith('-') &&
                link.length > 5) { // Minimum reasonable URL length
              
              Map<String, String> headers = {};

              if (urlParts.length > 1) {
                final headerString = urlParts[1];
                final headerPairs = headerString.split('&');
                for (final pair in headerPairs) {
                  final parts = pair.split('=');
                  if (parts.length == 2) {
                    headers[parts[0].toLowerCase()] = parts[1];
                  }
                }
              }

              currentTrack = currentTrack!.copyWith(
                links: [...currentTrack!.links, link],
                httpHeaders: [...currentTrack!.httpHeaders, headers],
              );
            }
          }
        }
      }
    }

    finalizeAndAddTrack();

    return tracks;
  }
}