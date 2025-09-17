import 'package:flutter_test/flutter_test.dart';
import 'package:pusoo/core/utils/stream_headers_extractor.dart';

void main() async {
  group('StreamHeadersExtractorTest', () {
    test('test:1', () async {
      final String kodiProp = r'''
referer=https://astrogo.astro.com.my//&user-agent=Mozilla/5.0 (Linux; Android 10; MI 9 Build/QKQ1.190825.002; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/111.0.5563.58 Mobile Safari/537.36
''';

      final result = StreamHeadersExtractor.extract(kodiProp);

      expect(true, equals(result.containsKey("referer")));
      expect(true, equals(result.containsKey("user-agent")));

      expect("https://astrogo.astro.com.my//", equals(result["referer"]));
      expect(
        "Mozilla/5.0 (Linux; Android 10; MI 9 Build/QKQ1.190825.002; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/111.0.5563.58 Mobile Safari/537.36",
        equals(result["user-agent"]),
      );
    });
    
    test('test:2', () async {
      final String kodiProp = r'''
User-Agent=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36
''';

      final result = StreamHeadersExtractor.extract(kodiProp);

      expect(true, equals(result.containsKey("user-agent")));

      expect("Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36", equals(result["user-agent"]));
    });
  });
}
