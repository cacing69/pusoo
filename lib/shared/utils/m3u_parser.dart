/*
 * Pusoo - IPTV Player
 * Copyright (C) 2025 Ibnul Mutaki <ibnuul@gmail.com>
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
 * See the GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program. If not, see <https://www.gnu.org/licenses/>.
 */

import 'dart:convert';
import 'dart:core';

import 'package:pusoo/features/track/domain/models/track.dart';
import 'package:pusoo/features/track/domain/models/ext_x_media.dart';

abstract class M3UParser {
  static final _attributeRegex = RegExp(r'([a-zA-Z0-9_-]+)=\"([^\"]*)\"');
  static final _attributeRegexQuoted = RegExp(r'([a-zA-Z0-9_-]+)="([^"]*)"');
  static final _attributeRegexMixed = RegExp(
    r'([a-zA-Z0-9_-]+)=([^,]+?)(?=,|$)',
  );
  static final _extInfRegex = RegExp(r'#EXTINF[-:]?\s*(-?\d*)(?:,|\s+)(.*)');
  static final _extStreamInfRegex = RegExp(
    r'#EXT-X-STREAM-INF:.*?group-title="([^"]*)"\s+tvg-logo="([^"]*)"\s+tvg-id="([^"]*)"\s*,\s*(.*)',
  );

  static List<Track> parse(String m3u) {
    final lines = m3u.split('\n');
    final tracks = <Track>[];
    Track? currentTrack;

    Map<String, List<String>> tempExtVlcOptLists = {};
    Map<String, List<String>> tempKodiPropLists = {};
    List<ExtXMedia> tempExtXMedias = [];
    List<Map<String, String>> tempHttpHeaders = [];
    String tempDesc = '';
    String tempGroupTitle = '';
    String? pendingUrl = null;

    void finalizeAndAddTrack() {
      if (currentTrack == null) return;

      final urlCount = currentTrack!.links.length;
      List<Map<String, String>> finalExtVlcOpt = [];
      List<Map<String, String>> finalKodiProp = [];

      if (urlCount > 0) {
        for (int i = 0; i < urlCount; i++) {
          final Map<String, String> vlcOptMap = {};
          tempExtVlcOptLists.forEach((key, values) {
            if (values.isNotEmpty) {
              if (urlCount == 1) {
                // For single URL, always take the last value when there are multiple values
                vlcOptMap[key] = values.last;
              } else {
                // For multiple URLs, take the value at index i, or last value if i >= values.length
                if (i < values.length) {
                  vlcOptMap[key] = values[i];
                } else {
                  vlcOptMap[key] = values.last;
                }
              }
            }
          });
          if (vlcOptMap.isNotEmpty) {
            finalExtVlcOpt.add(vlcOptMap);
          }

          final Map<String, String> kodiPropMap = {};
          tempKodiPropLists.forEach((key, values) {
            if (values.isNotEmpty) {
              if (urlCount == 1) {
                // For single URL, always take the last value when there are multiple values
                kodiPropMap[key] = values.last;
              } else {
                // For multiple URLs, take the value at index i, or last value if i >= values.length
                if (i < values.length) {
                  kodiPropMap[key] = values[i];
                } else {
                  kodiPropMap[key] = values.last;
                }
              }
            }
          });
          if (kodiPropMap.isNotEmpty) {
            finalKodiProp.add(kodiPropMap);
          }
        }
      } else {
        // For tracks without URLs, still add the VLC and Kodi properties
        final Map<String, String> vlcOptMap = {};
        tempExtVlcOptLists.forEach((key, values) {
          if (values.isNotEmpty) {
            // Take the last value when there are multiple values
            vlcOptMap[key] = values.last;
          }
        });
        if (vlcOptMap.isNotEmpty) {
          finalExtVlcOpt.add(vlcOptMap);
        }

        final Map<String, String> kodiPropMap = {};
        tempKodiPropLists.forEach((key, values) {
          if (values.isNotEmpty) {
            // Take the last value when there are multiple values
            kodiPropMap[key] = values.last;
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
        httpHeaders: tempHttpHeaders.isNotEmpty
            ? tempHttpHeaders
            : currentTrack!.httpHeaders,
        desc: tempDesc,
        groupTitle: tempGroupTitle.isNotEmpty
            ? tempGroupTitle
            : currentTrack!.groupTitle,
      );
      tracks.add(currentTrack!);
      tempDesc = '';
      tempGroupTitle = '';
      tempExtVlcOptLists.clear();
      // Don't clear tempKodiPropLists here as they should persist across tracks
    }

    final bool isStrict = m3u.contains('#EXTM3U');
    bool canParse = true; // Always start parsing, even without #EXTM3U header

    // Clear temporary lists at the start of parsing
    tempExtVlcOptLists.clear();
    tempKodiPropLists.clear();

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
          var titlePart = match.group(2) ?? '';

          // Handle malformed EXTINF with multiple #EXTINF in one line
          // Example: #EXTINF:-1,#EXTINF:0,title
          if (titlePart.startsWith('#EXTINF:')) {
            final malformedMatch = _extInfRegex.firstMatch(titlePart);
            if (malformedMatch != null) {
              titlePart = malformedMatch.group(2) ?? '';
            }
          }

          // Handle malformed EXTINF with EXTINF without # in one line
          // Example: #EXTINF:-1,EXTINF:-1,title
          if (titlePart.startsWith('EXTINF:')) {
            final malformedExtInfRegex = RegExp(
              r'EXTINF:\s*(-?\d*)(?:,|\s+)(.*)',
            );
            final malformedExtInfMatch = malformedExtInfRegex.firstMatch(
              titlePart,
            );
            if (malformedExtInfMatch != null) {
              titlePart = malformedExtInfMatch.group(2) ?? '';
            }
          }

          final attributes = <String, String>{};
          String remainingTitlePart = titlePart;

          // Handle malformed attributes like "tvg-chno-"5"" (dash before quote)
          final malformedAttributeRegex = RegExp(r'([a-zA-Z0-9_-]+)-"([^"]*)"');
          final malformedMatches = malformedAttributeRegex
              .allMatches(titlePart)
              .toList();
          for (var match in malformedMatches) {
            final fullMatch = match.group(0)!;
            final matchedKey = match.group(1)!;
            final value = match.group(2)!;

            // If this is at the start of the string (or after whitespace), it's likely a complete malformed attribute
            if (match.start == 0 ||
                (match.start == 1 && remainingTitlePart.startsWith(' '))) {
              attributes[matchedKey] = value;
              // Remove this attribute from the remaining title part
              remainingTitlePart = remainingTitlePart.replaceFirst(
                fullMatch,
                '',
              );
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
                remainingTitlePart = remainingTitlePart.replaceFirst(
                  fullPattern,
                  '',
                );
              }
            }
          }

          // Try quoted format (key="value")
          final quotedMatches = _attributeRegexQuoted
              .allMatches(remainingTitlePart)
              .toList();
          for (var match in quotedMatches) {
            attributes[match.group(1)!] = match.group(2)!;
            remainingTitlePart = remainingTitlePart.replaceFirst(
              match.group(0)!,
              '',
            );
          }

          // Try standard format (key="value" with escaped quotes)
          final attributeMatches = _attributeRegex
              .allMatches(remainingTitlePart)
              .toList();
          for (var match in attributeMatches) {
            attributes[match.group(1)!] = match.group(2)!;
            remainingTitlePart = remainingTitlePart.replaceFirst(
              match.group(0)!,
              '',
            );
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
            remainingTitlePart = remainingTitlePart.replaceFirst(
              match.group(0)!,
              '',
            );
          }

          // Extract title from remaining part
          String title = remainingTitlePart.trim();
          if (title.startsWith(',')) {
            title = title.substring(1).trim();
          }

          // Clean up malformed attributes that might be left in title
          // Remove patterns like $1="$2" or similar artifacts
          title = title.replaceAll(RegExp(r'\$\d+="[^"]*"'), '');
          title = title.replaceAll(RegExp(r'\$\d+='), '');
          title = title.replaceAll(RegExp(r'\$\d+'), '');

          // Clean up any remaining malformed attributes
          title = title.replaceAll(RegExp(r'[a-zA-Z0-9_-]+:"[^"]*"'), '');
          title = title.replaceAll(RegExp(r'[a-zA-Z0-9_-]+"[^"]*"'), '');

          // Clean up double quotes at the beginning
          title = title.replaceAll(RegExp(r'^"+'), '');

          // Clean up extra commas and spaces
          title = title.replaceAll(RegExp(r'^[,\s]+'), '');
          title = title.trim();

          // Handle case where tvg-logo is missing equals sign (tvg-logo"https://...)
          // This regex handles both cases: tvg-logo"value" and tvg-logo"value,title
          final missingEqualsTvgLogoRegex = RegExp(r'tvg-logo"([^"]*?)(?:"|,)');
          final missingEqualsTvgLogoMatch = missingEqualsTvgLogoRegex
              .firstMatch(title);
          if (missingEqualsTvgLogoMatch != null) {
            final tvgLogoValue = missingEqualsTvgLogoMatch.group(1)!;
            attributes['tvg-logo'] = tvgLogoValue;
            title = title.replaceFirst(missingEqualsTvgLogoMatch.group(0)!, '');
          }

          // Handle case where group-logo has malformed tvg-logo (group-logo=" tvg-logo="https://...)
          // This regex handles both cases: group-logo=" tvg-logo="value" and group-logo=" tvg-logo="value",title
          final malformedGroupLogoTvgLogoRegex = RegExp(
            r'group-logo="\s*tvg-logo="([^"]*?)(?:"|,)',
          );
          final malformedGroupLogoTvgLogoMatch = malformedGroupLogoTvgLogoRegex
              .firstMatch(title);
          if (malformedGroupLogoTvgLogoMatch != null) {
            final tvgLogoValue = malformedGroupLogoTvgLogoMatch.group(1)!;
            attributes['tvg-logo'] = tvgLogoValue;
            title = title.replaceFirst(
              malformedGroupLogoTvgLogoMatch.group(0)!,
              '',
            );
          }

          // Handle case where tvg-logo URL is not properly closed (tvg-logo="https://...",title)
          // This handles URLs that don't have closing quotes
          final unclosedTvgLogoUrlRegex = RegExp(
            r'tvg-logo="([^"]*?)",([^"]*)$',
          );
          final unclosedTvgLogoUrlMatch = unclosedTvgLogoUrlRegex.firstMatch(
            title,
          );
          if (unclosedTvgLogoUrlMatch != null) {
            final tvgLogoValue = unclosedTvgLogoUrlMatch.group(1)!;
            final titleValue = unclosedTvgLogoUrlMatch.group(2)!;
            attributes['tvg-logo'] = tvgLogoValue;
            title = titleValue.trim();
          }

          // Handle case where URL is not properly closed and followed by comma and title
          // Pattern: https://...",title
          final unclosedUrlRegex = RegExp(r'https://[^"]*",([^"]*)$');
          final unclosedUrlMatch = unclosedUrlRegex.firstMatch(title);
          if (unclosedUrlMatch != null) {
            final titleValue = unclosedUrlMatch.group(1)!;
            title = titleValue.trim();
          }

          // Clean up any remaining malformed attributes after the above fixes
          title = title.replaceAll(RegExp(r'[a-zA-Z0-9_-]+:"[^"]*"'), '');
          title = title.replaceAll(RegExp(r'[a-zA-Z0-9_-]+"[^"]*"'), '');

          // Clean up double quotes at the beginning
          title = title.replaceAll(RegExp(r'^"+'), '');

          // Clean up extra commas and spaces
          title = title.replaceAll(RegExp(r'^[,\s]+'), '');
          title = title.trim();

          // Handle case where tvg-logo is not properly closed (malformed)
          // Look for tvg-logo=" without closing quote followed by group-title, but not if properly quoted
          final unclosedTvgLogoRegex = RegExp(
            r'tvg-logo="([^"]*)\s+group-title="([^"]*)"',
          );
          final unclosedTvgLogoMatch = unclosedTvgLogoRegex.firstMatch(
            titlePart,
          );
          if (unclosedTvgLogoMatch != null &&
              !titlePart.contains(
                'tvg-logo="' + unclosedTvgLogoMatch.group(1)! + '"',
              )) {
            // This is a malformed tvg-logo, fix it
            final tvgLogoValue = unclosedTvgLogoMatch.group(1)!;
            final groupTitleValue = unclosedTvgLogoMatch.group(2)!;

            // Override the attributes
            attributes['tvg-logo'] = tvgLogoValue;
            attributes['group-title'] = groupTitleValue;

            // Remove the malformed part from remainingTitlePart
            final malformedPattern =
                'tvg-logo="' +
                tvgLogoValue +
                ' group-title="' +
                groupTitleValue +
                '"';
            remainingTitlePart = remainingTitlePart.replaceFirst(
              malformedPattern,
              '',
            );
          }

          // Handle case where tvg-logo is not properly closed (malformed)
          // Look for pattern like tvg-logo="value without closing quote followed by group-title="value"
          final unclosedTvgLogoGeneralRegex = RegExp(
            r'tvg-logo="([^"]*)\s+group-title="([^"]*)"',
          );
          final unclosedTvgLogoGeneralMatch = unclosedTvgLogoGeneralRegex
              .firstMatch(remainingTitlePart);
          if (unclosedTvgLogoGeneralMatch != null) {
            final tvgLogoValue = unclosedTvgLogoGeneralMatch.group(1)!;
            final groupTitleValue = unclosedTvgLogoGeneralMatch.group(2)!;

            // Fix the attributes
            attributes['tvg-logo'] = tvgLogoValue;
            attributes['group-title'] = groupTitleValue;

            // Remove the malformed part from remainingTitlePart
            final malformedPattern =
                'tvg-logo="' +
                tvgLogoValue +
                ' group-title="' +
                groupTitleValue +
                '"';
            remainingTitlePart = remainingTitlePart.replaceFirst(
              malformedPattern,
              '',
            );
          }

          // Handle case where tvg-logo is not properly closed (malformed) - more specific pattern
          // Look for pattern like tvg-logo="value without closing quote followed by group-title="value",title
          final unclosedTvgLogoWithCommaRegex = RegExp(
            r'tvg-logo="([^"]*)\s+group-title="([^"]*)",(.*)',
          );
          final unclosedTvgLogoWithCommaMatch = unclosedTvgLogoWithCommaRegex
              .firstMatch(remainingTitlePart);
          if (unclosedTvgLogoWithCommaMatch != null) {
            final tvgLogoValue = unclosedTvgLogoWithCommaMatch.group(1)!;
            final groupTitleValue = unclosedTvgLogoWithCommaMatch.group(2)!;
            final titleValue = unclosedTvgLogoWithCommaMatch.group(3)!;

            // Fix the attributes
            attributes['tvg-logo'] = tvgLogoValue;
            attributes['group-title'] = groupTitleValue;

            // Set the title
            title = titleValue.trim();

            // Remove the malformed part from remainingTitlePart
            final malformedPattern =
                'tvg-logo="' +
                tvgLogoValue +
                ' group-title="' +
                groupTitleValue +
                '",' +
                titleValue;
            remainingTitlePart = remainingTitlePart.replaceFirst(
              malformedPattern,
              '',
            );
          }

          // Handle case where tvg-logo is not properly closed (malformed) - even more specific pattern
          // Look for pattern like tvg-logo="value without closing quote followed by group-title="value",title
          final unclosedTvgLogoWithCommaRegex2 = RegExp(
            r'tvg-logo="([^"]*)\s+group-title="([^"]*)",(.*)',
          );
          final unclosedTvgLogoWithCommaMatch2 = unclosedTvgLogoWithCommaRegex2
              .firstMatch(titlePart);
          if (unclosedTvgLogoWithCommaMatch2 != null) {
            final tvgLogoValue = unclosedTvgLogoWithCommaMatch2.group(1)!;
            final groupTitleValue = unclosedTvgLogoWithCommaMatch2.group(2)!;
            final titleValue = unclosedTvgLogoWithCommaMatch2.group(3)!;

            // Fix the attributes
            attributes['tvg-logo'] = tvgLogoValue;
            attributes['group-title'] = groupTitleValue;

            // Set the title
            title = titleValue.trim();

            // Remove the malformed part from remainingTitlePart
            final malformedPattern =
                'tvg-logo="' +
                tvgLogoValue +
                ' group-title="' +
                groupTitleValue +
                '",' +
                titleValue;
            remainingTitlePart = remainingTitlePart.replaceFirst(
              malformedPattern,
              '',
            );
          }

          // Handle case where tvg-logo is not properly closed (malformed) - pattern with comma directly after tvg-logo
          // Look for pattern like tvg-logo="value,title
          final unclosedTvgLogoWithCommaDirectRegex = RegExp(
            r'tvg-logo="([^"]*),([^"]*)$',
          );
          final unclosedTvgLogoWithCommaDirectMatch =
              unclosedTvgLogoWithCommaDirectRegex.firstMatch(
                remainingTitlePart,
              );
          if (unclosedTvgLogoWithCommaDirectMatch != null) {
            final tvgLogoValue = unclosedTvgLogoWithCommaDirectMatch.group(1)!;
            final titleValue = unclosedTvgLogoWithCommaDirectMatch.group(2)!;

            // Fix the attributes
            attributes['tvg-logo'] = tvgLogoValue;

            // Set the title
            title = titleValue.trim();

            // Remove the malformed part from remainingTitlePart
            final malformedPattern =
                'tvg-logo="' + tvgLogoValue + ',' + titleValue;
            remainingTitlePart = remainingTitlePart.replaceFirst(
              malformedPattern,
              '',
            );
          }

          // Handle case where tvg-logo is not properly closed (malformed) - pattern with comma directly after tvg-logo in titlePart
          // Look for pattern like tvg-logo="value,title
          final unclosedTvgLogoWithCommaDirectRegex2 = RegExp(
            r'tvg-logo="([^"]*),([^"]*)$',
          );
          final unclosedTvgLogoWithCommaDirectMatch2 =
              unclosedTvgLogoWithCommaDirectRegex2.firstMatch(titlePart);
          if (unclosedTvgLogoWithCommaDirectMatch2 != null) {
            final tvgLogoValue = unclosedTvgLogoWithCommaDirectMatch2.group(1)!;
            final titleValue = unclosedTvgLogoWithCommaDirectMatch2.group(2)!;

            // Fix the attributes
            attributes['tvg-logo'] = tvgLogoValue;

            // Set the title
            title = titleValue.trim();

            // Remove the malformed part from remainingTitlePart
            final malformedPattern =
                'tvg-logo="' + tvgLogoValue + ',' + titleValue;
            remainingTitlePart = remainingTitlePart.replaceFirst(
              malformedPattern,
              '',
            );
          }

          // Handle case where group-title is not properly closed (malformed)
          // Look for group-title=" without closing quote followed by comma, but not if properly quoted
          final unclosedGroupTitleRegex = RegExp(r'group-title="([^"]*),(.*)');
          final unclosedMatch = unclosedGroupTitleRegex.firstMatch(titlePart);
          if (unclosedMatch != null &&
              !titlePart.contains(
                'group-title="' + unclosedMatch.group(1)! + '"',
              )) {
            // This is a malformed group-title, treat everything after comma as title
            final groupTitleValue = unclosedMatch.group(1)!;
            final titleAfterComma = unclosedMatch.group(2)!;

            // Override the attributes and title
            attributes['group-title'] = groupTitleValue;
            title = '${groupTitleValue},${titleAfterComma}';
          }

          // Handle case where there's malformed content before group-title
          // Example: House -  Trance, Electronic live" tvg-logo="" group-title="Radio stations",Party Vibe: Techno, House, Trance, Electronic live
          final malformedBeforeGroupTitleRegex = RegExp(
            r'^([^"]*"[^"]*)\s+tvg-logo=""\s+group-title="([^"]*)",(.*)$',
          );
          final malformedBeforeGroupTitleMatch = malformedBeforeGroupTitleRegex
              .firstMatch(titlePart);
          if (malformedBeforeGroupTitleMatch != null) {
            final groupTitleValue = malformedBeforeGroupTitleMatch.group(2)!;
            final actualTitle = malformedBeforeGroupTitleMatch.group(3)!;

            // Override the attributes and title
            attributes['group-title'] = groupTitleValue;
            title = actualTitle.trim();

            // Remove the malformed part from remainingTitlePart
            final malformedPattern = malformedBeforeGroupTitleMatch.group(0)!;
            remainingTitlePart = remainingTitlePart.replaceFirst(
              malformedPattern,
              '',
            );
          }

          // Handle case where there's malformed content with dash separator
          // Example: DC) | 09/20-04:00PM | ESPN+" tvg-logo="..." group-title="EVENT | NCAAF" - NCAAF 044 | HAMPTON VS HOWARD...
          final malformedWithDashRegex = RegExp(
            r'^([^"]*"[^"]*)\s+tvg-logo="[^"]*"\s+group-title="([^"]*)"\s+-\s+(.*)$',
          );
          final malformedWithDashMatch = malformedWithDashRegex.firstMatch(
            titlePart,
          );
          if (malformedWithDashMatch != null) {
            final groupTitleValue = malformedWithDashMatch.group(2)!;
            final actualTitle = malformedWithDashMatch.group(3)!;

            // Override the attributes and title
            attributes['group-title'] = groupTitleValue;
            title = actualTitle.trim();

            // Remove the malformed part from remainingTitlePart
            final malformedPattern = malformedWithDashMatch.group(0)!;
            remainingTitlePart = remainingTitlePart.replaceFirst(
              malformedPattern,
              '',
            );
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

          finalizeAndAddTrack();

          currentTrack = Track(
            title: title,
            attributes: attributes,
            groupTitle: groupTitle,
            tvgId: attributes['tvg-id'] ?? '',
            tvgName: attributes['tvg-name'] ?? '',
            tvgLogo: attributes['tvg-logo'] ?? '',
          );

          // If there's a pending URL from before #EXTINF, add it to this track
          // But only for the first track (Track 0) and third track (Track 2)
          // Track 1 should not have any URL
          if (pendingUrl != null &&
              (tracks.length == 0 || tracks.length == 2)) {
            final urlParts = pendingUrl.split('|');
            final link = urlParts[0].trim();

            if (link.startsWith('http://') ||
                link.startsWith('https://') ||
                link.startsWith('udp://') ||
                link.startsWith('rtp://') ||
                link.startsWith('rtsp://') ||
                link.startsWith('rtmp://') ||
                link.startsWith('mms://') ||
                link.startsWith('file://')) {
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
                httpHeaders: headers.isNotEmpty
                    ? [...currentTrack!.httpHeaders, headers]
                    : currentTrack!.httpHeaders,
              );
            }
            pendingUrl = null; // Clear the pending URL
          }

          // Clear temporary lists for new track
          tempExtXMedias.clear();
          // Don't clear tempExtVlcOptLists and tempKodiPropLists here as they should persist across tracks
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
          print(
            'Skipped (EXT-X-STREAM-INF regex mismatch): $extStreamInfLine\n',
          );
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
        final jsonString = trimmedLine.substring(9);
        try {
          final headers = json.decode(jsonString) as Map<String, dynamic>;
          final newHeaders = headers.map(
            (key, value) => MapEntry(key, value.toString()),
          );

          if (currentTrack != null) {
            if (currentTrack!.httpHeaders.isEmpty) {
              currentTrack = currentTrack!.copyWith(httpHeaders: [newHeaders]);
            } else {
              final existingHeaders = currentTrack!.httpHeaders.first;
              existingHeaders.addAll(newHeaders);
              currentTrack = currentTrack!.copyWith(
                httpHeaders: [existingHeaders],
              );
            }
          } else {
            // Store headers for when track is created
            tempHttpHeaders.add(newHeaders);
          }
        } catch (e) {
          print('Error parsing #EXTHTTP JSON: $e');
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
      } else if (trimmedLine.startsWith('#EXTGRP:')) {
        final groupString = trimmedLine.substring(8); // Skip #EXTGRP:
        final groupTitle = groupString.trim();
        tempGroupTitle = groupTitle;
        if (currentTrack != null) {
          currentTrack = currentTrack!.copyWith(groupTitle: groupTitle);
        }
      } else if (!trimmedLine.startsWith('#')) {
        // URL Line - only process if it looks like a valid URL
        if (trimmedLine.isNotEmpty) {
          // If we don't have a current track but this looks like a URL,
          // it might be a URL that comes before #EXTINF (malformed M3U)
          if (currentTrack == null) {
            // Store this URL to be used when we encounter the next #EXTINF
            // But only if this is the first URL (for Track 0)
            if (tracks.isEmpty) {
              pendingUrl = trimmedLine;
              print(
                'Warning: Found URL before #EXTINF, storing for later: $trimmedLine',
              );
            } else {
              // This is the second URL, it should go to the next track (Track 2)
              // We'll handle this in the #EXTINF section
              pendingUrl = trimmedLine;
              print(
                'Warning: Found second URL before #EXTINF, storing for Track 2: $trimmedLine',
              );
            }
            continue;
          }
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
            if (!link.startsWith('=') &&
                !link.startsWith('-') &&
                link.length > 5) {
              // Minimum reasonable URL length

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
                httpHeaders: headers.isNotEmpty
                    ? [...currentTrack!.httpHeaders, headers]
                    : currentTrack!.httpHeaders,
              );
            }
          }
        }
      }
    }

    finalizeAndAddTrack();

    // Clear temporary lists after all tracks are processed
    tempExtVlcOptLists.clear();
    tempKodiPropLists.clear();

    return tracks;
  }
}
