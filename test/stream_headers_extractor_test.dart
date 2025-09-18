// Copyright (c) 2025, Ibnul Mutaki (@cacing69)
// Licensed under the MIT License
// Pusoo - Open Source IPTV Player
// GitHub: https://github.com/cacing69/pusoo

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
    
    test('test:3', () async {
      final String kodiProp = r'''
{"X-TCDN-token":"eyJhbGciOiJFUzI1NiIsImtpZCI6ImI1OGNhNGM0NGFiOTQ0Y2FiY2U4N2FjNGJmZmI4MDNkIiwidHlwIjoiYXQrand0In0.eyJuYmYiOjE3NTc1NDQzMTMsImV4cCI6MTc1NzYzMDcxMywiaXNzIjoiaHR0cHM6Ly9pZHNlcnZlci5kb2Y2LmNvbSIsImF1ZCI6InRjZG4iLCJjbGllbnRfaWQiOiJtb3Zpc3RhcnBsdXMiLCJzdWIiOiI3YTdmN3Y4QzhUOGc4diIsImF1dGhfdGltZSI6MTc1NzU0NDMxMywiaWRwIjoibW92aXN0YXIrIiwidWlkIjoiTlRzU21NUjFKQ0tyT3NTS3RETlJCRE5paUZ5S1IrS291SFFFMEExUmhpbz0iLCJhY2MiOiJTSU8vRnlhclFNaVB6ZmtqOEJjdDY0VUZFcTZLbEJoK0JBeHhmYzR4YWJjPSIsImp0aSI6IkM1QjRGNDA2RUE4OTE1QjNGNkIxRTlGOTBCOTgzM0ZFIiwiaWF0IjoxNzU3NTQ0MzEzLCJzY29wZSI6ImNkbiJ9.IW1RBlKWQGSWFsVyI-ORgFnjTKep-W5t3V4GdA7YSI--xKG2rx2SbFvsOSRusVkbd7VXiRy64l1VR39HpBEsCA"}
''';

      final result = StreamHeadersExtractor.extract(kodiProp);

      expect(true, equals(result.containsKey("X-TCDN-token")));

      expect("eyJhbGciOiJFUzI1NiIsImtpZCI6ImI1OGNhNGM0NGFiOTQ0Y2FiY2U4N2FjNGJmZmI4MDNkIiwidHlwIjoiYXQrand0In0.eyJuYmYiOjE3NTc1NDQzMTMsImV4cCI6MTc1NzYzMDcxMywiaXNzIjoiaHR0cHM6Ly9pZHNlcnZlci5kb2Y2LmNvbSIsImF1ZCI6InRjZG4iLCJjbGllbnRfaWQiOiJtb3Zpc3RhcnBsdXMiLCJzdWIiOiI3YTdmN3Y4QzhUOGc4diIsImF1dGhfdGltZSI6MTc1NzU0NDMxMywiaWRwIjoibW92aXN0YXIrIiwidWlkIjoiTlRzU21NUjFKQ0tyT3NTS3RETlJCRE5paUZ5S1IrS291SFFFMEExUmhpbz0iLCJhY2MiOiJTSU8vRnlhclFNaVB6ZmtqOEJjdDY0VUZFcTZLbEJoK0JBeHhmYzR4YWJjPSIsImp0aSI6IkM1QjRGNDA2RUE4OTE1QjNGNkIxRTlGOTBCOTgzM0ZFIiwiaWF0IjoxNzU3NTQ0MzEzLCJzY29wZSI6ImNkbiJ9.IW1RBlKWQGSWFsVyI-ORgFnjTKep-W5t3V4GdA7YSI--xKG2rx2SbFvsOSRusVkbd7VXiRy64l1VR39HpBEsCA", equals(result["X-TCDN-token"]));
    });
  });
}
