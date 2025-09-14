import 'dart:core';

abstract class M3UParse {
  /// Helper function to convert a string to camel case.
  static String _toCamelCase(String text) {
    if (text.isEmpty) return '';
    final parts = text.split(RegExp(r'[^a-zA-Z0-9]+'));

    final firstPart = parts.first.toLowerCase();
    final restOfParts = parts
        .skip(1)
        .map(
          (part) => part.isEmpty
              ? ''
              : part[0].toUpperCase() + part.substring(1).toLowerCase(),
        )
        .join();

    return firstPart + restOfParts;
  }

  /// Parses M3U content and returns a structured map
  static Map<String, dynamic> parse(String m3u) {
    final Map<String, dynamic> output = {'items': [], 'total': 0};

    final List<String> lines = m3u.split('\n');
    int headerStartIndex = -1;
    for (int i = 0; i < lines.length; i++) {
      if (lines[i].trim().startsWith('#EXTM3U')) {
        headerStartIndex = i;
        break;
      }
    }

    if (headerStartIndex == -1) {
      return output;
    }

    // --- Parsing header M3U attributes ---
    final String headerLine = lines[headerStartIndex];
    final headerMetadataRegex = RegExp(r'([^\s=]+)="([^"]*)"');
    for (final match in headerMetadataRegex.allMatches(headerLine)) {
      final key = _toCamelCase(match.group(1)!);
      final value = match.group(2)!;
      output[key] = value;
    }

    // --- Parsing each item ---
    Map<String, dynamic> currentItemProps = {};
    for (final line in lines.sublist(headerStartIndex + 1)) {
      final trimmedLine = line.trim();
      if (trimmedLine.isEmpty) {
        continue;
      }

      if (trimmedLine.startsWith('#')) {
        if (trimmedLine.startsWith('#EXTINF:')) {
          final infoLine = trimmedLine.substring(8);
          final propsMap = <String, String>{};
          final metadataRegex = RegExp(r'([^\s=]+)="([^"]*)"');
          for (final match in metadataRegex.allMatches(infoLine)) {
            final key = _toCamelCase(match.group(1)!);
            final value = match.group(2)!;
            propsMap[key] = value;
          }

          final durationMatch = RegExp(r'^-?\d+').firstMatch(infoLine);
          final duration = num.tryParse(durationMatch?.group(0) ?? '0') ?? 0;

          String name = propsMap['tvgName'] ?? '';
          if (name.isEmpty && infoLine.contains(',')) {
            name = infoLine.substring(infoLine.lastIndexOf(',') + 1).trim();
          }

          currentItemProps.addAll({
            'name': name,
            'duration': duration,
            'tvgId': propsMap['tvgId'] ?? '',
            'tvgLogo': propsMap['tvgLogo'] ?? '',
            'groupTitle': propsMap['groupTitle'] ?? '',
            ...propsMap,
          });
        } else {
          final tagNameEndIndex = trimmedLine.indexOf(':');
          if (tagNameEndIndex != -1) {
            final tagName = _toCamelCase(
              trimmedLine.substring(1, tagNameEndIndex).trim(),
            );
            if (tagName.isNotEmpty) {
              final content = trimmedLine.substring(tagNameEndIndex + 1).trim();
              if (!currentItemProps.containsKey(tagName)) {
                currentItemProps[tagName] = <String>[];
              }
              (currentItemProps[tagName] as List<String>).add(content);
            }
          } else if (trimmedLine.contains('=')) {
            final parts = trimmedLine.substring(1).split('=');
            if (parts.length == 2 && parts[0].trim().isNotEmpty) {
              final key = _toCamelCase(parts[0].trim());
              final value = parts[1].replaceAll('"', '').trim();
              currentItemProps[key] = value;
            }
          } else {
            final key = _toCamelCase(trimmedLine.substring(1).trim());
            if (key.isNotEmpty) {
              currentItemProps[key] = true;
            }
          }
        }
      } else {
        // It's a URL, so we finalize the current item
        final item = <String, dynamic>{
          ...currentItemProps,
          'urls': [trimmedLine],
        };

        if (item.containsKey('name') || (item['urls'] as List).isNotEmpty) {
          output['items'].add(item);
        }
        
        currentItemProps = {}; // Reset for the next entry
      }
    }

    output['total'] = (output['items'] as List).length;
    return output;
  }
}
