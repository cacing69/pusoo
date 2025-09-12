abstract class M3uUtils {
  /// Parse M3U content and return a structured map
  static Map<String, dynamic> parse(String m3u) {
    final Map<String, dynamic> output = {'items': [], 'total': 0};

    // Split by each EXTINF entry
    List<String> m3uSplit = m3u.split('#EXTINF:');

    // --- Parsing header M3U (jika ada) ---
    if (m3uSplit.isNotEmpty) {
      final String header = m3uSplit.removeAt(0);
      final List<String> headerLines = header.split('\n');
      for (String line in headerLines) {
        if (line.contains('=')) {
          final parts = line.replaceAll('"', '').split('=');
          if (parts.length == 2) {
            output[parts[0].trim()] = parts[1].trim();
          }
        }
      }
    }

    // --- Parsing tiap item ---
    for (String part in m3uSplit) {
      final Map<String, dynamic> item = {'urls': []};
      final List<String> lines = part
          .split('\n')
          .where((l) => l.trim().isNotEmpty)
          .toList();

      for (var line in lines) {
        final bool isMeta = RegExp(r'^-?\d').hasMatch(line);
        if (isMeta) {
          // --- Ambil semua metadata key="value" ---
          final Map<String, String> propsMap = {};
          final metadataRegex = RegExp(r'([^\s=]+)="([^"]*)"');
          for (final match in metadataRegex.allMatches(line)) {
            final key = match.group(1)!;
            final value = match.group(2)!;
            propsMap[key] = value;
          }

          // Ambil durasi
          final durationMatch = RegExp(r'^-?\d+').firstMatch(line);
          final num duration = num.tryParse(durationMatch?.group(0) ?? '') ?? 0;

          // Ambil judul
          final String name =
              propsMap['tvg-name'] ??
              (line.contains(',')
                  ? line.substring(line.lastIndexOf(',') + 1).trim()
                  : '');

          // Masukkan semua metadata penting
          item.addAll({
            'name': name,
            'duration': duration,
            'tvgId': propsMap['tvg-id'] ?? '',
            'tvgLogo': propsMap['tvg-logo'] ?? '',
            'groupTitle': propsMap['group-title'] ?? '',
            ...propsMap,
          });
        } else {
          // Ambil URL
          if (line.contains('://')) {
            item['urls'].add(line.trim());
          }
        }
      }

      output['items'].add(item);
    }

    output['total'] = (output['items'] as List).length;
    return output;
  }
}
