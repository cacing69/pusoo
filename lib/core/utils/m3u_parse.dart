abstract class M3uUtils {
  static Map<String, dynamic> parse(String m3u) {
    final Map<String, dynamic> output = {'items': [], 'total': 0};
    List<String> m3uSplit = m3u.split('#EXTINF:');
    final String title = m3uSplit.removeAt(0);
    final List<String> titleProps = title.split('\n').first.split(' ');
    for (String prop in titleProps) {
      if (prop.contains('=')) {
        prop = prop.replaceAll('"', '');
        prop = prop.replaceAll('\'', '');
        final data = prop.split('=');
        output.update(
          data.first.trim(),
          (_) => data.last.trim(),
          ifAbsent: () => data.last.trim(),
        );
      }
    }

    ({String key, String value}) beautiProp(String propInput) {
      final String prop = propInput
          .replaceAll('"', '')
          .replaceAll('\'', '')
          .trim();
      final List<String> propSplit = prop.split('=');
      return (key: propSplit.first, value: propSplit.sublist(1).join('='));
    }

    for (String part in m3uSplit) {
      final Map<String, dynamic> item = {'urls': []};
      final List<String> lines = part.split('\n');

      for (var line in lines) {
        final bool isMeta =
            RegExp(r'^[-,\d]').hasMatch(line) && line.contains(',');
        if (isMeta) {
          final List<String> lineSplit = line.split(',');
          final List<String> props = lineSplit.first.split(' ');
          final num duration = num.tryParse(props.removeAt(0)) ?? 0;
          final List<String> namedProps = props.join(" ").split('" ')
            ..removeWhere((element) => element.isEmpty);
          item.addAll({
            'name': lineSplit.lastOrNull?.trim() ?? '',
            'duration': duration,
            for (var prop in namedProps)
              beautiProp(prop).key: beautiProp(prop).value,
          });
        } else {
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
