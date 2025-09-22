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
import 'package:pusoo/core/utils/playlist_name_extractor.dart';

void main() async {
  group('PlaylistNameExtractorTest', () {
    test('test:1', () async {
      final url = "https://example.com/patg/sub/IPTV-ipv4.m3u";
      final result = PlaylistNameExtractor.fromUrl(url);

      expect(result.name, equals("IPTV-ipv4.m3u"));
    });

    test('test:2', () async {
      final url = "https://example.com/patg/sub/IPTV-ipv4";
      final result = PlaylistNameExtractor.fromUrl(url);

      expect(result.name, equals("IPTV-ipv4.m3u"));
    });

    test('test:2.1', () async {
      final url = "https://example.com/patg/sub/-IPTV-ipv4";
      final result = PlaylistNameExtractor.fromUrl(url);

      expect(result.name, equals("IPTV-ipv4.m3u"));
    });

    test('test:2.2', () async {
      final url = "https://example.com/patg/sub/_IPTV-ipv4";
      final result = PlaylistNameExtractor.fromUrl(url);

      expect(result.name, equals("IPTV-ipv4.m3u"));
    });
    test('test:2.2', () async {
      final url = "https://example.com/patg/sub/_-IPTV-ipv4";
      final result = PlaylistNameExtractor.fromUrl(url);

      expect(result.name, equals("IPTV-ipv4.m3u"));
    });
    test('test:2.3', () async {
      final url = "https://example.com/patg/sub/_-I-PTV-ipv4";
      final result = PlaylistNameExtractor.fromUrl(url);

      expect(result.name, equals("I-PTV-ipv4.m3u"));
    });

    test('test:3', () async {
      final url = "https://example.com/patg/sub/-IPTV-ipv4.";
      final result = PlaylistNameExtractor.fromUrl(url);

      expect(result.name, equals("IPTV-ipv4.m3u"));
    });

    test('test:4', () async {
      final url = "https://example.com/patg/sub/.IPTV-ipv4.";
      final result = PlaylistNameExtractor.fromUrl(url);

      expect(result.name, equals("IPTV-ipv4.m3u"));
    });
    test('test:5', () async {
      final url = "https://example.com/patg/sub/.&***&^IPTV-ipv4.";
      final result = PlaylistNameExtractor.fromUrl(url);

      expect(result.name, equals("IPTV-ipv4.m3u"));
    });

    test('test:6', () async {
      // hanya memperbolehkan karakter alfanumerik -_
      final url = "https://example.com/patg/sub/.&***&^IPT)(&&^V-ipv4.";
      final result = PlaylistNameExtractor.fromUrl(url);

      expect(result.name, equals("IPTV-ipv4.m3u"));
    });

    test('test:7', () async {
      // hanya memperbolehkan karakter alfanumerik -_
      final url = "https://example.com/patg/sub/.&***&@#^I)P\$T)(&&^V-ip%&v*4.";
      final result = PlaylistNameExtractor.fromUrl(url);

      expect(result.name, equals("IPTV-ipv4.m3u"));
    });

    test('test:8', () async {
      // hanya memperbolehkan karakter alfanumerik -_
      final url = "https://example.com/patg/sub/";
      final result = PlaylistNameExtractor.fromUrl(url);

      expect(result.name, equals("sub.m3u"));
    });
  });
}
