// Copyright (c) 2025, Ibnul Mutaki (@cacing69)
// Licensed under the MIT License
// Pusoo - Open Source IPTV Player
// GitHub: https://github.com/cacing69/pusoo

import 'package:flutter_test/flutter_test.dart';
import 'package:pusoo/core/utils/player_detector.dart';

void main() async {
  group('PlayerDetectorTest', () {
    test('test:1', () async {
      final result = PlayerDetector.fromUrl(
        "https://www.youtube.com/watch?v=dQw4w9WgXcQ",
      );

      expect(result.type, equals(PlayerType.youtube));
    });

    test('test:2', () async {
      final result = PlayerDetector.fromUrl("https://youtu.be/dQw4w9WgXcQ");

      expect(result.type, equals(PlayerType.youtube));
      expect(result.youtubeVideoId, equals("dQw4w9WgXcQ"));
    });

    test('test:3', () async {
      final result = PlayerDetector.fromUrl(
        "https://m.youtube.com/watch?v=dQw4w9WgXcQ",
      );

      expect(result.type, equals(PlayerType.youtube));
      expect(result.youtubeVideoId, equals("dQw4w9WgXcQ"));
    });

    test('test:4', () async {
      final result = PlayerDetector.fromUrl("https://example.com/video.m3u8");

      expect(result.type, equals(PlayerType.betterPlayer));
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

      expect(result.type, equals(PlayerType.betterPlayer));
      expect(result.youtubeVideoId, isNull);
    });
  });
}
