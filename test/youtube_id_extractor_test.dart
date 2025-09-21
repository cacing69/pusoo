/*
 * Pusoo - IPTV Player
 * Copyright (C) 2025 Ibnul Mutaki
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
