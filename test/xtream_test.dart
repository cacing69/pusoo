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
import 'package:pusoo/core/utils/xtream.dart';

void main() async {
  group('XtreamTest', () {
    test('test: larache.pro - basic m3u with output', () async {
      final String url =
          "http://larache.pro/get.php?username=45842714960542&password=24986462836423&type=m3u&output=ts";

      final Xtream xtream = Xtream.fromUrl(url);

      expect(xtream.host, equals("http://larache.pro"));
      expect(xtream.username, equals("45842714960542"));
      expect(xtream.password, equals("24986462836423"));
      expect(xtream.port, equals(80));
      expect(xtream.type, equals("m3u"));
      expect(xtream.output, equals("ts"));
      expect(xtream.isValid, equals(true));
    });

    test('test: vipboacnn.top - m3u with port 8080', () async {
      final String url =
          "http://vipboacnn.top:8080/get.php?username=Germanaguilar&password=Germanaguilar2024&type=m3u";

      final Xtream xtream = Xtream.fromUrl(url);

      expect(xtream.host, equals("http://vipboacnn.top"));
      expect(xtream.username, equals("Germanaguilar"));
      expect(xtream.password, equals("Germanaguilar2024"));
      expect(xtream.port, equals(8080));
      expect(xtream.type, equals("m3u"));
      expect(xtream.isValid, equals(true));
      expect(xtream.output, equals(""));
    });

    test('test: vipvodtx.xyz - m3u_plus with mpegts output', () async {
      final String url =
          "http://vipvodtx.xyz:8080/get.php?username=VOD0176173538414492&password=91735384144872&type=m3u_plus&output=mpegts";

      final Xtream xtream = Xtream.fromUrl(url);

      expect(xtream.host, equals("http://vipvodtx.xyz"));
      expect(xtream.username, equals("VOD0176173538414492"));
      expect(xtream.password, equals("91735384144872"));
      expect(xtream.port, equals(8080));
      expect(xtream.type, equals("m3u_plus"));
      expect(xtream.output, equals("mpegts"));
    });

    test('test: line.queen-4k.cc - m3u_plus with mpegts output', () async {
      final String url =
          "http://line.queen-4k.cc/get.php?username=6D2A4754&password=2F7488F9&type=m3u_plus&output=mpegts";

      final Xtream xtream = Xtream.fromUrl(url);

      expect(xtream.host, equals("http://line.queen-4k.cc"));
      expect(xtream.username, equals("6D2A4754"));
      expect(xtream.password, equals("2F7488F9"));
      expect(xtream.port, equals(80));
      expect(xtream.type, equals("m3u_plus"));
      expect(xtream.output, equals("mpegts"));
    });

    test('test: goats.one - m3u_plus with m3u8 output', () async {
      final String url =
          "http://goats.one/get.php?username=829833711&password=292758303&type=m3u_plus&output=m3u8";

      final Xtream xtream = Xtream.fromUrl(url);

      expect(xtream.host, equals("http://goats.one"));
      expect(xtream.username, equals("829833711"));
      expect(xtream.password, equals("292758303"));
      expect(xtream.port, equals(80));
      expect(xtream.type, equals("m3u_plus"));
      expect(xtream.output, equals("m3u8"));
    });

    test('test: petica.info - m3u_plus with ts output', () async {
      final String url =
          "http://petica.info/get.php?username=Brankolukic023&password=6VMKzC&type=m3u_plus&output=ts";

      final Xtream xtream = Xtream.fromUrl(url);

      expect(xtream.host, equals("http://petica.info"));
      expect(xtream.username, equals("Brankolukic023"));
      expect(xtream.password, equals("6VMKzC"));
      expect(xtream.port, equals(80));
      expect(xtream.type, equals("m3u_plus"));
      expect(xtream.output, equals("ts"));
    });

    test('test: vipforj.top - m3u_plus with mpegts output', () async {
      final String url =
          "http://vipforj.top:8080/get.php?username=VIP0176173538414492&password=11735384144745&type=m3u_plus&output=mpegts";

      final Xtream xtream = Xtream.fromUrl(url);

      expect(xtream.host, equals("http://vipforj.top"));
      expect(xtream.username, equals("VIP0176173538414492"));
      expect(xtream.password, equals("11735384144745"));
      expect(xtream.port, equals(8080));
      expect(xtream.type, equals("m3u_plus"));
      expect(xtream.output, equals("mpegts"));
    });

    test('test: talibanul.net - m3u_plus without output', () async {
      final String url =
          "http://talibanul.net:8080/get.php?username=Terturian_Marincas&password=efihewifheoijfoi&type=m3u_plus";

      final Xtream xtream = Xtream.fromUrl(url);

      expect(xtream.host, equals("http://talibanul.net"));
      expect(xtream.username, equals("Terturian_Marincas"));
      expect(xtream.password, equals("efihewifheoijfoi"));
      expect(xtream.port, equals(8080));
      expect(xtream.type, equals("m3u_plus"));
    });

    test('test: pamporea.xyz - m3u_plus without output', () async {
      final String url =
          "http://pamporea.xyz:8080/get.php?username=AN227436&password=F5bfP3499iuRxKmm7pb2HjDZKITFDj&type=m3u_plus";

      final Xtream xtream = Xtream.fromUrl(url);

      expect(xtream.host, equals("http://pamporea.xyz"));
      expect(xtream.username, equals("AN227436"));
      expect(xtream.password, equals("F5bfP3499iuRxKmm7pb2HjDZKITFDj"));
      expect(xtream.port, equals(8080));
      expect(xtream.type, equals("m3u_plus"));
    });

    test('test: vocotv.pro - m3u_plus without output', () async {
      final String url =
          "http://vocotv.pro/get.php?username=10&password=12345&type=m3u_plus";

      final Xtream xtream = Xtream.fromUrl(url);

      expect(xtream.host, equals("http://vocotv.pro"));
      expect(xtream.username, equals("10"));
      expect(xtream.password, equals("12345"));
      expect(xtream.port, equals(80));
      expect(xtream.type, equals("m3u_plus"));
    });

    test('test: g-med.xyz - m3u with custom port and ts output', () async {
      final String url =
          "http://g-med.xyz:25461/get.php?username=snezana@fidancev&password=br3HbLDbmjTY&type=m3u&output=ts";

      final Xtream xtream = Xtream.fromUrl(url);

      expect(xtream.host, equals("http://g-med.xyz"));
      expect(xtream.username, equals("snezana@fidancev"));
      expect(xtream.password, equals("br3HbLDbmjTY"));
      expect(xtream.port, equals(25461));
      expect(xtream.type, equals("m3u"));
      expect(xtream.output, equals("ts"));
    });

    test('test: mains.vip - m3u with URL encoded password', () async {
      final String url =
          "http://mains.vip/get.php?username=pmf0423&password=1aku0jt%40&type=m3u";

      final Xtream xtream = Xtream.fromUrl(url);

      expect(xtream.host, equals("http://mains.vip"));
      expect(xtream.username, equals("pmf0423"));
      expect(xtream.password, equals("1aku0jt@"));
      expect(xtream.port, equals(80));
      expect(xtream.type, equals("m3u"));
    });

    test('test: 164.215.98.132 - IP address with custom port', () async {
      final String url =
          "http://164.215.98.132:2082/get.php?username=05312993875&password=52G826825G&type=m3u_plus&output=ts";

      final Xtream xtream = Xtream.fromUrl(url);

      expect(xtream.host, equals("http://164.215.98.132"));
      expect(xtream.username, equals("05312993875"));
      expect(xtream.password, equals("52G826825G"));
      expect(xtream.port, equals(2082));
      expect(xtream.type, equals("m3u_plus"));
      expect(xtream.output, equals("ts"));
    });

    test('test: vipvodge.top - m3u_plus with mpegts output', () async {
      final String url =
          "http://vipvodge.top:8080/get.php?username=VOD2661728938595004&password=293554fc0bb5&type=m3u_plus&output=mpegts";

      final Xtream xtream = Xtream.fromUrl(url);

      expect(xtream.host, equals("http://vipvodge.top"));
      expect(xtream.username, equals("VOD2661728938595004"));
      expect(xtream.password, equals("293554fc0bb5"));
      expect(xtream.port, equals(8080));
      expect(xtream.type, equals("m3u_plus"));
      expect(xtream.output, equals("mpegts"));
    });

    test('test: hardcoremedia.xyz - m3u without output', () async {
      final String url =
          "http://hardcoremedia.xyz/get.php?username=ymgiaxkw&password=5Hr5ZQuVfU&type=m3u";

      final Xtream xtream = Xtream.fromUrl(url);

      expect(xtream.host, equals("http://hardcoremedia.xyz"));
      expect(xtream.username, equals("ymgiaxkw"));
      expect(xtream.password, equals("5Hr5ZQuVfU"));
      expect(xtream.port, equals(80));
      expect(xtream.type, equals("m3u"));
    });

    test('test: vipvodle.top - m3u without output', () async {
      final String url =
          "http://vipvodle.top:8080/get.php?username=VOD2121741705273004&password=841cd28c1f31&type=m3u";

      final Xtream xtream = Xtream.fromUrl(url);

      expect(xtream.host, equals("http://vipvodle.top"));
      expect(xtream.username, equals("VOD2121741705273004"));
      expect(xtream.password, equals("841cd28c1f31"));
      expect(xtream.port, equals(8080));
      expect(xtream.type, equals("m3u"));
    });

    test('test: tvpromas.com - m3u with mpegts output', () async {
      final String url =
          "http://tvpromas.com:2082/get.php?username=2025XChinaxPor2025&password=56yCCTvdyF5H&type=m3u&output=mpegts";

      final Xtream xtream = Xtream.fromUrl(url);

      expect(xtream.host, equals("http://tvpromas.com"));
      expect(xtream.username, equals("2025XChinaxPor2025"));
      expect(xtream.password, equals("56yCCTvdyF5H"));
      expect(xtream.port, equals(2082));
      expect(xtream.type, equals("m3u"));
      expect(xtream.output, equals("mpegts"));
      expect(xtream.isValid, equals(true));
    });

    // Test invalid URLs
    test('test: invalid URL - missing username', () async {
      final String url = "http://example.com/get.php?password=123&type=m3u";
      final Xtream xtream = Xtream.fromUrl(url);

      expect(xtream.isValid, equals(false));
    });

    test('test: invalid URL - missing password', () async {
      final String url = "http://example.com/get.php?username=test&type=m3u";
      final Xtream xtream = Xtream.fromUrl(url);

      expect(xtream.isValid, equals(false));
    });

    test('test: invalid URL - missing type', () async {
      final String url =
          "http://example.com/get.php?username=test&password=123";
      final Xtream xtream = Xtream.fromUrl(url);

      expect(xtream.isValid, equals(false));
    });

    test('test: invalid URL - invalid type', () async {
      final String url =
          "http://example.com/get.php?username=test&password=123&type=invalid";
      final Xtream xtream = Xtream.fromUrl(url);

      expect(xtream.isValid, equals(false));
    });

    test('test: invalid URL - invalid port', () async {
      final String url =
          "http://example.com:99999/get.php?username=test&password=123&type=m3u";
      final Xtream xtream = Xtream.fromUrl(url);

      expect(xtream.isValid, equals(false));
    });

    test('test: invalid URL - malformed URL', () async {
      final String url = "not-a-valid-url";
      final Xtream xtream = Xtream.fromUrl(url);

      expect(xtream.isValid, equals(false));
    });
  });
}
