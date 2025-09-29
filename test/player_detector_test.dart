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

import 'package:flutter_test/flutter_test.dart';
import 'package:pusoo/features/video_player/domain/entities/video_player_type.dart';
import 'package:pusoo/shared/utils/player_detector.dart';

void main() async {
  group('PlayerDetectorTest', () {
    test('test:1', () async {
      final result = PlayerDetector.fromUrl(
        "https://www.youtube.com/watch?v=dQw4w9WgXcQ",
      );

      expect(result.type, equals(VideoPlayerType.youtube));
    });

    test('test:2', () async {
      final result = PlayerDetector.fromUrl("https://youtu.be/dQw4w9WgXcQ");

      expect(result.type, equals(VideoPlayerType.youtube));
      expect(result.youtubeVideoId, equals("dQw4w9WgXcQ"));
    });

    test('test:3', () async {
      final result = PlayerDetector.fromUrl(
        "https://m.youtube.com/watch?v=dQw4w9WgXcQ",
      );

      expect(result.type, equals(VideoPlayerType.youtube));
      expect(result.youtubeVideoId, equals("dQw4w9WgXcQ"));
    });

    test('test:4', () async {
      final result = PlayerDetector.fromUrl("https://example.com/video.m3u8");

      expect(result.type, equals(VideoPlayerType.betterPlayer));
      expect(result.isBetterPlayer, equals(true));
    });

    test('test:5', () async {
      final result = PlayerDetector.fromUrl(
        "https://www.youtube.com/watch?v=dQw4w9WgXcQ",
      );

      expect(
        result.youtubeEmbedUrl,
        equals("https://www.youtube.com/embed/dQw4w9WgXcQ"),
      );
    });

    test('test:6', () async {
      final result = PlayerDetector.fromUrl("invalid-url");

      expect(result.type, equals(VideoPlayerType.betterPlayer));
      expect(result.youtubeVideoId, isNull);
    });

    test('test:7', () async {
      final result = PlayerDetector.fromUrl(
        "https://www.example.com/video-name.avi",
      );

      expect(result.type, equals(VideoPlayerType.mediaKit));
    });
  });
}
