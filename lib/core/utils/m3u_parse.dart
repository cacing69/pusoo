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

    // --- Clean up irrelevant data at the beginning of the file ---
    final List<String> lines = m3u.split('\n');
    int headerStartIndex = -1;
    for (int i = 0; i < lines.length; i++) {
      if (lines[i].startsWith('#EXTM3U')) {
        headerStartIndex = i;
        break;
      }
    }

    if (headerStartIndex == -1) {
      return output;
    }

    final String cleanedM3u = lines.sublist(headerStartIndex).join('\n');

    final List<String> parts = cleanedM3u.split('#EXTINF:');

    // --- Parsing header M3U (if present) ---
    final String header = parts.removeAt(0);
    final List<String> headerLines = header.split('\n');
    for (final line in headerLines) {
      if (line.contains('=')) {
        final lineParts = line.replaceAll('"', '').split('=');
        if (lineParts.length == 2 && lineParts[0].trim().isNotEmpty) {
          output[_toCamelCase(lineParts[0].trim())] = lineParts[1].trim();
        }
      }
    }

    // --- Parsing each item ---
    for (final part in parts) {
      final Map<String, dynamic> item = {'urls': []};
      final List<String> itemLines = part
          .split('\n')
          .where((l) => l.trim().isNotEmpty)
          .toList();

      for (final line in itemLines) {
        if (line.startsWith('-') || line.startsWith(RegExp(r'\d'))) {
          // --- Extract all key="value" metadata ---
          final Map<String, String> propsMap = {};
          final metadataRegex = RegExp(r'([^\s=]+)="([^"]*)"');
          for (final match in metadataRegex.allMatches(line)) {
            final key = _toCamelCase(match.group(1)!);
            final value = match.group(2)!;
            propsMap[key] = value;
          }

          final durationMatch = RegExp(r'^-?\d+').firstMatch(line);
          final num duration =
              num.tryParse(durationMatch?.group(0) ?? '0') ?? 0;

          final String name =
              propsMap['tvgName'] ??
              (line.contains(',')
                  ? line.substring(line.lastIndexOf(',') + 1).trim()
                  : '');

          item.addAll({
            'name': name,
            'duration': duration,
            'tvgId': propsMap['tvgId'] ?? '',
            'tvgLogo': propsMap['tvgLogo'] ?? '',
            'groupTitle': propsMap['groupTitle'] ?? '',
            ...propsMap,
          });
        } else if (line.startsWith('#')) {
          final tagNameEndIndex = line.indexOf(':');
          if (tagNameEndIndex != -1) {
            final tagName = _toCamelCase(
              line.substring(1, tagNameEndIndex).trim(),
            );
            if (tagName.isNotEmpty) {
              final content = line.substring(tagNameEndIndex + 1).trim();

              // Perubahan: Mengelompokkan ke dalam list
              if (!item.containsKey(tagName)) {
                item[tagName] = [];
              }
              (item[tagName] as List).add(content);
            }
          } else if (line.contains('=')) {
            final parts = line.substring(1).split('=');
            if (parts.length == 2 && parts[0].trim().isNotEmpty) {
              final key = _toCamelCase(parts[0].trim());
              final value = parts[1].replaceAll('"', '').trim();
              item[key] = value;
            }
          } else {
            final key = _toCamelCase(line.substring(1).trim());
            if (key.isNotEmpty) {
              item[key] = true;
            }
          }
        } else {
          item['urls'].add(line.trim());
        }
      }

      if (item['name'] != null || (item['urls'] as List).isNotEmpty) {
        output['items'].add(item);
      }
    }

    output['total'] = (output['items'] as List).length;
    return output;
  }
}
