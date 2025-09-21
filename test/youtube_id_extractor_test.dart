// Copyright (c) 2025, Ibnul Mutaki (@cacing69)
// Licensed under the MIT License
// Pusoo - Open Source IPTV Player
// GitHub: https://github.com/cacing69/pusoo

import 'package:flutter_test/flutter_test.dart';
import 'package:pusoo/core/utils/youtube_id_extractor.dart';

void main() async {
  group('YoutubeIdExtractorTest', () {
    test('test:1 - Extract ID from YouTube URL', () async {
      final url = "https://youtube.com/watch?v=dQw4w9WgXcQ";

      final result = YoutubeIdExtractor.extract(url);

      expect(result, equals("dQw4w9WgXcQ"));
    });

    test('test:2 - Extract ID from youtu.be URL', () async {
      final url = "https://youtu.be/dQw4w9WgXcQ";

      final result = YoutubeIdExtractor.extract(url);

      expect(result, equals("dQw4w9WgXcQ"));
    });

    test('test:3 - Extract ID from mobile YouTube URL', () async {
      final url = "https://m.youtube.com/watch?v=dQw4w9WgXcQ";

      final result = YoutubeIdExtractor.extract(url);

      expect(result, equals("dQw4w9WgXcQ"));
    });

    test('test:4 - Invalid URL returns null', () async {
      final url = "https://example.com/video.m3u8";

      final result = YoutubeIdExtractor.extract(url);

      expect(result, isNull);
    });
  });
}
