import 'dart:core';

import 'package:pusoo/shared/data/models/m3u_track.dart';

abstract class M3UParser {
  static final _attributeRegex = RegExp(r'([a-zA-Z0-9_-]+)=\"([^\"]*)\"');
  static final _extInfRegex = RegExp(r'#EXTINF:(-?\d*),?(.*)');

  static List<M3UTrack> parse(String m3u) {
    final lines = m3u.split('\n');
    final tracks = <M3UTrack>[];
    M3UTrack? currentTrack;

    Map<String, List<String>> tempExtVlcOptLists = {};
    Map<String, List<String>> tempKodiPropLists = {};

    void finalizeAndAddTrack() {
      if (currentTrack == null) return;

      final urlCount = currentTrack!.links.length;
      if (urlCount > 0) {
        List<Map<String, String>> finalExtVlcOpt = [];
        List<Map<String, String>> finalKodiProp = [];

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

        currentTrack = currentTrack!.copyWith(
          extVlcOpt: finalExtVlcOpt,
          kodiProp: finalKodiProp,
        );
      }
      tracks.add(currentTrack!);
      tempExtVlcOptLists = {};
      tempKodiPropLists = {};
    }

    final bool isStrict = m3u.contains('#EXTM3U');
    bool canParse = !isStrict;

    for (final line in lines) {
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

        final match = _extInfRegex.firstMatch(trimmedLine);
        if (match != null) {
          final duration = match.group(1) ?? '0';
          final titlePart = match.group(2) ?? '';

          final attributes = <String, String>{};
          final attributeMatches = _attributeRegex
              .allMatches(titlePart)
              .toList();
          for (var match in attributeMatches) {
            attributes[match.group(1)!] = match.group(2)!;
          }

          String title;
          if (attributeMatches.isNotEmpty) {
            final lastMatch = attributeMatches.last;
            title = titlePart.substring(lastMatch.end).trim();
            if (title.startsWith(',')) {
              title = title.substring(1).trim();
            }
          } else {
            title = titlePart.trim();
          }

          currentTrack = M3UTrack(
            title: title,
            duration: duration,
            attributes: attributes,
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
      } else if (trimmedLine.startsWith('#KODIPROP') ||
          trimmedLine.startsWith('KODIPROP:')) {
        final propString = trimmedLine.startsWith('#')
            ? trimmedLine.substring(10)
            : trimmedLine.substring(9);
        final separatorIndex = propString.indexOf('=');
        if (separatorIndex != -1) {
          final key = propString.substring(0, separatorIndex);
          final value = propString.substring(separatorIndex + 1);
          tempKodiPropLists.putIfAbsent(key, () => []).add(value);
        }
      } else if (!trimmedLine.startsWith('#')) {
        // URL Line
        if (currentTrack != null) {
          final urlParts = trimmedLine.split('|');
          final link = urlParts[0];
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

    finalizeAndAddTrack();

    return tracks;
  }
}
