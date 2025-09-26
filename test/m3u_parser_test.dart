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
import 'package:pusoo/shared/utils/m3u_parser.dart';
import 'package:pusoo/features/track/domain/models/track.dart';

void main() async {
  group('M3UParser Test', () {
    test('testLastTrack', () async {
      final String content = r'''
#EXTINF:-1 group-title="CHANNEL | VISION+" ch-number="79" tvg-logo="https://raw.githubusercontent.com/MayToko/Kopi/main/Logo%20maytoko.png",Hanacaraka, Lorem Ipsum
#EXTVLCOPT:http-user-agent=Mozilla/5.0 (Linux; Android 14; SM-A245F Build/UP1A.231005.007; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/124.0.6367.204 Mobile Safari/537.36
http://202.80.222.20/cdn/iptv/Tvod/001/channel2000020/1024.m3u8
''';

      List<Track> check = M3UParser.parse(content);

      Track item = check[check.length - 1];

      expect(item.title, equals("Hanacaraka, Lorem Ipsum"));
    });

    test('testUrlIncludeHttpHeaderUserAgent', () async {
      final String content = r'''
#EXTINF:-1 group-title="CHANNEL | VISION+" ch-number="12" tvg-logo="https://raw.githubusercontent.com/MayToko/Kopi/main/Logo%20maytoko.png",SCTV
#EXTVLCOPT:http-user-agent=Mozilla/5.0 (Linux; Android 14; SM-A245F Build/UP1A.231005.007; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/124.0.6367.204 Mobile Safari/537.36
https://op-group1-swiftservehd-1.dens.tv/h/h217/02.m3u8|user-agent=DENSGO/3.00.00 (Linux;Android 15.0.0;) ExoPlayerLib/2.19.1
''';
      List<Track> result = M3UParser.parse(content);

      Track item = result.first;

      Map<String, String> httpHeaders = item.httpHeaders.first;

      expect(
        item.links.first,

        equals("https://op-group1-swiftservehd-1.dens.tv/h/h217/02.m3u8"),
      );

      expect(httpHeaders.containsKey("user-agent"), equals(true));

      expect(
        httpHeaders["user-agent"],
        equals("DENSGO/3.00.00 (Linux;Android 15.0.0;) ExoPlayerLib/2.19.1"),
      );
    });

    test('testUrlIncludeHttpHeaderReferrer', () async {
      final String content = r'''
#EXTINF:0 tvg-id="SS4" tvg-logo="https://i.imgur.com/qUYLcS8.png" group-title="CHANNEL | SPORT INDO", SPORTSTARS 4 HD
#EXTVLCOPT:http-user-agent=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36
#KODIPROP:inputstreamaddon=inputstream.adaptive
#KODIPROP:inputstream.adaptive.manifest_type=dash
#KODIPROP:inputstream.adaptive.license_type=clearkey
#KODIPROP:inputstream.adaptive.license_key=b576e5f5f1bc4cbaa866e5b0face5a30:3377be6c3b5f688ebed687312c9b9d95
https://d2xz2v5wuvgur6.cloudfront.net/out/v1/2fcc58ccec8c45e9aa094fb980eb642d/index.mpd|referrer=https://visionplus.id/

''';
      List<Track> result = M3UParser.parse(content);

      Track item = result.first;

      Map<String, String> httpHeaders = item.httpHeaders.first;

      expect(
        item.links.first,
        equals(
          "https://d2xz2v5wuvgur6.cloudfront.net/out/v1/2fcc58ccec8c45e9aa094fb980eb642d/index.mpd",
        ),
      );

      expect(httpHeaders.containsKey("referrer"), equals(true));

      expect(httpHeaders["referrer"], equals("https://visionplus.id/"));
    });

    test('testKodiPropTypeDashAndClearKey', () async {
      final String content = r'''
#EXTINF:0 tvg-id="SS4" tvg-logo="https://i.imgur.com/qUYLcS8.png" group-title="CHANNEL | SPORT INDO", SPORTSTARS 4 HD
#EXTVLCOPT:http-user-agent=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36
#KODIPROP:inputstreamaddon=inputstream.adaptive
#KODIPROP:inputstream.adaptive.manifest_type=dash
#KODIPROP:inputstream.adaptive.license_type=clearkey
#KODIPROP:inputstream.adaptive.license_key=b576e5f5f1bc4cbaa866e5b0face5a30:3377be6c3b5f688ebed687312c9b9d95
https://d2xz2v5wuvgur6.cloudfront.net/out/v1/2fcc58ccec8c45e9aa094fb980eb642d/index.mpd|referrer=https://visionplus.id/

''';
      List<Track> result = M3UParser.parse(content);

      Track item = result.first;

      Map<String, String> kodiProps = item.kodiProps.first;

      expect(kodiProps.containsKey("inputstreamaddon"), equals(true));
      expect(
        kodiProps.containsKey("inputstream.adaptive.manifest_type"),
        equals(true),
      );
      expect(
        kodiProps.containsKey("inputstream.adaptive.license_type"),
        equals(true),
      );
      expect(
        kodiProps.containsKey("inputstream.adaptive.license_key"),
        equals(true),
      );

      // Test Value
      expect(kodiProps["inputstreamaddon"], equals("inputstream.adaptive"));

      expect(kodiProps["inputstream.adaptive.manifest_type"], equals("dash"));

      expect(
        kodiProps["inputstream.adaptive.license_type"],
        equals("clearkey"),
      );

      expect(
        kodiProps["inputstream.adaptive.license_key"],
        equals(
          "b576e5f5f1bc4cbaa866e5b0face5a30:3377be6c3b5f688ebed687312c9b9d95",
        ),
      );
    });

    test('testExtVlcOptWhereHasHttpUserAgent:1', () async {
      final String content = r'''
#EXTINF:0 tvg-id="SS4" tvg-logo="https://i.imgur.com/qUYLcS8.png" group-title="CHANNEL | SPORT INDO", SPORTSTARS 4 HD
#EXTVLCOPT:http-user-agent=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36
#KODIPROP:inputstreamaddon=inputstream.adaptive
#KODIPROP:inputstream.adaptive.manifest_type=dash
#KODIPROP:inputstream.adaptive.license_type=clearkey
#KODIPROP:inputstream.adaptive.license_key=b576e5f5f1bc4cbaa866e5b0face5a30:3377be6c3b5f688ebed687312c9b9d95
https://d2xz2v5wuvgur6.cloudfront.net/out/v1/2fcc58ccec8c45e9aa094fb980eb642d/index.mpd|referrer=https://visionplus.id/

''';
      List<Track> result = M3UParser.parse(content);

      Track item = result.first;

      Map<String, String> extVlcOpts = item.extVlcOpts.first;

      expect(extVlcOpts.containsKey("http-user-agent"), equals(true));

      // Test Value
      expect(
        extVlcOpts["http-user-agent"],
        equals(
          "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36",
        ),
      );
    });

    test('testExtVlcOptWhereHasHttpUserAgentAndReferrer:1', () async {
      final String content = r'''
#EXTINF:0 tvg-logo="https://i.imgur.com/A1hlnLA.png" group-title="CHANNEL | SPORT INDO",Sportstars 2 HD
#KODIPROP:inputstream.adaptive.license_type=clearkey
#KODIPROP:inputstream.adaptive.license_key=911e72adf36946afbdbb4f80782a8394:08aec548a851ba64b7172ae7f05cb91c
#EXTVLCOPT:http-referrer=https://visionplus.id/
#EXTVLCOPT:http-user-agent=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36
https://d3b0v7fggu5zwm.cloudfront.net/out/v1/d2c68a3dfb644808b416bd90dcc92d5f/index.mpd

''';
      List<Track> result = M3UParser.parse(content);

      Track item = result.first;

      Map<String, String> extVlcOpts = item.extVlcOpts.first;

      expect(extVlcOpts.containsKey("http-user-agent"), equals(true));
      expect(extVlcOpts.containsKey("http-referrer"), equals(true));

      // Test Value
      expect(
        extVlcOpts["http-user-agent"],
        equals(
          "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36",
        ),
      );

      expect(extVlcOpts["http-referrer"], equals("https://visionplus.id/"));
    });

    test('testKodiPropsWhereHasDoubleLicenseKeyAndDoubleUrl:1', () async {
      final String content = r'''
#KODIPROP:inputstream.adaptive.license_type=com.widevine.alpha
#KODIPROP:inputstream.adaptive.license_key=https://kingtvpremium.my.id/play/pision/drm.php?id=115
#KODIPROP:inputstream.adaptive.license_key=https://drm-vision2025.tvrusak1992.workers.dev/?no=115&type=drm
##KODIPROP:inputstream.adaptive.license_key=https://terabit.web.id/drmkv.php?id=115&type=drm
#EXTINF:-1 tvg-logo="https://www.visionplus.id/images/repository/655/655-LOGO-m.png" group-title="CHANNEL | SPORT INDO",Soccer Channel (V+)
https://d2xz2v5wuvgur6.cloudfront.net/out/v1/63c0da12bb4d48afbaf053f51dff2353/index.mpd|Referer=https://www.visionplus.id/&user-agent=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36
https://fta4-cdn-flr.visionplus.id/out/v1/63c0da12bb4d48afbaf053f51dff2353/index.mpd|Referer=https://www.visionplus.id/&user-agent=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36
''';
      List<Track> result = M3UParser.parse(content);

      Track item = result.first;

      expect(item.links.length, equals(2));
      expect(item.httpHeaders.length, equals(2));
      expect(item.kodiProps.length, equals(2));

      // LICENSE_KEY
      expect(
        "https://kingtvpremium.my.id/play/pision/drm.php?id=115",
        equals(item.kodiProps[0]["inputstream.adaptive.license_key"]),
      );

      expect(
        "https://drm-vision2025.tvrusak1992.workers.dev/?no=115&type=drm",
        equals(item.kodiProps[1]["inputstream.adaptive.license_key"]),
      );

      // URL
      expect(
        "https://d2xz2v5wuvgur6.cloudfront.net/out/v1/63c0da12bb4d48afbaf053f51dff2353/index.mpd",
        equals(item.links[0]),
      );

      expect(
        "https://fta4-cdn-flr.visionplus.id/out/v1/63c0da12bb4d48afbaf053f51dff2353/index.mpd",
        equals(item.links[1]),
      );

      // HTTP HEADER
      expect(item.httpHeaders[0].containsKey("referer"), equals(true));
      expect(item.httpHeaders[0].containsKey("user-agent"), equals(true));

      expect(
        item.httpHeaders[0]["referer"],
        equals("https://www.visionplus.id/"),
      );
      expect(
        "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36",
        equals(item.httpHeaders[0]["user-agent"]),
      );

      expect(item.httpHeaders[1].containsKey("referer"), equals(true));
      expect(item.httpHeaders[1].containsKey("user-agent"), equals(true));

      expect(
        item.httpHeaders[1]["referer"],
        equals("https://www.visionplus.id/"),
      );
      expect(
        item.httpHeaders[1]["user-agent"],
        equals(
          "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36",
        ),
      );
    });

    test('testKodiPropsWhereNoHashSignOnKodiProps', () async {
      final String content = r'''
KODIPROP:inputstream.adaptive.license_type=com.widevine.alpha
#KODIPROP:inputstream.adaptive.license_key=https://cubmu-cindo.cenc16995.workers.dev/
#KODIPROP:inputstream.adaptive.stream_headers=user-agent=Xstream XGO/1.22 (Linux;Android 9) ExoPlayerLib/2.10.5
#EXTINF:-1 tvg-logo="https://cdnjkt913.transvision.co.id:1000/image/web/channel/4028c6857e04fca5017ec40cec31736f/7a5da94bdbd24ff790b84f892d4aa1e6.png" group-title="CHANNEL | SPORT INDO",Golf+
https://cdnjkt913.transvision.co.id:1000/live/master/3/4028c68571b3914b01720e7ff4376d21/manifest.mpd

''';
      List<Track> result = M3UParser.parse(content);

      Track item = result.first;

      Map<String, String> kodiProps = item.kodiProps.first;

      expect(
        kodiProps.containsKey("inputstream.adaptive.license_type"),
        equals(true),
      );

      expect(
        kodiProps.containsKey("inputstream.adaptive.license_key"),
        equals(true),
      );

      expect(
        kodiProps.containsKey("inputstream.adaptive.stream_headers"),
        equals(true),
      );

      expect(
        kodiProps["inputstream.adaptive.license_type"],
        equals("com.widevine.alpha"),
      );

      expect(
        kodiProps["inputstream.adaptive.license_key"],
        equals("https://cubmu-cindo.cenc16995.workers.dev/"),
      );

      expect(
        kodiProps["inputstream.adaptive.stream_headers"],
        equals(
          "user-agent=Xstream XGO/1.22 (Linux;Android 9) ExoPlayerLib/2.10.5",
        ),
      );
    });

    test('testeGroupTitleMappedIntoCategory', () async {
      final String content = r'''
#EXTINF:-1 tvg-id="--" group-title="CHANNEL | INDONESIA" tvg-logo="https://images.indihometv.com/logo_ochannel_ver1.png", Moji TV
#EXTVLCOPT:http-user-agent=IndiHomeTV/8.7.12 (Linux;Android 15.0.0;) ExoPlayerLib/2.19.1
#EXTVLCOPT:http-referrer=https://www.indihometv.com/
#KODIPROP:inputstreamaddon=inputstream.adaptive
#KODIPROP:inputstream.adaptive.manifest_type=dash
#KODIPROP:inputstream.adaptive.license_type=clearkey
https://cdn08jtedge.indihometv.com/dassdvr/134/ochannel/manifest.mpd

''';
      List<Track> result = M3UParser.parse(content);

      Track item = result.first;

      expect(item.groupTitle, equals("CHANNEL | INDONESIA"));
    });

    test('testeCheckNameAndTvgId:1', () async {
      final String content = r'''
#EXTINF:0 tvg-id="TNT 2" tvg-logo="https://i.ibb.co.com/zmrtkTK/tntsports2.jpg" group-title="CHANNEL | SPORTS",TNT SPORTS 2 FHD
#EXTVLCOPT:http-user-agent=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36
#KODIPROP:inputstreamaddon=inputstream.adaptive
#KODIPROP:inputstream.adaptive.manifest_type=dash
#KODIPROP:inputstream.adaptive.license_type=clearkey
#KODIPROP:inputstream.adaptive.license_key=6d1708b185c6c4d7b37600520c7cc93c:1aace05f58d8edef9697fd52cb09f441
https://otte.live.fly.ww.aiv-cdn.net/lhr-nitro/live/clients/dash/enc/f0qvkrra8j/out/v1/f8fa17f087564f51aa4d5c700be43ec4/cenc.mpd
''';
      List<Track> result = M3UParser.parse(content);

      Track item = result.first;

      expect(item.title, equals("TNT SPORTS 2 FHD"));
      expect(item.attributes["tvg-id"], equals("TNT 2"));
    });

    test('testeHaveAttrXuiId', () async {
      final String content = r'''
#EXTINF:-1 xui-id="{XUI_ID}" tvg-id="NowSports2.hk" tvg-name="HK | Now Sports 2" tvg-logo="http://b1gchlogos.xyz/wp-content/uploads/2023/08/Now-Sports-2.png" group-title="CHANNEL | SPORTS",HK | Now Sports 2
https://raw.githubusercontent.com/B-inal-123/s-asia/inal-22/Nowsport2.m3u8
''';
      List<Track> result = M3UParser.parse(content);

      Track item = result.first;

      expect(item.attributes["xui-id"], equals("{XUI_ID}"));
    });

    test('testeExtVlcOptHasNetworkCachingAndHttpReconnect', () async {
      final String content = r'''
#EXTINF:-1 group-title="LIVE | LIGA INGGRIS" tvg-logo="https://i.pinimg.com/236x/dd/7a/94/dd7a94d92ecf53bb3e56de4f7dcff80f.jpg", CH 6
#EXTVLCOPT:http-user-agent=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36
#EXTVLCOPT:network-caching=1000
#EXTVLCOPT--http-reconnect=true
#KODIPROP:inputstream.adaptive.license_type=org.w3.clearkey
#KODIPROP:inputstream.adaptive.license_key={dc69b6159a0f9f0a4e03b3ff91cbacd5:d0dcbcd7723bc40df0bf34c9c092d51f}
https://otte.live.fly.ww.aiv-cdn.net/pdx-nitro/live/clients/dash/enc/3b7qwiqzk3/out/v1/9f14895badca43e6a716db021dcd0c31/cenc.mpd
''';
      List<Track> result = M3UParser.parse(content);

      Track item = result.first;

      Map<String, String> extVlcOpts = item.extVlcOpts.first;

      expect(
        true,
        equals(extVlcOpts.containsKey("-http-reconnect")),
      ); // Changed to single hyphen
      expect(
        "true",
        equals(extVlcOpts["-http-reconnect"]),
      ); // Changed to single hyphen
    });

    test('testAndFindShouldGiveResult2Row:Query=ONE HD', () async {
      String content = r'''
#EXTINF:-1 group-title="CHANNEL | FIRSTMEDIA" tvg-name="" tvg-country="ID" tvg-logo="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSCDGeSdmHlQ9vXAaRORx9-fhbeCx8_81AnQQ&s", ONE HD
#EXTVLCOPT:http-user-agent=ExoPlayerDemo/2.15.1 (Linux; Android 13) ExoPlayerLib/2.15.1
#KODIPROP:inputstream.adaptive.license_type=clearkey
#KODIPROP:inputstream.adaptive.license_key=a7e68d7c2667465f976361eb0d6bd0c1:32a856d04efbf93cee7b2c97643d7998
https://atemecdnbalancer-voe.sysln.id/live/eds/ONEHD/mpd/ONEHD.mpd
#EXTVLCOPT:http-referrer=https://www.visionplus.id/
#EXTVLCOPT:http-user-agent=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36
#EXTVLCOPT:http-user-agent=ExoPlayerDemo/2.15.1 (Linux; Android 13) ExoPlayerLib/2.15.1
#KODIPROP:inputstream.adaptive.license_type=clearkey
#KODIPROP:inputstream.adaptive.license_key=a7e68d7c2667465f976361eb0d6bd0c1:32a856d04efbf93cee7b2c97643d7998
#EXTINF:-1 tvg-id="ONE.id" group-title="CHANNEL | LIFESTYLE" tvg-logo="https://www.visionplus.id/images/repository/634/634-LOGO-m.png",ONE HD
https://atemecdnbalancer-voe.sysln.id/live/eds/ONEHD/mpd/ONEHD.mpd
''';
      List<Track> result = M3UParser.parse(content);

      List<Track> items = result
          .where((track) => track.title.contains("ONE HD"))
          .toList();

      expect(items.length, equals(2));

      // CHECCK EVERY ITEM
      // ONE HD : 1
      expect(
        items[0].links.first,
        equals(
          "https://atemecdnbalancer-voe.sysln.id/live/eds/ONEHD/mpd/ONEHD.mpd",
        ),
      );

      expect(
        items[0].attributes["tvg-logo"],
        equals(
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSCDGeSdmHlQ9vXAaRORx9-fhbeCx8_81AnQQ&s",
        ),
      );

      // ONE HD : 2
      expect(
        items[1].links.first,
        equals(
          "https://atemecdnbalancer-voe.sysln.id/live/eds/ONEHD/mpd/ONEHD.mpd",
        ),
      );
      expect(
        items[1].attributes["tvg-logo"],
        equals(
          "https://www.visionplus.id/images/repository/634/634-LOGO-m.png",
        ),
      );
    });

    test('checkLastRowNewpilemShouldHave2Links', () async {
      List<Track> result = M3UParser.parse(r'''
#EXTINF:-1  group-title="🔒 TENSI SUB 🔒" tvg-logo="https://www.mediafire.com/convkey/334f/6h7nlypi651hwqd5g",aktif malam
https://edge-hls.sacdnssedge.com/hls/196205035/master/196205035_auto.m3u8
https://edge-hls.doppiocdn.net/hls/167924361/master/167924361_auto.m3u8
#https://edge-hls.doppiocdn.net/hls/2935682/master/2935682_auto.m3u8
#https://ded7126-edge65.bcvcdn.com/hls/stream_crazyanna9/playlist.m3u8
#https://ded7126-edge65.bcvcdn.com/hls/stream_crazyanna9/playlist.m3u8
#https://edge-hls.doppiocdn.net/hls/170884951/master/170884951_auto.m3u8
#https://edge-hls.doppiocdn.net/hls/172963574/master/172963574_auto.m3u8
#https://ded6812-edge16.bcvcdn.com/hls/stream_The-best-babies/playlist.m3u8
#https://edge-hls.doppiocdn.net/hls/181454248/master/181454248_auto.m3u8
#https://edge-hls.doppiocdn.net/hls/96596119/master/96596119_auto.m3u8
#https://edge-hls.doppiocdn.net/hls/79859503/master/79859503_auto.m3u8
#https://cam4-hls.xcdnpro.com/318/cam4-origin-live/Crazy_sexviip-318-64adf145-ff14-4a5b-bcb2-939b4f040481/playlist.m3u8
''');

      Track item = result.last;

      expect(item.title, equals("aktif malam"));

      expect(item.attributes.containsKey("group-title"), equals(true));
      expect(item.attributes["group-title"], equals("🔒 TENSI SUB 🔒"));

      expect(item.attributes.containsKey("tvg-logo"), equals(true));
      expect(
        item.attributes["tvg-logo"],
        equals("https://www.mediafire.com/convkey/334f/6h7nlypi651hwqd5g"),
      );

      expect(item.links.length, equals(2));
      expect(
        "https://edge-hls.sacdnssedge.com/hls/196205035/master/196205035_auto.m3u8",
        equals(item.links[0]),
      );
      expect(
        "https://edge-hls.doppiocdn.net/hls/167924361/master/167924361_auto.m3u8",
        equals(item.links[1]),
      );
    });

    test('checkLastTitle:BLOOD AND SAND-S1:ShouldHave13Rows', () async {
      List<Track> result = M3UParser.parse(r'''

#EXTINF:-1 type="series"  tvg-logo="https://upload.wikimedia.org/wikipedia/pt/e/e7/SpartacusBloodandSand.jpg" group-title="🛡️ SPARTACUS", BLOOD AND SAND-S1 EPS 1
https://cloud.hownetwork.xyz//yyy/46f91b839e471222ef9bc29c0ba4d471/19/480.m3u8
#EXTINF:-1 type="series"  tvg-logo="https://upload.wikimedia.org/wikipedia/pt/e/e7/SpartacusBloodandSand.jpg" group-title="🛡️ SPARTACUS", BLOOD AND SAND-S1 EPS 2
https://cloud.hownetwork.xyz//yyy/4667c287556bddafea8f8d2b4ae51cbe/19/480.m3u8
#EXTINF:-1 type="series"  tvg-logo="https://upload.wikimedia.org/wikipedia/pt/e/e7/SpartacusBloodandSand.jpg" group-title="🛡️ SPARTACUS", BLOOD AND SAND-S1 EPS 3
https://cloud.hownetwork.xyz//yyy/253a91e442e2eeab1c5ae813bd9a62a1/19/480.m3u8
#EXTINF:-1 type="series"  tvg-logo="https://upload.wikimedia.org/wikipedia/pt/e/e7/SpartacusBloodandSand.jpg" group-title="🛡️ SPARTACUS", BLOOD AND SAND-S1 EPS 4
https://cloud.hownetwork.xyz//yyy/04b2353c78ca109e43896e5882723e6b/19/480.m3u8
#EXTINF:-1 type="series"  tvg-logo="https://upload.wikimedia.org/wikipedia/pt/e/e7/SpartacusBloodandSand.jpg" group-title="🛡️ SPARTACUS", BLOOD AND SAND-S1 EPS 5
https://cloud.hownetwork.xyz//yyy/2e665fa61d14b386e454d69ea725e09f/26/480.m3u8
#EXTINF:-1 type="series"  tvg-logo="https://upload.wikimedia.org/wikipedia/pt/e/e7/SpartacusBloodandSand.jpg" group-title="🛡️ SPARTACUS", BLOOD AND SAND-S1 EPS 6
https://cloud.hownetwork.xyz//yyy/e663b1562a281ae539105f6db4ff4b84/19/480.m3u8
#EXTINF:-1 type="series"  tvg-logo="https://upload.wikimedia.org/wikipedia/pt/e/e7/SpartacusBloodandSand.jpg" group-title="🛡️ SPARTACUS", BLOOD AND SAND-S1 EPS 7
https://cloud.hownetwork.xyz//yyy/ab54cd470a258e70b6f2396b33e8eefe/19/480.m3u8
#EXTINF:-1 type="series"  tvg-logo="https://upload.wikimedia.org/wikipedia/pt/e/e7/SpartacusBloodandSand.jpg" group-title="🛡️ SPARTACUS", BLOOD AND SAND-S1 EPS 8
https://cloud.hownetwork.xyz//yyy/81d8429d2a301bd14799207ddf237c3b/28/480.m3u8
#EXTINF:-1 type="series"  tvg-logo="https://upload.wikimedia.org/wikipedia/pt/e/e7/SpartacusBloodandSand.jpg" group-title="🛡️ SPARTACUS", BLOOD AND SAND-S1 EPS 9
https://cloud.hownetwork.xyz//yyy/9d6cfcd3676e76799b80c15257675962/19/480.m3u8
#EXTINF:-1 type="series"  tvg-logo="https://upload.wikimedia.org/wikipedia/pt/e/e7/SpartacusBloodandSand.jpg" group-title="🛡️ SPARTACUS", BLOOD AND SAND-S1 EPS 10
https://be6721.rcr72.waw04.cdn255.com/hls2/01/02916/1xrt5fngpzh8_,n,x,.urlset/master.m3u8?t=2nmz7YfpD1ulABz5eVr5EkkhId2nLgEyFS-Nd_sndBY&s=1748834067&e=10800&f=14581547&srv=25&asn=4761&sp=5500&p=
#EXTINF:-1 type="series"  tvg-logo="https://upload.wikimedia.org/wikipedia/pt/e/e7/SpartacusBloodandSand.jpg" group-title="🛡️ SPARTACUS", BLOOD AND SAND-S1 EPS 11
https://cloud.hownetwork.xyz//yyy/b0726db4307d2f9223e03e03c06db5df/19/480.m3u8
#EXTINF:-1 type="series"  tvg-logo="https://upload.wikimedia.org/wikipedia/pt/e/e7/SpartacusBloodandSand.jpg" group-title="🛡️ SPARTACUS", BLOOD AND SAND-S1 EPS 12
https://cloud.hownetwork.xyz//yyy/aa22ef3010059045c5718c02809b6519/26/480.m3u8
#EXTINF:-1 type="series"  tvg-logo="https://upload.wikimedia.org/wikipedia/pt/e/e7/SpartacusBloodandSand.jpg" group-title="🛡️ SPARTACUS", BLOOD AND SAND-S1 EPS 13
https://cloud.hownetwork.xyz//yyy/44ba82ad20755da74ad2129bc718cca4/19/480.m3u8

''').where((track) => track.title.contains("BLOOD AND SAND-S1")).toList();
      expect(result.length, equals(13));

      expect(result[0].title, equals("BLOOD AND SAND-S1 EPS 1"));
      expect(result[1].title, equals("BLOOD AND SAND-S1 EPS 2"));
      expect(result[2].title, equals("BLOOD AND SAND-S1 EPS 3"));
      expect(result[3].title, equals("BLOOD AND SAND-S1 EPS 4"));
      expect(result[4].title, equals("BLOOD AND SAND-S1 EPS 5"));
      expect(result[5].title, equals("BLOOD AND SAND-S1 EPS 6"));
      expect(result[6].title, equals("BLOOD AND SAND-S1 EPS 7"));
      expect(result[7].title, equals("BLOOD AND SAND-S1 EPS 8"));
      expect(result[8].title, equals("BLOOD AND SAND-S1 EPS 9"));
      expect(result[9].title, equals("BLOOD AND SAND-S1 EPS 10"));
      expect(result[10].title, equals("BLOOD AND SAND-S1 EPS 11"));
      expect(result[11].title, equals("BLOOD AND SAND-S1 EPS 12"));
      expect(result[12].title, equals("BLOOD AND SAND-S1 EPS 13"));
    });

    test('checkLastTitle:maytoko:NBA TV:ShouldHave:4 rows', () async {
      List<Track> result = M3UParser.parse(r'''
#KODIPROP:inputstream.adaptive.license_type=clearkey
#KODIPROP:inputstream.adaptive.license_key=69646b755f3130303030303030303030:e4a2359b05563399f1d9adfce641724a
#EXTINF:-1 tvg-name="NBA TV" tvg-logo="https://i.imgur.com/K3FXClz.jpeg " group-title="CHANNEL | SPORT INDO",NBA TV (Indi)
https://cdn08jtedge.indihometv.com/dassdvr/133/nba/manifest.mpd

#EXTINF:-1 tvg-id="NBA.TV.id" tvg-name="NBA TV" tvg-logo="https://thumbor.prod.vidiocdn.com/JjBvaK3Bf9MIDevMg6HvbmcZ6pQ=/640x360/filters:strip_icc():quality(70)/vidio-web-prod-livestreaming/uploads/livestreaming/image/6717/nba-tv-646502.jpg" group-title="CHANNEL | SPORTS", NBA TV
#EXTVLCOPT:http-user-agent=VidioPlayer/4.3.0-WITH_ADS
#EXTVLCOPT:http-user-agent=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleCoreMedia/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36
#KODIPROP:inputstreamaddon=inputstream.adaptive
#KODIPROP:inputstream.adaptive.manifest_type=dash
#KODIPROP:inputstream.adaptive.license_type=com.widevine.alpha
#KODIPROP:inputstream.adaptive.license_key=https://sweet-night-1d1d.worst.workers.dev/play?id=6717&type=drm
https://sweet-night-1d1d.worst.workers.dev/?id=6717&type=dash
''').where((track) => track.title.contains("NBA TV")).toList();

      expect(result.length, equals(2));

      expect(result[0].title, equals("NBA TV (Indi)"));
      expect(result[1].title, equals("NBA TV"));
    });

    test('testTvgIdAndTvgLogoOnTrack:1', () async {
      final String content = r'''
#EXTINF:-1 xui-id="{XUI_ID}" tvg-id="AstroPremierLeague.my" tvg-name="MY | Astro Premier League 1 FHD" tvg-logo="https://b1gchlogos.xyz/wp-content/uploads/2024/10/Astro_Premier_League_1_2024.png" group-title="CHANNEL | SPORTS",MY | Astro Premier League 1
##https://5nhp186eg31fofnc.chinese-restaurant-api.site/v3/variant/VE1AO1NTbu8mbv12LxEWM21ycrNWYyR3L3cTOhNmZ4UWZ2E2YtcjZ0kTLzYzN00iY0QmYtY2MmRTM3QTY/master.m3u8
http://royalibox.com:80/plcedarkaouishbissm/px6pzjgmf8/1163984
''';

      List<Track> result = M3UParser.parse(content);

      final Track item = result.first;

      expect(item.tvgId, equals("AstroPremierLeague.my"));
      expect(item.tvgName, equals("MY | Astro Premier League 1 FHD"));
      expect(
        item.tvgLogo,
        equals(
          "https://b1gchlogos.xyz/wp-content/uploads/2024/10/Astro_Premier_League_1_2024.png",
        ),
      );
      expect(item.groupTitle, equals("CHANNEL | SPORTS"));
      expect(item.title, equals("MY | Astro Premier League 1"));
    });

    test('TestShouldGetName:The Life of Chuck (2025)', () async {
      final String content = r'''
#EXTINF:-1 tvg-id="5002:0:19:112F8:0:0:0:0:0:0" tvg-logo="https://gamatotv.info/wp-content/uploads/2025/09/oumprkO9bThExP8NwxBIBnvBu2v1-200x300.jpg"
group-title="RYANTV MOVIES 2025", The Life of Chuck (2025)
http://s1.gmtcloud.site/video/moviess/TheLifeofChuck2024.mp4?id=0
''';

      List<Track> result = M3UParser.parse(content);

      final Track item = result.first;

      expect(item.title, equals("The Life of Chuck (2025)"));
      expect(item.groupTitle, equals("RYANTV MOVIES 2025"));
    });

    test('TestShouldGetName:1 Kakak 7 Ponakan (2025)', () async {
      // INI ADALAH ERROR DARI PLAYLIST, HARUS NYA ADA group-title="Movies" tetapi dia melakukan kesalahan, jika ada kasus sepert ini maka ambil
      // group-title="Movies, = groupTitle=Movies

      final String content = r'''
#EXTINF:-1 tvg-id="" tvg-logo="https://images4.imagebam.com/2f/f5/ce/ME151T4S_o.jpeg" group-title="Movies,1 Kakak 7 Ponakan (2025)
https://movearnpre.com/stream/o8mt0SmrkOc-Slx_nqid3w/hjkrhuihghfvu/1755466136/27857875/master.m3u8
''';

      List<Track> result = M3UParser.parse(content);

      final Track item = result.first;

      expect(item.title, equals("Movies,1 Kakak 7 Ponakan (2025)"));
      expect(item.groupTitle, equals("Movies"));
    });

    test('TestShouldHaveUserAgentOnHttpHeader:clearKeyOnUrl', () async {
      final String content = r'''
#KODIPROP:inputstream.adaptive.license_type=clearkey
#KODIPROP:inputstream.adaptive.license_key=https://game.denver1769.fun/Jtv/Jtv.php?id=166&keys
#EXTINF:-1 tvg-id="166" tvg-logo="https://jiotv.catchup.cdn.jio.com/dare_images/images/Cartoon_Network_Telugu.png" group-title="Telugu",Cartoon Network Telugu
#EXTVLCOPT:http-user-agent=Denver1769
https://game.denver1769.fun/Jtv/2HZyBc/Jtv.mpd?id=166|User-Agent=Denver1769
''';

      List<Track> result = M3UParser.parse(content);

      final Track item = result.first;

      expect(
        true,
        equals(item.extVlcOpts.first.containsKey("http-user-agent")),
      );
      expect(item.extVlcOpts.first["http-user-agent"], equals("Denver1769"));
      expect(
        item.links.first,
        equals("https://game.denver1769.fun/Jtv/2HZyBc/Jtv.mpd?id=166"),
      );

      expect(item.httpHeaders.first.containsKey("user-agent"), equals(true));
      expect(item.httpHeaders.first["user-agent"], equals("Denver1769"));
    });

    test('TestShouldHaveUserAgentOnHttpHeader:clearKeyOnUrl', () async {
      final String content = r'''
#EXTINF:-1 group-title="LIVE" tvg-chno="" tv
#EXTVLCOPT:http-user-agent=
#EXTHTTP:{"cookie":"Edge-Cache-Cookie=URLPrefix=aHR0cHM6Ly9ibGRjbXByb2QtY2RuLnRvZmZlZWxpdmUuY29tLw:Expires=1750297799:KeyName=prod_linear:Signature=TDBMq5Xc03aTvlgHIbGzOJRfXo1Ci6MBkMVPtER7RMKYwBr6xRLqsXpDCYdHaDC_ojg5k5EC7ww-uWB62kirBg"}
https://bldcmprod-cdn.toffeelive.com/cdn/live/sony_sports_1_hd/playlist.m3u8
''';

      List<Track> result = M3UParser.parse(content);

      final Track item = result.first;

      expect(
        true,
        equals(item.extVlcOpts.first.containsKey("http-user-agent")),
      );
      expect(item.groupTitle, equals("LIVE"));
      expect(item.title, equals("tv"));
      expect(item.extVlcOpts.first["http-user-agent"], equals(""));
      expect(
        "https://bldcmprod-cdn.toffeelive.com/cdn/live/sony_sports_1_hd/playlist.m3u8",
        equals(item.links.first),
      );

      expect(item.httpHeaders.first.containsKey("cookie"), equals(true));
      expect(
        item.httpHeaders.first["cookie"],
        equals(
          "Edge-Cache-Cookie=URLPrefix=aHR0cHM6Ly9ibGRjbXByb2QtY2RuLnRvZmZlZWxpdmUuY29tLw:Expires=1750297799:KeyName=prod_linear:Signature=TDBMq5Xc03aTvlgHIbGzOJRfXo1Ci6MBkMVPtER7RMKYwBr6xRLqsXpDCYdHaDC_ojg5k5EC7ww-uWB62kirBg",
        ),
      );
    });

    test('TestShouldReturnCorrectAttributes', () async {
      final String content = r'''
#EXTINF:-1 tvg-chno-"5",SAN ISIDRO RD. (ESTRENOS, PELICULAS, NOTICIAS) SI NO TIENES SEÑAL VOLVEMOS PRONTO. EN OCASIONES CARGAMOS CONTENIDO.....
https://rdn.essastream.com:3160/live/sanisidrotvlive.m3u8
''';

      List<Track> result = M3UParser.parse(content);

      final Track item = result.first;

      expect(
        item.title,
        equals(
          "SAN ISIDRO RD. (ESTRENOS, PELICULAS, NOTICIAS) SI NO TIENES SEÑAL VOLVEMOS PRONTO. EN OCASIONES CARGAMOS CONTENIDO.....",
        ),
      );
      expect(item.links.length, equals(1));
      expect(
        item.links.first,
        equals("https://rdn.essastream.com:3160/live/sanisidrotvlive.m3u8"),
      );
    });

    test('TestAswajaTVFromProjectMoose', () async {
      final String content = r'''
#EXTM3U
#EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=1500000,FRAME-RATE=25.000,RESOLUTION=1280x720 group-title="" tvg-logo="" tvg-id="", Aswaja TV
https://live.eu-north-1a.cf.dmcdn.net/sec2(Ggppajj3fZMh7-94SOMum83vsul2Z5-yiwG7sB4KK69G9SH2r1aP5toxT4sjd4l1C0wkxR7z4wMtBMmx0NqYVO-cgnei8rWoy6LX14hEtMD-f1qsNR8IJGFTQcO7dBN2)/dm/3/x748iuo/s/live-240.m3u8#cell=lcf-eu-north-1a
''';

      List<Track> result = M3UParser.parse(content);

      final Track item = result.first;

      expect(item.title, equals("Aswaja TV"));
      expect(item.links.length, equals(1));
      expect(
        item.links.first,
        equals(
          "https://live.eu-north-1a.cf.dmcdn.net/sec2(Ggppajj3fZMh7-94SOMum83vsul2Z5-yiwG7sB4KK69G9SH2r1aP5toxT4sjd4l1C0wkxR7z4wMtBMmx0NqYVO-cgnei8rWoy6LX14hEtMD-f1qsNR8IJGFTQcO7dBN2)/dm/3/x748iuo/s/live-240.m3u8#cell=lcf-eu-north-1a",
        ),
      );
    });

    test('TestPlaylistWIthUdpProtocol', () async {
      final String content = r'''
#EXTM3U
#EXTINF:-1,BeIN Sports 1
udp://@225.2.0.130:1234
''';

      List<Track> result = M3UParser.parse(content);

      final Track item = result.first;

      expect(item.title, equals("BeIN Sports 1"));
      expect(item.links.length, equals(1));
      expect(item.links.first, equals("udp://@225.2.0.130:1234"));
    });

    test('TestPlaylistWithAlotSpaceInTitle', () async {
      final String content = r'''
#EXTINF:-1 tvg-id="" tvg-logo="https://images4.imagebam.com/ab/a2/c7/ME151SY1_o.jpg" group-title="Movies",    	Singsot: Siulan Kematian (2025)Tidak ada voting
https://habetar.com/stream/HG0yxg6811DqlFTuVEC1Gw/kjhhiuahiuhgihdf/1755465140/55567685/master.m3u8
''';

      List<Track> result = M3UParser.parse(content);

      final Track item = result.first;

      expect(
        item.title,
        equals("Singsot: Siulan Kematian (2025)Tidak ada voting"),
      );
    });

    test('TestTrackWithPropperAttribute', () async {
      final String content = r'''
#EXTINF:0 type="video" channelId="-1" group="11.22.63" size="Medium", 1x1.0
https://storage.diziyou16.com/episodes/1555_tr/1080p.m3u8
#EXT-X-MEDIA:TYPE=SUBTITLES,GROUP-ID="subs",LANGUAGE="tr",NAME="Turkish",DEFAULT=YES,AUTOSELECT=YES,URI="https://storage.diziyou16.com/subtitles/1555/en.vtt"
''';

      List<Track> result = M3UParser.parse(content);

      final Track item = result.first;

      expect(item.title, equals("1x1.0"));
      expect(item.links.length, equals(1));
      expect(
        item.links.first,
        equals("https://storage.diziyou16.com/episodes/1555_tr/1080p.m3u8"),
      );

      expect(item.attributes.containsKey("channelId"), equals(true));
      expect(item.attributes["channelId"], equals("-1"));

      expect(item.attributes.containsKey("group"), equals(true));
      expect(item.attributes["group"], equals("11.22.63"));

      expect(item.attributes.containsKey("size"), equals(true));
      expect(item.attributes["size"], equals("Medium"));

      expect(item.attributes.containsKey("type"), equals(true));
      expect(item.attributes["type"], equals("video"));

      // X-MEDIA
      expect(item.extXMedias.length, equals(1));
      expect(
        item.extXMedias.first.uri,
        equals("https://storage.diziyou16.com/subtitles/1555/en.vtt"),
      );
      expect(item.extXMedias.first.type, equals("SUBTITLES"));
      expect(item.extXMedias.first.groupId, equals("subs"));
      expect(item.extXMedias.first.language, equals("tr"));
      expect(item.extXMedias.first.name, equals("Turkish"));
      expect(item.extXMedias.first.isDefault, equals(true));
      expect(item.extXMedias.first.autoSelect, equals(true));
    });

    test('TestTrackWIthTvChnoAttr', () async {
      final String content = r'''
#EXTINF:-1 channel-id="GB3700007OZ-gb" tvg-id="GB3700007OZ" tvg-chno="4245" tvg-name="&TV" tvg-logo="https://tvpnlogopeu.samsungcloud.tv/platform/image/sourcelogo/vc/00/02/34/GB3700007OZ_20250624T021650SQUARE.png" group-title="United Kingdom", &TV
https://jmp2.uk/sam-GB3700007OZ.m3u8
''';

      List<Track> result = M3UParser.parse(content);

      final Track item = result.first;

      expect(item.title, equals("&TV"));
      expect(item.links.length, equals(1));
      expect(item.links.first, equals("https://jmp2.uk/sam-GB3700007OZ.m3u8"));

      expect(item.attributes.containsKey("channel-id"), equals(true));
      expect(item.attributes["channel-id"], equals("GB3700007OZ-gb"));
      expect(item.attributes.containsKey("tvg-id"), equals(true));
      expect(item.attributes["tvg-id"], equals("GB3700007OZ"));
      expect(item.attributes.containsKey("tvg-chno"), equals(true));
      expect(item.attributes["tvg-chno"], equals("4245"));
      expect(item.attributes.containsKey("tvg-name"), equals(true));
      expect(item.attributes["tvg-name"], equals("&TV"));
      expect(item.attributes.containsKey("tvg-logo"), equals(true));
      expect(
        item.attributes["tvg-logo"],
        equals(
          "https://tvpnlogopeu.samsungcloud.tv/platform/image/sourcelogo/vc/00/02/34/GB3700007OZ_20250624T021650SQUARE.png",
        ),
      );
      expect(item.attributes.containsKey("group-title"), equals(true));
      expect(item.attributes["group-title"], equals("United Kingdom"));
    });

    test('TestZooMooChannel', () async {
      final String content = r'''
#KODIPROP:inputstream.adaptive.license_type=org.w3.clearkey
#KODIPROP:inputstream.adaptive.license_key=780f283e8dd84dc195d93899ea9fcabe:59103ac45e9c5e411651e3fa26a2e6d9
#EXTVLCOPT:http-referrer=https://www.visionplus.id/
#EXTVLCOPT:http-user-agent=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36
#EXTINF:-1 tvg-id="ZooMoo.id" tvg-url="https://bit.ly/IndonesiaEpg" tvg-logo="https://www.mncvision.id/userfiles/image/channel/channel_39.png" group-title="Dunia Si Kecil",ZooMoo
https://d3b0v7fggu5zwm.cloudfront.net/out/v1/8554b3cb938e44038093df2d65080932/index.mpd
''';

      List<Track> result = M3UParser.parse(content);

      final Track item = result.first;

      expect(item.title, equals("ZooMoo"));
      expect(item.groupTitle, equals("Dunia Si Kecil"));

      expect(item.links.length, equals(1));
      expect(
        item.links.first,
        equals(
          "https://d3b0v7fggu5zwm.cloudfront.net/out/v1/8554b3cb938e44038093df2d65080932/index.mpd",
        ),
      );

      final extVlcOpts = item.extVlcOpts.first;
      expect(extVlcOpts.containsKey("http-referrer"), equals(true));
      expect(extVlcOpts["http-referrer"], equals("https://www.visionplus.id/"));
      expect(extVlcOpts.containsKey("http-user-agent"), equals(true));
      expect(
        extVlcOpts["http-user-agent"],
        equals(
          "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36",
        ),
      );

      final kodiProps = item.kodiProps.first;
      expect(
        kodiProps.containsKey("inputstream.adaptive.license_type"),
        equals(true),
      );
      expect(
        kodiProps["inputstream.adaptive.license_type"],
        equals("org.w3.clearkey"),
      );
      expect(
        kodiProps.containsKey("inputstream.adaptive.license_key"),
        equals(true),
      );
      expect(
        kodiProps["inputstream.adaptive.license_key"],
        equals(
          "780f283e8dd84dc195d93899ea9fcabe:59103ac45e9c5e411651e3fa26a2e6d9",
        ),
      );
    });

    test('TestZooMooChannel', () async {
      final String content = r'''
#KODIPROP:inputstream.adaptive.license_type=org.w3.clearkey
#KODIPROP:inputstream.adaptive.license_key=780f283e8dd84dc195d93899ea9fcabe:59103ac45e9c5e411651e3fa26a2e6d9
#EXTVLCOPT:http-referrer=https://www.visionplus.id/
#EXTVLCOPT:http-user-agent=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36
#EXTINF:-1 tvg-id="ZooMoo.id" tvg-url="https://bit.ly/IndonesiaEpg" tvg-logo="https://www.mncvision.id/userfiles/image/channel/channel_39.png" group-title="Dunia Si Kecil",ZooMoo
https://d3b0v7fggu5zwm.cloudfront.net/out/v1/8554b3cb938e44038093df2d65080932/index.mpd
''';

      List<Track> result = M3UParser.parse(content);

      final Track item = result.first;

      expect(item.title, equals("ZooMoo"));
      expect(item.groupTitle, equals("Dunia Si Kecil"));

      expect(item.links.length, equals(1));
      expect(
        item.links.first,
        equals(
          "https://d3b0v7fggu5zwm.cloudfront.net/out/v1/8554b3cb938e44038093df2d65080932/index.mpd",
        ),
      );

      final extVlcOpts = item.extVlcOpts.first;
      expect(extVlcOpts.containsKey("http-referrer"), equals(true));
      expect(extVlcOpts["http-referrer"], equals("https://www.visionplus.id/"));
      expect(extVlcOpts.containsKey("http-user-agent"), equals(true));
      expect(
        extVlcOpts["http-user-agent"],
        equals(
          "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36",
        ),
      );

      final kodiProps = item.kodiProps.first;
      expect(
        kodiProps.containsKey("inputstream.adaptive.license_type"),
        equals(true),
      );
      expect(
        kodiProps["inputstream.adaptive.license_type"],
        equals("org.w3.clearkey"),
      );
      expect(
        kodiProps.containsKey("inputstream.adaptive.license_key"),
        equals(true),
      );
      expect(
        kodiProps["inputstream.adaptive.license_key"],
        equals(
          "780f283e8dd84dc195d93899ea9fcabe:59103ac45e9c5e411651e3fa26a2e6d9",
        ),
      );
    });

    test('TestKodiPropsHasStreamHeaders', () async {
      final String content = r'''
#EXTINF:-1 group-title="RYANTV CHANNELS" tvg-id="" tvg-logo="https://i.imgur.com/61MSiq9.png", France24
#KODIPROP:inputstream.adaptive.manifest_type=dash
#KODIPROP:inputstream.adaptive.license_type=org.w3.clearkey
#KODIPROP:inputstream.adaptive.license_key=3b0c1cebd0c4518d600f52c354ed1910:76d409ffc4eaa012c61d8c31bd13df5d
#KODIPROP:inputstream.adaptive.stream_headers=referer=https://astrogo.astro.com.my//&user-agent=Mozilla/5.0 (Linux; Android 10; MI 9 Build/QKQ1.190825.002; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/111.0.5563.58 Mobile Safari/537.36
https://linearjitp-playback.astro.com.my/dash-wv/linear/9985/default_ott.mpd
''';

      List<Track> result = M3UParser.parse(content);

      final Track item = result.first;

      final kodiProps = item.kodiProps.first;
      expect(
        kodiProps.containsKey("inputstream.adaptive.license_type"),
        equals(true),
      );
      expect(
        kodiProps["inputstream.adaptive.license_type"],
        equals("org.w3.clearkey"),
      );
      expect(
        kodiProps.containsKey("inputstream.adaptive.license_key"),
        equals(true),
      );
      expect(
        kodiProps["inputstream.adaptive.license_key"],
        equals(
          "3b0c1cebd0c4518d600f52c354ed1910:76d409ffc4eaa012c61d8c31bd13df5d",
        ),
      );
      expect(
        kodiProps.containsKey("inputstream.adaptive.stream_headers"),
        equals(true),
      );
      expect(
        kodiProps["inputstream.adaptive.stream_headers"],
        equals(
          "referer=https://astrogo.astro.com.my//&user-agent=Mozilla/5.0 (Linux; Android 10; MI 9 Build/QKQ1.190825.002; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/111.0.5563.58 Mobile Safari/537.36",
        ),
      );
    });

    test('TestKodiPropsHasStreamHeaders', () async {
      final String content = r'''
#EXTINF:-1 group-title="RYANTV CHANNELS" tvg-id="" tvg-logo="https://i.imgur.com/eE9IBhJ.png",tvN Premium
#KODIPROP:inputstreamaddon=inputstream.adaptive
#KODIPROP:inputstream.adaptive.manifest_type=dash
#KODIPROP:inputstream.adaptive.license_type=org.w3.clearkey
#KODIPROP:inputstream.adaptive.license_key=faf4d62bb898de503446c28fb1aa9210:19e80ecc5d337215c64004cb49c9cb01
#KODIPROP:inputstream.adaptive.stream_headers=User-Agent=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36
http://linearjitp-playback.astro.com.my/dash-wv/linear/1001/default_ott.mpd
''';

      List<Track> result = M3UParser.parse(content);

      final Track item = result.first;

      final kodiProps = item.kodiProps.first;
      expect(
        kodiProps.containsKey("inputstream.adaptive.license_type"),
        equals(true),
      );
      expect(
        kodiProps["inputstream.adaptive.license_type"],
        equals("org.w3.clearkey"),
      );
      expect(
        kodiProps.containsKey("inputstream.adaptive.license_key"),
        equals(true),
      );
      expect(
        kodiProps["inputstream.adaptive.license_key"],
        equals(
          "faf4d62bb898de503446c28fb1aa9210:19e80ecc5d337215c64004cb49c9cb01",
        ),
      );
      expect(
        kodiProps.containsKey("inputstream.adaptive.stream_headers"),
        equals(true),
      );
      expect(
        kodiProps["inputstream.adaptive.stream_headers"],
        equals(
          "User-Agent=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36",
        ),
      );
    });

    test('TestExtVlcOptHasHttpUserAgent', () async {
      final String content = r'''
#EXTINF:-1 tvg-id="1123" group-title="Jiostar" tvg-logo="https://jiotvimages.cdn.jio.com/dare_images/images/Star_Sports_Select_1.png",Star Sports Select 1
#KODIPROP:inputstream.adaptive.license_type=clearkey
#KODIPROP:inputstream.adaptive.license_key=ea7985dacbb95f1c9d62e5a1675142e5:39d5910ca04841b5f32bf24623cdae58
#EXTVLCOPT:http-user-agent=plaYtv/7.1.3 (Linux;Android 13) ygx/69.1 ExoPlayerLib/824.0
#EXTHTTP:{"cookie":"__hdnea__=st=1758107257~exp=1758193657~acl=/*~hmac=99dec41934473d7fb71e7850a7a088fdb138b63b884a511c262244beefee8bed"}
https://jiotvpllive.cdn.jio.com/bpk-tv/Star_Sports_Select_1_BTS/output/index.mpd?__hdnea__=st=1758107257~exp=1758193657~acl=/*~hmac=99dec41934473d7fb71e7850a7a088fdb138b63b884a511c262244beefee8bed&xxx=%7Ccookie=__hdnea__=st=1758107257~exp=1758193657~acl=/*~hmac=99dec41934473d7fb71e7850a7a088fdb138b63b884a511c262244beefee8bed
''';

      List<Track> result = M3UParser.parse(content);

      final Track item = result.first;

      expect(item.title, equals("Star Sports Select 1"));
      expect(item.groupTitle, equals("Jiostar"));
      expect(item.tvgId, equals("1123"));
      expect(
        item.tvgLogo,
        equals(
          "https://jiotvimages.cdn.jio.com/dare_images/images/Star_Sports_Select_1.png",
        ),
      );
      expect(
        item.links.first,
        equals(
          "https://jiotvpllive.cdn.jio.com/bpk-tv/Star_Sports_Select_1_BTS/output/index.mpd?__hdnea__=st=1758107257~exp=1758193657~acl=/*~hmac=99dec41934473d7fb71e7850a7a088fdb138b63b884a511c262244beefee8bed&xxx=%7Ccookie=__hdnea__=st=1758107257~exp=1758193657~acl=/*~hmac=99dec41934473d7fb71e7850a7a088fdb138b63b884a511c262244beefee8bed",
        ),
      );

      expect(
        item.kodiProps.first.containsKey("inputstream.adaptive.license_type"),
        equals(true),
      );
      expect(
        item.kodiProps.first["inputstream.adaptive.license_type"],
        equals("clearkey"),
      );
      expect(
        item.kodiProps.first.containsKey("inputstream.adaptive.license_key"),
        equals(true),
      );
      expect(
        item.kodiProps.first["inputstream.adaptive.license_key"],
        equals(
          "ea7985dacbb95f1c9d62e5a1675142e5:39d5910ca04841b5f32bf24623cdae58",
        ),
      );

      expect(
        item.extVlcOpts.first.containsKey("http-user-agent"),
        equals(true),
      );
      expect(
        item.extVlcOpts.first["http-user-agent"],
        equals("plaYtv/7.1.3 (Linux;Android 13) ygx/69.1 ExoPlayerLib/824.0"),
      );

      expect(item.httpHeaders.first.containsKey("cookie"), equals(true));
      expect(
        item.httpHeaders.first["cookie"],
        equals(
          "__hdnea__=st=1758107257~exp=1758193657~acl=/*~hmac=99dec41934473d7fb71e7850a7a088fdb138b63b884a511c262244beefee8bed",
        ),
      );
    });

    test('TestExtDesc', () async {
      final String content = r'''
#EXTINF:-1 media="true" tvg-logo="https://cfvod.kaltura.com/p/4526593/sp/452659300/thumbnail/entry_id/1_pbep9odt/width/0/height/0/quality/85", Obscene Beauty
#EXTDESC: Mergulhando na cena Neo-Burlesca de Nova Iorque, este documentário explora a sexualidade, comédia e arte dessa cultura, analisando como os artistas utilizam os seus três minutos em palco como uma plataforma para comentário sociopolítico.
https://cfvod.kaltura.com/hls/p/4526593/sp/452659300/serveFlavor/entryId/1_1fxmr1o3/v/1/ev/7/flavorId/1_eac4uysh/name/a.mp4/index.m3u8
''';

      List<Track> result = M3UParser.parse(content);

      final Track item = result.first;

      expect(item.title, equals("Obscene Beauty"));
      expect(
        item.desc,
        equals(
          "Mergulhando na cena Neo-Burlesca de Nova Iorque, este documentário explora a sexualidade, comédia e arte dessa cultura, analisando como os artistas utilizam os seus três minutos em palco como uma plataforma para comentário sociopolítico.",
        ),
      );
      expect(
        item.links.first,
        equals(
          "https://cfvod.kaltura.com/hls/p/4526593/sp/452659300/serveFlavor/entryId/1_1fxmr1o3/v/1/ev/7/flavorId/1_eac4uysh/name/a.mp4/index.m3u8",
        ),
      );
    });

    test('TestTrackWhereHasKodiPropMimeType', () async {
      final String content = r'''
#EXTINF:-1 tvg-id="Champions TV 3.id" tvg-logo="https://thumbor.prod.vidiocdn.com/iJMuLDOoWxwxsc7BMjwtBrEowqg=/372x211/filters:strip_icc():quality(70)/vidio-web-prod-livestreaming/uploads/livestreaming/image/6786/champions-tv-3-7898f2.jpg" group-title="PREMIUM SPORT",Champions TV 3
#EXTVLCOPT:http-user-agent=Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1
#EXTVLCOPT:http-user-agent=VidioPlayer/4.3.0-WITH_ADS
#KODIPROP:mimetype=application/dash+xml
#KODIPROP:inputstream=inputstream.adaptive
#KODIPROP:inputstream.adaptive.stream_headers=origin=https://www.vidio.com&referer=https://www.vidio.com/&user-agent=Vidio/6.43.9-8ec34856ef (Linux;Android 11) ExoPlayerLib/2.19.1
#KODIPROP:inputstream.adaptive.manifest_type=dash
#KODIPROP:inputstream.adaptive.license_type=com.widevine.alpha
#KODIPROP:inputstream.adaptive.license_key=https://seprai.jasoncreak8.workers.dev/play.mpd?id=6786&type=drm
https://seprai.jasoncreak8.workers.dev/play.mpd?id=6786&type=dash
''';

      List<Track> result = M3UParser.parse(content);

      final Track item = result.first;

      expect(item.title, equals("Champions TV 3"));
      expect(item.groupTitle, equals("PREMIUM SPORT"));

      final extVlcOpt = item.extVlcOpts;

      expect(extVlcOpt.first.containsKey("http-user-agent"), equals(true));
      expect(
        extVlcOpt.first["http-user-agent"],
        equals("VidioPlayer/4.3.0-WITH_ADS"),
      );

      final kodiProps = item.kodiProps;

      expect(1, equals(kodiProps.length));

      expect(kodiProps.first.containsKey("mimetype"), equals(true));
      expect(kodiProps.first.containsKey("inputstream"), equals(true));
      expect(
        kodiProps.first.containsKey("inputstream.adaptive.stream_headers"),
        equals(true),
      );
      expect(
        kodiProps.first.containsKey("inputstream.adaptive.manifest_type"),
        equals(true),
      );
      expect(
        kodiProps.first.containsKey("inputstream.adaptive.license_type"),
        equals(true),
      );
      expect(
        kodiProps.first.containsKey("inputstream.adaptive.license_key"),
        equals(true),
      );

      expect(kodiProps.first["mimetype"], equals("application/dash+xml"));
      expect(
        kodiProps.first["inputstream.adaptive.stream_headers"],
        equals(
          "origin=https://www.vidio.com&referer=https://www.vidio.com/&user-agent=Vidio/6.43.9-8ec34856ef (Linux;Android 11) ExoPlayerLib/2.19.1",
        ),
      );

      expect(
        kodiProps.first["inputstream.adaptive.manifest_type"],
        equals("dash"),
      );

      expect(
        kodiProps.first["inputstream.adaptive.license_type"],
        equals("com.widevine.alpha"),
      );

      expect(
        kodiProps.first["inputstream.adaptive.license_key"],
        equals(
          "https://seprai.jasoncreak8.workers.dev/play.mpd?id=6786&type=drm",
        ),
      );
    });

    test('TestTrackShouldGiveName:TNT SPORTS 4', () async {
      final String content = r'''
#EXTINF:0 tvg-id="TNT 4" tvg-logo="https://i.ibb.co.com/yJ8TWnb/Tntsports4.png" group-title="Sports",TNT SPORTS 4
#EXTVLCOPT:http-user-agent=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36
#KODIPROP:inputstreamaddon=inputstream.adaptive
#KODIPROP:inputstream.adaptive.manifest_type=dash
#KODIPROP:inputstream.adaptive.license_type=clearkey
#KODIPROP:inputstream.adaptive.license_key=e31a5a81caff5d07ea2411a571fc2e59:96c5ef69479732ae734f962748c19729
https://otte.live.fly.ww.aiv-cdn.net/lhr-nitro/live/clients/dash/enc/i2pcjr4pe5/out/v1/912e9db56d75403b8a9ac0a719110f36/cenc.mpd
''';

      List<Track> result = M3UParser.parse(content);

      final Track item = result.first;

      expect(item.title, equals("TNT SPORTS 4"));
      expect(item.groupTitle, equals("Sports"));
      expect(item.tvgId, equals("TNT 4"));
      expect(
        item.tvgLogo,
        equals("https://i.ibb.co.com/yJ8TWnb/Tntsports4.png"),
      );
      expect(
        item.links.first,
        equals(
          "https://otte.live.fly.ww.aiv-cdn.net/lhr-nitro/live/clients/dash/enc/i2pcjr4pe5/out/v1/912e9db56d75403b8a9ac0a719110f36/cenc.mpd",
        ),
      );

      expect(
        item.kodiProps.first.containsKey("inputstreamaddon"),
        equals(true),
      );
      expect(
        item.kodiProps.first["inputstreamaddon"],
        equals("inputstream.adaptive"),
      );
      expect(
        item.kodiProps.first.containsKey("inputstream.adaptive.manifest_type"),
        equals(true),
      );
      expect(
        item.kodiProps.first["inputstream.adaptive.manifest_type"],
        equals("dash"),
      );
      expect(
        item.kodiProps.first.containsKey("inputstream.adaptive.license_type"),
        equals(true),
      );
      expect(
        item.kodiProps.first["inputstream.adaptive.license_type"],
        equals("clearkey"),
      );
      expect(
        item.kodiProps.first.containsKey("inputstream.adaptive.license_key"),
        equals(true),
      );
      expect(
        item.kodiProps.first["inputstream.adaptive.license_key"],
        equals(
          "e31a5a81caff5d07ea2411a571fc2e59:96c5ef69479732ae734f962748c19729",
        ),
      );

      expect(
        item.extVlcOpts.first.containsKey("http-user-agent"),
        equals(true),
      );
      expect(
        item.extVlcOpts.first["http-user-agent"],
        equals(
          "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36",
        ),
      );
    });

    test('TestTrackShouldGiveName:ZEE ZEST HD 195.181.169.162', () async {
      final String content = r'''
#EXTINF:-1, ZEE ZEST HD 195.181.169.162
http://195.181.169.162:80/LIVING_FOODZ_HD/index.mpd?token=test
''';

      List<Track> result = M3UParser.parse(content);

      final Track item = result.first;

      expect(item.title, equals("ZEE ZEST HD 195.181.169.162"));
    });

    test('TestTrackShouldGiveName:JKN 18 (1080p)', () async {
      final String content = r'''
#EXTINF:-1 group-title="v2hcdn" tvg-id="JKN18.th",JKN 18 (1080p)
https://lb1-live-mv.v2h-cdn.com/hls/ffda/jkn18/jkn18.m3u8
''';

      List<Track> result = M3UParser.parse(content);

      final Track item = result.first;

      expect(item.title, equals("JKN 18 (1080p)"));
      expect(item.groupTitle, equals("v2hcdn"));
      expect(item.tvgId, equals("JKN18.th"));
    });

    test('TestTrackShouldGiveName:MV Mall DD (1080p)', () async {
      final String content = r'''
#EXTINF:-1 group-title="v2hcdn" tvg-id="DramaChannel.th",MV Mall DD (1080p)
https://lb1-live-mv.v2h-cdn.com/hls/fdee/mvmalldd/mvmalldd.m3u8
''';

      List<Track> result = M3UParser.parse(content);

      final Track item = result.first;

      expect(item.title, equals("MV Mall DD (1080p)"));
      expect(item.groupTitle, equals("v2hcdn"));
      expect(item.tvgId, equals("DramaChannel.th"));
    });

    test('TestTrackShouldGiveName:MY: Astro Sports UHD', () async {
      final String content = r'''
#EXTINF:-1 tvg-id="Astro.Sports.UHD.my" tvg-name="MY: Astro Sports UHD" tvg-logo="https://i.ibb.co/3hW45Pb/Astro-Sports-UHD.png group-title="hilaytv",MY: Astro Sports UHD
https://a1xs.vip/9000001
''';

      List<Track> result = M3UParser.parse(content);

      final Track item = result.first;

      expect(item.title, equals("MY: Astro Sports UHD"));
      expect(item.groupTitle, equals("hilaytv"));
      expect(item.tvgId, equals("Astro.Sports.UHD.my"));
      expect(item.tvgName, equals("MY: Astro Sports UHD"));
      expect(
        item.tvgLogo,
        equals("https://i.ibb.co/3hW45Pb/Astro-Sports-UHD.png"),
      );
    });

    test(
      'TestTrackShouldGiveUrl:https://c3c275b999764df8a2dd55ffe2996818.mediatailor.eu-west-1.amazonaws.com/v1/manifest/0547f18649bd788bec7b67b746e47670f558b6b2/production-LiveChannel-6576/5a098a95-cc1e-4e08-8785-65fe2ac4dda3/5.m3u8',
      () async {
        final String content = r'''
#EXTINF:-1 group-title="TV" tvg-logo="https://raw.githubusercontent.com/Corvisier/IPTV/main/logos/Africa_news.png",Africa News
#https://c3c275b999764df8a2dd55ffe2996818.mediatailor.eu-west-1.amazonaws.com/v1/master/0547f18649bd788bec7b67b746e47670f558b6b2/production-LiveChannel-6576/bitok/eyJzdGlkIjoiZjdlNjYzYmUtOTVlNi00MWUxLTg0NjctZjBiNzg2MzZjMjNjIiwibWt0IjoicHQiLCJjaCI6NjU4MywicHRmIjo1fQ%3D%3D/26036/africanews-en.m3u8
https://c3c275b999764df8a2dd55ffe2996818.mediatailor.eu-west-1.amazonaws.com/v1/manifest/0547f18649bd788bec7b67b746e47670f558b6b2/production-LiveChannel-6576/5a098a95-cc1e-4e08-8785-65fe2ac4dda3/5.m3u8

''';

        final String content2 = r'''
#EXTINF:-1 group-title="TV" tvg-logo="https://raw.githubusercontent.com/Corvisier/IPTV/main/logos/Africa_news.png",Africa News
https://c3c275b999764df8a2dd55ffe2996818.mediatailor.eu-west-1.amazonaws.com/v1/manifest/0547f18649bd788bec7b67b746e47670f558b6b2/production-LiveChannel-6576/5a098a95-cc1e-4e08-8785-65fe2ac4dda3/5.m3u8
#https://c3c275b999764df8a2dd55ffe2996818.mediatailor.eu-west-1.amazonaws.com/v1/master/0547f18649bd788bec7b67b746e47670f558b6b2/production-LiveChannel-6576/bitok/eyJzdGlkIjoiZjdlNjYzYmUtOTVlNi00MWUxLTg0NjctZjBiNzg2MzZjMjNjIiwibWt0IjoicHQiLCJjaCI6NjU4MywicHRmIjo1fQ%3D%3D/26036/africanews-en.m3u8

''';

        List<Track> result = M3UParser.parse(content);
        List<Track> result2 = M3UParser.parse(content2);

        final Track item = result.first;
        final Track item2 = result2.first;

        expect(item.links.first, equals(item2.links.first));
      },
    );

    test('TestTrackShouldGiveName:AVFM', () async {
      final String content = r'''
#EXTINF:-1 radio="true" group-title="Rádios" tvg-logo="https://radioavfm.net/wp-content/uploads/2017/06/avfm-logo-horizontal.png,AVFM
https://uk2.streamingpulse.com/ssl/radioavfm
''';

      List<Track> result = M3UParser.parse(content);

      final Track item = result.first;

      expect(item.title, equals("AVFM"));
      expect(item.groupTitle, equals("Rádios"));
      expect(
        item.tvgLogo,
        equals(
          "https://radioavfm.net/wp-content/uploads/2017/06/avfm-logo-horizontal.png",
        ),
      );
      expect(
        item.links.first,
        equals("https://uk2.streamingpulse.com/ssl/radioavfm"),
      );
    });

    test('TestTrackShouldGiveName:Movies Action', () async {
      final String content = r'''
#EXTINF: -1 channel-id="405" group-title="Foxtel Go" tvg-chno="405" tvg-id="SHA" tvg-logo="https://raw.githubusercontent.com/coxy86/autvicons/main/foxtelaction2.png" tvg-name="Movies Action" , Movies Action

#KODIPROP:inputstream.adaptive.manifest_type=mpd
#KODIPROP:inputstream.adaptive.license_type=com.widevine.alpha
#KODIPROP:inputstream.adaptive.license_key=https://foxtelott.live.ott.irdeto.com/widevine/getlicense?CrmId=foxtelott&AccountId=foxtelott&ContentId=jit_527477&SessionId=D3CA6992DB9DF598&Ticket=A8F5549B20BEA10F

https://foxteldashmtlive01.akamaized.net/v1/dash/40a0de4a910d426b321814c25ab1ea7bbc30818d/prod-dash-switch-akamai/live/channel032/channel032_mcs.isml/playlist_medium.mpd?ads.auhead=%2F21780812979%2Ffoxtellive&ads.correlator=858631889&ads.auapp=foxtelgo&ads.auchtag=SHA&ads.audev=pcbrowser%2Fwindows&ads.idm=04&ads.location=nsw&ads.idfx_hashed=9a1eab2d1262e2e8f02ebc1e07f6576a&ads.account_hashed=b72c26959f64f71916424989bc2251f8&ads.manufacturer=Google&ads.gizmo_type=pcbrowser&ads.gizmo_model=Mozilla%2F5.0+%28Windows+NT+10.0%3B+Win64%3B+x64%29+AppleWebKit%2F537.36+%28KHTML%2C+like+Gecko%29+Chrome%2F126.0.0.0+Safari%2F537.36&ads.gizmo_osEnvironment=WINDOWS&ads.app_id=FOXTELGO&ads.app_ver_short=3.4.3&ads.ppid=68c5358edca40ebe98575504c0a3e6409a1eab2d1262e2e8f02ebc1e07f6576a&ads.dph=68c5358edca40ebe98575504c0a3e6409a1eab2d1262e2e8f02ebc1e07f6576a&ads.ip=203.196.54.25&ads.userAgent=Mozilla%252F5.0%2520%2528Windows%2520NT%252010.0%253B%2520Win64%253B%2520x64%2529%2520AppleWebKit%252F537.36%2520%2528KHTML%252C%2520like%2520Gecko%2529%2520Chrome%252F126.0.0.0%2520Safari%252F537.36&ads.url=http%3A%2F%2Ffoxtel.com.au%2Fads&ads.descUrl=http%3A%2F%2Ffoxtel.com.au%2Fads&ads.ip_postcode=3000&ads.tzlocale=AU-VIC&ads.npa=0&aws.sessionId=5ee43c21-7298-4b2b-ac9b-78186de8576d&hdnts=exp=1758189712~hmac=8009ef797c871b5c563befd93be88b9210f47d3f010558edbebcc33bc13361fd

''';

      List<Track> result = M3UParser.parse(content);

      final Track item = result.first;

      expect(item.title, equals("Movies Action"));
      expect(item.groupTitle, equals("Foxtel Go"));
      expect(item.attributes['channel-id'], equals("405"));
      expect(item.attributes['tvg-chno'], equals("405"));
      expect(item.tvgId, equals("SHA"));
      expect(
        item.tvgLogo,
        equals(
          "https://raw.githubusercontent.com/coxy86/autvicons/main/foxtelaction2.png",
        ),
      );
      expect(item.tvgName, equals("Movies Action"));
      expect(
        item.links.first,
        equals(
          "https://foxteldashmtlive01.akamaized.net/v1/dash/40a0de4a910d426b321814c25ab1ea7bbc30818d/prod-dash-switch-akamai/live/channel032/channel032_mcs.isml/playlist_medium.mpd?ads.auhead=%2F21780812979%2Ffoxtellive&ads.correlator=858631889&ads.auapp=foxtelgo&ads.auchtag=SHA&ads.audev=pcbrowser%2Fwindows&ads.idm=04&ads.location=nsw&ads.idfx_hashed=9a1eab2d1262e2e8f02ebc1e07f6576a&ads.account_hashed=b72c26959f64f71916424989bc2251f8&ads.manufacturer=Google&ads.gizmo_type=pcbrowser&ads.gizmo_model=Mozilla%2F5.0+%28Windows+NT+10.0%3B+Win64%3B+x64%29+AppleWebKit%2F537.36+%28KHTML%2C+like+Gecko%29+Chrome%2F126.0.0.0+Safari%2F537.36&ads.gizmo_osEnvironment=WINDOWS&ads.app_id=FOXTELGO&ads.app_ver_short=3.4.3&ads.ppid=68c5358edca40ebe98575504c0a3e6409a1eab2d1262e2e8f02ebc1e07f6576a&ads.dph=68c5358edca40ebe98575504c0a3e6409a1eab2d1262e2e8f02ebc1e07f6576a&ads.ip=203.196.54.25&ads.userAgent=Mozilla%252F5.0%2520%2528Windows%2520NT%252010.0%253B%2520Win64%253B%2520x64%2529%2520AppleWebKit%252F537.36%2520%2528KHTML%252C%2520like%2520Gecko%2529%2520Chrome%252F126.0.0.0%2520Safari%252F537.36&ads.url=http%3A%2F%2Ffoxtel.com.au%2Fads&ads.descUrl=http%3A%2F%2Ffoxtel.com.au%2Fads&ads.ip_postcode=3000&ads.tzlocale=AU-VIC&ads.npa=0&aws.sessionId=5ee43c21-7298-4b2b-ac9b-78186de8576d&hdnts=exp=1758189712~hmac=8009ef797c871b5c563befd93be88b9210f47d3f010558edbebcc33bc13361fd",
        ),
      );
    });

    test('TestTrackShouldGiveName:Movies Romance', () async {
      final String content = r'''
#EXTINF: -1 channel-id="408" group-title="Foxtel Go" tvg-chno="408" tvg-id="SHD" tvg-logo="https://raw.githubusercontent.com/coxy86/autvicons/main/foxtelromance2.png" tvg-name="Movies Romance" , Movies Romance

#KODIPROP:inputstream.adaptive.manifest_type=mpd
#KODIPROP:inputstream.adaptive.license_type=com.widevine.alpha
#KODIPROP:inputstream.adaptive.license_key=https://foxtelott.live.ott.irdeto.com/widevine/getlicense?CrmId=foxtelott&AccountId=foxtelott&ContentId=jit_527482&SessionId=D3CA6992DB9DF598&Ticket=A8F5549B20BEA10F

https://foxteldashmtlive01.akamaized.net/v1/dash/40a0de4a910d426b321814c25ab1ea7bbc30818d/prod-dash-switch-akamai/live/channel053/channel053_mcs.isml/playlist_medium.mpd?ads.auhead=%2F21780812979%2Ffoxtellive&ads.correlator=2098895009&ads.auapp=foxtelgo&ads.auchtag=SHD&ads.audev=pcbrowser%2Fwindows&ads.idm=04&ads.location=nsw&ads.idfx_hashed=9a1eab2d1262e2e8f02ebc1e07f6576a&ads.account_hashed=b72c26959f64f71916424989bc2251f8&ads.manufacturer=Google&ads.gizmo_type=pcbrowser&ads.gizmo_model=Mozilla%2F5.0+%28Windows+NT+10.0%3B+Win64%3B+x64%29+AppleWebKit%2F537.36+%28KHTML%2C+like+Gecko%29+Chrome%2F126.0.0.0+Safari%2F537.36&ads.gizmo_osEnvironment=WINDOWS&ads.app_id=FOXTELGO&ads.app_ver_short=3.4.3&ads.ppid=68c5358edca40ebe98575504c0a3e6409a1eab2d1262e2e8f02ebc1e07f6576a&ads.dph=68c5358edca40ebe98575504c0a3e6409a1eab2d1262e2e8f02ebc1e07f6576a&ads.ip=203.196.54.25&ads.userAgent=Mozilla%252F5.0%2520%2528Windows%2520NT%252010.0%253B%2520Win64%253B%2520x64%2529%2520AppleWebKit%252F537.36%2520%2528KHTML%252C%2520like%2520Gecko%2529%2520Chrome%252F126.0.0.0%2520Safari%252F537.36&ads.url=http%3A%2F%2Ffoxtel.com.au%2Fads&ads.descUrl=http%3A%2F%2Ffoxtel.com.au%2Fads&ads.ip_postcode=3000&ads.tzlocale=AU-VIC&ads.npa=0&aws.sessionId=fbe93b2a-be30-44fd-a92d-a813ff3318e0&hdnts=exp=1758189737~hmac=bd345027ebf1a9b6ed34d0d5f567eb1365f33d24ed70c8eb9f6871153b79fc58

''';

      List<Track> result = M3UParser.parse(content);

      final Track item = result.first;

      expect(item.title, equals("Movies Romance"));
      expect(item.groupTitle, equals("Foxtel Go"));
      expect(item.attributes['channel-id'], equals("408"));
      expect(item.attributes['tvg-chno'], equals("408"));
      expect(item.tvgId, equals("SHD"));
      expect(
        item.tvgLogo,
        equals(
          "https://raw.githubusercontent.com/coxy86/autvicons/main/foxtelromance2.png",
        ),
      );
      expect(item.tvgName, equals("Movies Romance"));
      expect(
        item.links.first,
        equals(
          "https://foxteldashmtlive01.akamaized.net/v1/dash/40a0de4a910d426b321814c25ab1ea7bbc30818d/prod-dash-switch-akamai/live/channel053/channel053_mcs.isml/playlist_medium.mpd?ads.auhead=%2F21780812979%2Ffoxtellive&ads.correlator=2098895009&ads.auapp=foxtelgo&ads.auchtag=SHD&ads.audev=pcbrowser%2Fwindows&ads.idm=04&ads.location=nsw&ads.idfx_hashed=9a1eab2d1262e2e8f02ebc1e07f6576a&ads.account_hashed=b72c26959f64f71916424989bc2251f8&ads.manufacturer=Google&ads.gizmo_type=pcbrowser&ads.gizmo_model=Mozilla%2F5.0+%28Windows+NT+10.0%3B+Win64%3B+x64%29+AppleWebKit%2F537.36+%28KHTML%2C+like+Gecko%29+Chrome%2F126.0.0.0+Safari%2F537.36&ads.gizmo_osEnvironment=WINDOWS&ads.app_id=FOXTELGO&ads.app_ver_short=3.4.3&ads.ppid=68c5358edca40ebe98575504c0a3e6409a1eab2d1262e2e8f02ebc1e07f6576a&ads.dph=68c5358edca40ebe98575504c0a3e6409a1eab2d1262e2e8f02ebc1e07f6576a&ads.ip=203.196.54.25&ads.userAgent=Mozilla%252F5.0%2520%2528Windows%2520NT%252010.0%253B%2520Win64%253B%2520x64%2529%2520AppleWebKit%252F537.36%2520%2528KHTML%252C%2520like%2520Gecko%2529%2520Chrome%252F126.0.0.0%2520Safari%252F537.36&ads.url=http%3A%2F%2Ffoxtel.com.au%2Fads&ads.descUrl=http%3A%2F%2Ffoxtel.com.au%2Fads&ads.ip_postcode=3000&ads.tzlocale=AU-VIC&ads.npa=0&aws.sessionId=fbe93b2a-be30-44fd-a92d-a813ff3318e0&hdnts=exp=1758189737~hmac=bd345027ebf1a9b6ed34d0d5f567eb1365f33d24ed70c8eb9f6871153b79fc58",
        ),
      );
    });

    test('TestTrackShouldGiveNameGroupTitle:Variedades:1', () async {
      final String content = r'''
#EXTINF:-1 tvg-id="DMaisTV.br" tvg-name="D+ TV" tvg-logo="http://www.cxtv.com.br/img/Tvs/Logo/5a0ca2ab1c68adcde7bf577af87071b8.jpg", D+ TV
#EXTGRP:Variedades
https://stmv1.samcast.com.br/demaistv6503/demaistv6503/chunklist_w1316191273.m3u8
''';

      List<Track> result = M3UParser.parse(content);

      final Track item = result.first;

      expect(item.title, equals("D+ TV"));
      expect(item.groupTitle, equals("Variedades"));
      expect(item.tvgId, equals("DMaisTV.br"));
      expect(item.tvgName, equals("D+ TV"));
      expect(
        item.tvgLogo,
        equals(
          "http://www.cxtv.com.br/img/Tvs/Logo/5a0ca2ab1c68adcde7bf577af87071b8.jpg",
        ),
      );
      expect(
        item.links.first,
        equals(
          "https://stmv1.samcast.com.br/demaistv6503/demaistv6503/chunklist_w1316191273.m3u8",
        ),
      );
    });

    test('TestTrackShouldGiveNameGroupTitle:Variedades:2', () async {
      final String content = r'''
#EXTINF:-1 tvg-id="DMaisTV.br" group-title="Variedades" tvg-name="D+ TV" tvg-logo="http://www.cxtv.com.br/img/Tvs/Logo/5a0ca2ab1c68adcde7bf577af87071b8.jpg", D+ TV
#EXTGRP:Variedades
https://stmv1.samcast.com.br/demaistv6503/demaistv6503/chunklist_w1316191273.m3u8
''';

      List<Track> result = M3UParser.parse(content);

      final Track item = result.first;

      expect(item.title, equals("D+ TV"));
      expect(item.groupTitle, equals("Variedades"));
      expect(item.tvgId, equals("DMaisTV.br"));
      expect(item.tvgName, equals("D+ TV"));
      expect(
        item.tvgLogo,
        equals(
          "http://www.cxtv.com.br/img/Tvs/Logo/5a0ca2ab1c68adcde7bf577af87071b8.jpg",
        ),
      );
      expect(
        item.links.first,
        equals(
          "https://stmv1.samcast.com.br/demaistv6503/demaistv6503/chunklist_w1316191273.m3u8",
        ),
      );
    });

    test('TestTrackShouldGiveNameGroupTitle:Variedades:3', () async {
      final String content = r'''
#EXTINF:-1 tvg-id="DMaisTV.br" group-title="Variedades" tvg-name="D+ TV" tvg-logo="http://www.cxtv.com.br/img/Tvs/Logo/5a0ca2ab1c68adcde7bf577af87071b8.jpg", D+ TV
https://stmv1.samcast.com.br/demaistv6503/demaistv6503/chunklist_w1316191273.m3u8
''';

      List<Track> result = M3UParser.parse(content);

      final Track item = result.first;

      expect(item.title, equals("D+ TV"));
      expect(item.groupTitle, equals("Variedades"));
      expect(item.tvgId, equals("DMaisTV.br"));
      expect(item.tvgName, equals("D+ TV"));
      expect(
        item.tvgLogo,
        equals(
          "http://www.cxtv.com.br/img/Tvs/Logo/5a0ca2ab1c68adcde7bf577af87071b8.jpg",
        ),
      );
      expect(
        item.links.first,
        equals(
          "https://stmv1.samcast.com.br/demaistv6503/demaistv6503/chunklist_w1316191273.m3u8",
        ),
      );
    });

    test('TestTrackShouldGiveTracks:Length2', () async {
      final String content = r'''
#EXTM3U x-tvg-url="https://fy.188766.xyz/e.xml"
#EXTINF:-1 tvg-id="CCTV1" tvg-name="CCTV1" tvg-logo="https://fy.188766.xyz/logo/fanmingming/live/tv/CCTV1.png" group-title="央视频道",CCTV-1 综合
http://192.168.1.8:35455/bst/cctv1hd@4000000.m3u8
#EXTINF:-1 tvg-id="CCTV1" tvg-name="CCTV1" tvg-logo="https://fy.188766.xyz/logo/fanmingming/live/tv/CCTV1.png" group-title="央视频道",CCTV-1 综合
http://192.168.1.8:35455/mgtv/608807420.m3u8
''';

      List<Track> result = M3UParser.parse(content);

      expect(result.length, equals(2));

      expect(result[0].title, equals("CCTV-1 综合"));
      expect(result[1].title, equals("CCTV-1 综合"));
    });

    test('TestTrackShouldGiveHeaders:X-TCDN2', () async {
      final String content = r'''
#EXTINF:-1 tvg-name="LALIGA TV HYPERMOTION 3" tvg-logo="https://estatico.emisiondof6.com/recorte/m-NEONEGR/wpmarcaficha/MLIGS3" group-title="MOVISTAR+ TV" group-logo="https://play-lh.googleusercontent.com/1FOULln_iZWLP_M-WY4NiolZ4EXr5_aE3ywIIgrT6o717Azi763_92z-Rim-BsQA54k" catchup-type="default" catchup-source="https://cutv-wp0.cdn.telefonica.com/5137/vxfmt=dp/Manifest.mpd?device_profile=DASH_TV_WIDEVINE&start_time={start_iso}&end_time={end_iso}" catchup-days="21", LALIGA TV HYPERMOTION 3
#KODIPROP:inputstream.adaptive.manifest_type=mpd
#KODIPROP:inputstream.adaptive.license_type=org.w3.clearkey
#KODIPROP:inputstream.adaptive.stream_headers={"X-TCDN-token":"eyJhbGciOiJFUzI1NiIsImtpZCI6ImI1OGNhNGM0NGFiOTQ0Y2FiY2U4N2FjNGJmZmI4MDNkIiwidHlwIjoiYXQrand0In0.eyJuYmYiOjE3NTc1NDQzMTMsImV4cCI6MTc1NzYzMDcxMywiaXNzIjoiaHR0cHM6Ly9pZHNlcnZlci5kb2Y2LmNvbSIsImF1ZCI6InRjZG4iLCJjbGllbnRfaWQiOiJtb3Zpc3RhcnBsdXMiLCJzdWIiOiI3YTdmN3Y4QzhUOGc4diIsImF1dGhfdGltZSI6MTc1NzU0NDMxMywiaWRwIjoibW92aXN0YXIrIiwidWlkIjoiTlRzU21NUjFKQ0tyT3NTS3RETlJCRE5paUZ5S1IrS291SFFFMEExUmhpbz0iLCJhY2MiOiJTSU8vRnlhclFNaVB6ZmtqOEJjdDY0VUZFcTZLbEJoK0JBeHhmYzR4YWJjPSIsImp0aSI6IkM1QjRGNDA2RUE4OTE1QjNGNkIxRTlGOTBCOTgzM0ZFIiwiaWF0IjoxNzU3NTQ0MzEzLCJzY29wZSI6ImNkbiJ9.IW1RBlKWQGSWFsVyI-ORgFnjTKep-W5t3V4GdA7YSI--xKG2rx2SbFvsOSRusVkbd7VXiRy64l1VR39HpBEsCA"}
#KODIPROP:inputstream.adaptive.license_key=8726ee7d09dc41a688ada5df49c08ea1:8ce090ab40e5af32015422775fb1bc5c
#EXTVLCOPT:http-user-agent=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36
http://3segdiv-dash-movistarplus.emisiondof6.com/manifest.mpd
''';

      List<Track> result = M3UParser.parse(content);

      expect(result[0].title, equals("LALIGA TV HYPERMOTION 3"));
      expect(
        result[0].kodiProps.first.containsKey(
          "inputstream.adaptive.stream_headers",
        ),
        equals(true),
      );
      expect(
        result[0].kodiProps.first["inputstream.adaptive.stream_headers"],
        equals(
          "{\"X-TCDN-token\":\"eyJhbGciOiJFUzI1NiIsImtpZCI6ImI1OGNhNGM0NGFiOTQ0Y2FiY2U4N2FjNGJmZmI4MDNkIiwidHlwIjoiYXQrand0In0.eyJuYmYiOjE3NTc1NDQzMTMsImV4cCI6MTc1NzYzMDcxMywiaXNzIjoiaHR0cHM6Ly9pZHNlcnZlci5kb2Y2LmNvbSIsImF1ZCI6InRjZG4iLCJjbGllbnRfaWQiOiJtb3Zpc3RhcnBsdXMiLCJzdWIiOiI3YTdmN3Y4QzhUOGc4diIsImF1dGhfdGltZSI6MTc1NzU0NDMxMywiaWRwIjoibW92aXN0YXIrIiwidWlkIjoiTlRzU21NUjFKQ0tyT3NTS3RETlJCRE5paUZ5S1IrS291SFFFMEExUmhpbz0iLCJhY2MiOiJTSU8vRnlhclFNaVB6ZmtqOEJjdDY0VUZFcTZLbEJoK0JBeHhmYzR4YWJjPSIsImp0aSI6IkM1QjRGNDA2RUE4OTE1QjNGNkIxRTlGOTBCOTgzM0ZFIiwiaWF0IjoxNzU3NTQ0MzEzLCJzY29wZSI6ImNkbiJ9.IW1RBlKWQGSWFsVyI-ORgFnjTKep-W5t3V4GdA7YSI--xKG2rx2SbFvsOSRusVkbd7VXiRy64l1VR39HpBEsCA\"}",
        ),
      );
      expect(
        result[0].kodiProps.first.containsKey(
          "inputstream.adaptive.license_key",
        ),
        equals(true),
      );
      expect(
        result[0].kodiProps.first["inputstream.adaptive.license_key"],
        equals(
          "8726ee7d09dc41a688ada5df49c08ea1:8ce090ab40e5af32015422775fb1bc5c",
        ),
      );
      expect(
        result[0].kodiProps.first.containsKey(
          "inputstream.adaptive.manifest_type",
        ),
        equals(true),
      );
      expect(
        result[0].kodiProps.first["inputstream.adaptive.manifest_type"],
        equals("mpd"),
      );
      expect(
        result[0].kodiProps.first.containsKey(
          "inputstream.adaptive.license_type",
        ),
        equals(true),
      );
      expect(
        result[0].kodiProps.first["inputstream.adaptive.license_type"],
        equals("org.w3.clearkey"),
      );

      expect(result[0].attributes.containsKey("catchup-days"), equals(true));
      expect(result[0].attributes["catchup-days"], equals("21"));

      expect(
        result[0].extVlcOpts.first.containsKey("http-user-agent"),
        equals(true),
      );
      expect(
        result[0].extVlcOpts.first["http-user-agent"],
        equals(
          "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36",
        ),
      );
    });

    test('TestTrackShouldGiveHeaders:X-TCDN2', () async {
      final String content = r'''
#EXTINF:-1 tvg-name="LALIGA TV HYPERMOTION 3" tvg-logo="https://estatico.emisiondof6.com/recorte/m-NEONEGR/wpmarcaficha/MLIGS3" group-title="MOVISTAR+ TV" group-logo="https://play-lh.googleusercontent.com/1FOULln_iZWLP_M-WY4NiolZ4EXr5_aE3ywIIgrT6o717Azi763_92z-Rim-BsQA54k" catchup-type="default" catchup-source="https://cutv-wp0.cdn.telefonica.com/5137/vxfmt=dp/Manifest.mpd?device_profile=DASH_TV_WIDEVINE&start_time={start_iso}&end_time={end_iso}" catchup-days="21", LALIGA TV HYPERMOTION 3
#KODIPROP:inputstream.adaptive.manifest_type=mpd
#KODIPROP:inputstream.adaptive.license_type=org.w3.clearkey
#KODIPROP:inputstream.adaptive.stream_headers={"X-TCDN-token":"eyJhbGciOiJFUzI1NiIsImtpZCI6ImI1OGNhNGM0NGFiOTQ0Y2FiY2U4N2FjNGJmZmI4MDNkIiwidHlwIjoiYXQrand0In0.eyJuYmYiOjE3NTc1NDQzMTMsImV4cCI6MTc1NzYzMDcxMywiaXNzIjoiaHR0cHM6Ly9pZHNlcnZlci5kb2Y2LmNvbSIsImF1ZCI6InRjZG4iLCJjbGllbnRfaWQiOiJtb3Zpc3RhcnBsdXMiLCJzdWIiOiI3YTdmN3Y4QzhUOGc4diIsImF1dGhfdGltZSI6MTc1NzU0NDMxMywiaWRwIjoibW92aXN0YXIrIiwidWlkIjoiTlRzU21NUjFKQ0tyT3NTS3RETlJCRE5paUZ5S1IrS291SFFFMEExUmhpbz0iLCJhY2MiOiJTSU8vRnlhclFNaVB6ZmtqOEJjdDY0VUZFcTZLbEJoK0JBeHhmYzR4YWJjPSIsImp0aSI6IkM1QjRGNDA2RUE4OTE1QjNGNkIxRTlGOTBCOTgzM0ZFIiwiaWF0IjoxNzU3NTQ0MzEzLCJzY29wZSI6ImNkbiJ9.IW1RBlKWQGSWFsVyI-ORgFnjTKep-W5t3V4GdA7YSI--xKG2rx2SbFvsOSRusVkbd7VXiRy64l1VR39HpBEsCA"}
#KODIPROP:inputstream.adaptive.license_key=8726ee7d09dc41a688ada5df49c08ea1:8ce090ab40e5af32015422775fb1bc5c
#EXTVLCOPT:http-user-agent=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36
http://3segdiv-dash-movistarplus.emisiondof6.com/manifest.mpd
''';

      List<Track> result = M3UParser.parse(content);

      expect(result[0].title, equals("LALIGA TV HYPERMOTION 3"));
      expect(
        result[0].kodiProps.first.containsKey(
          "inputstream.adaptive.stream_headers",
        ),
        equals(true),
      );
      expect(
        result[0].kodiProps.first["inputstream.adaptive.stream_headers"],
        equals(
          "{\"X-TCDN-token\":\"eyJhbGciOiJFUzI1NiIsImtpZCI6ImI1OGNhNGM0NGFiOTQ0Y2FiY2U4N2FjNGJmZmI4MDNkIiwidHlwIjoiYXQrand0In0.eyJuYmYiOjE3NTc1NDQzMTMsImV4cCI6MTc1NzYzMDcxMywiaXNzIjoiaHR0cHM6Ly9pZHNlcnZlci5kb2Y2LmNvbSIsImF1ZCI6InRjZG4iLCJjbGllbnRfaWQiOiJtb3Zpc3RhcnBsdXMiLCJzdWIiOiI3YTdmN3Y4QzhUOGc4diIsImF1dGhfdGltZSI6MTc1NzU0NDMxMywiaWRwIjoibW92aXN0YXIrIiwidWlkIjoiTlRzU21NUjFKQ0tyT3NTS3RETlJCRE5paUZ5S1IrS291SFFFMEExUmhpbz0iLCJhY2MiOiJTSU8vRnlhclFNaVB6ZmtqOEJjdDY0VUZFcTZLbEJoK0JBeHhmYzR4YWJjPSIsImp0aSI6IkM1QjRGNDA2RUE4OTE1QjNGNkIxRTlGOTBCOTgzM0ZFIiwiaWF0IjoxNzU3NTQ0MzEzLCJzY29wZSI6ImNkbiJ9.IW1RBlKWQGSWFsVyI-ORgFnjTKep-W5t3V4GdA7YSI--xKG2rx2SbFvsOSRusVkbd7VXiRy64l1VR39HpBEsCA\"}",
        ),
      );
      expect(
        result[0].kodiProps.first.containsKey(
          "inputstream.adaptive.license_key",
        ),
        equals(true),
      );
      expect(
        result[0].kodiProps.first["inputstream.adaptive.license_key"],
        equals(
          "8726ee7d09dc41a688ada5df49c08ea1:8ce090ab40e5af32015422775fb1bc5c",
        ),
      );
      expect(
        result[0].kodiProps.first.containsKey(
          "inputstream.adaptive.manifest_type",
        ),
        equals(true),
      );
      expect(
        result[0].kodiProps.first["inputstream.adaptive.manifest_type"],
        equals("mpd"),
      );
      expect(
        result[0].kodiProps.first.containsKey(
          "inputstream.adaptive.license_type",
        ),
        equals(true),
      );
      expect(
        result[0].kodiProps.first["inputstream.adaptive.license_type"],
        equals("org.w3.clearkey"),
      );

      expect(result[0].attributes.containsKey("catchup-days"), equals(true));
      expect(result[0].attributes["catchup-days"], equals("21"));

      expect(
        result[0].extVlcOpts.first.containsKey("http-user-agent"),
        equals(true),
      );
      expect(
        result[0].extVlcOpts.first["http-user-agent"],
        equals(
          "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36",
        ),
      );
    });

    test('TestTrackShouldGiveHeaders:ClearKey:1', () async {
      final String content = r'''
#EXTINF:-1 group-title="RYANTV CHANNELS" tvg-id="" tvg-logo="https://upload.wikimedia.org/wikipedia/commons/thumb/b/ba/BBC_Lifestyle2.svg/1200px-BBC_Lifestyle2.svg.png",BBC Lifestyle
#KODIPROP:inputstream.adaptive.manifest_type=dash
#KODIPROP:inputstream.adaptive.license_type=org.w3.clearkey
#KODIPROP:inputstream.adaptive.license_key=f429292dc744f284355308561577ac10:b12e1f894129c517dc8845baaeebec8a
#KODIPROP:inputstream.adaptive.stream_headers=referer=https://astrogo.astro.com.my//&user-agent=Mozilla/5.0 (Linux; Android 10; MI 9 Build/QKQ1.190825.002; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/111.0.5563.58 Mobile Safari/537.36
https://linearjitp-playback.astro.com.my/dash-wv/linear/5050/default_ott.mpd
''';

      List<Track> result = M3UParser.parse(content);

      expect(result[0].title, equals("BBC Lifestyle"));
      expect(
        result[0].kodiProps.first.containsKey(
          "inputstream.adaptive.stream_headers",
        ),
        equals(true),
      );
      expect(
        result[0].kodiProps.first["inputstream.adaptive.stream_headers"],
        equals(
          "referer=https://astrogo.astro.com.my//&user-agent=Mozilla/5.0 (Linux; Android 10; MI 9 Build/QKQ1.190825.002; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/111.0.5563.58 Mobile Safari/537.36",
        ),
      );
      expect(
        result[0].kodiProps.first.containsKey(
          "inputstream.adaptive.license_key",
        ),
        equals(true),
      );
      expect(
        result[0].kodiProps.first["inputstream.adaptive.license_key"],
        equals(
          "f429292dc744f284355308561577ac10:b12e1f894129c517dc8845baaeebec8a",
        ),
      );
      expect(
        result[0].kodiProps.first.containsKey(
          "inputstream.adaptive.manifest_type",
        ),
        equals(true),
      );
      expect(
        result[0].kodiProps.first["inputstream.adaptive.manifest_type"],
        equals("dash"),
      );
      expect(
        result[0].kodiProps.first.containsKey(
          "inputstream.adaptive.license_type",
        ),
        equals(true),
      );
      expect(
        result[0].kodiProps.first["inputstream.adaptive.license_type"],
        equals("org.w3.clearkey"),
      );
      expect(
        result[0].links.first,
        equals(
          "https://linearjitp-playback.astro.com.my/dash-wv/linear/5050/default_ott.mpd",
        ),
      );
    });

    test('TestTrackShouldGiveHeaders:ClearKeyValueUrl:1', () async {
      final String content = r'''
#EXTINF:-1 group-title="RYANTV CHANNELS" tvg-id="" tvg-logo="https://poster.starhubgo.com/Linear_channels2/316_1920x1080_HTV.png" ,Cartoon Network
#KODIPROP:inputstreamaddon=inputstream.adaptive
#KODIPROP:inputstream.adaptive.manifest_type=dash
#KODIPROP:inputstream.adaptive.license_type=clearkey
#EXTVLCOPT:http-user-agent=Mozilla/5.0 (Linux; Android 12; Pixel 3a XL Build/SP2A.220505.008; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/114.0.5715.0 Mobile Safari/537.36
#KODIPROP:inputstream.adaptive.license_key=https://ck-dash-mpd.aqfadtv.xyz/dash-ck/linear/509
https://linearjitp-playback.astro.com.my/dash-wv/linear/509/default_ott.mpd

''';

      List<Track> result = M3UParser.parse(content);

      expect(result[0].title, equals("Cartoon Network"));
      expect(
        result[0].kodiProps.first.containsKey(
          "inputstream.adaptive.license_key",
        ),
        equals(true),
      );
      expect(
        result[0].kodiProps.first["inputstream.adaptive.license_key"],
        equals("https://ck-dash-mpd.aqfadtv.xyz/dash-ck/linear/509"),
      );
      expect(
        result[0].kodiProps.first.containsKey(
          "inputstream.adaptive.manifest_type",
        ),
        equals(true),
      );
      expect(
        result[0].kodiProps.first["inputstream.adaptive.manifest_type"],
        equals("dash"),
      );
      expect(
        result[0].kodiProps.first.containsKey(
          "inputstream.adaptive.license_type",
        ),
        equals(true),
      );
      expect(
        result[0].kodiProps.first["inputstream.adaptive.license_type"],
        equals("clearkey"),
      );
      expect(
        result[0].links.first,
        equals(
          "https://linearjitp-playback.astro.com.my/dash-wv/linear/509/default_ott.mpd",
        ),
      );
      expect(
        result[0].extVlcOpts.first.containsKey("http-user-agent"),
        equals(true),
      );
      expect(
        result[0].extVlcOpts.first["http-user-agent"],
        equals(
          "Mozilla/5.0 (Linux; Android 12; Pixel 3a XL Build/SP2A.220505.008; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/114.0.5715.0 Mobile Safari/537.36",
        ),
      );
    });

    test('TestTrackShouldGiveHeaders:ClearKeyValueUrl:1', () async {
      final String content = r'''
#EXTINF:-1 group-title="RYANTV CHANNELS" tvg-id="" tvg-logo="http://115.146.176.131:80/images/2acf9495fde07739914e7a7bb3ffee94.png", CNN
#KODIPROP:inputstreamaddon=inputstream.adaptive
#KODIPROP:inputstream.adaptive.manifest_type=dash
#KODIPROP:inputstream.adaptive.license_type=org.w3.clearkey
#KODIPROP:inputstream.adaptive.license_key={"keys":[{"kty":"oct","k":"v34bl1VcSst0VfcRsqn/Fg","kid":"G2GKKRzs5EyYRd3fxP2bEA"}],"type":"temporary"}
#EXTVLCOPT:http-user-agent=Mozilla/5.0 (Linux; Android 14; 27821-67832-42-315-4231-233-21-43-12-1312-321-23-21-232-) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Mobile Safari/537.36
https://linearjitp-playback.astro.com.my/dash-wv/linear/2503/default_ott.mpd
''';

      List<Track> result = M3UParser.parse(content);

      expect(result[0].title, equals("CNN"));
      expect(
        result[0].kodiProps.first.containsKey(
          "inputstream.adaptive.license_key",
        ),
        equals(true),
      );
      expect(
        result[0].kodiProps.first["inputstream.adaptive.license_key"],
        equals(
          "{\"keys\":[{\"kty\":\"oct\",\"k\":\"v34bl1VcSst0VfcRsqn/Fg\",\"kid\":\"G2GKKRzs5EyYRd3fxP2bEA\"}],\"type\":\"temporary\"}",
        ),
      );
      expect(
        result[0].kodiProps.first.containsKey(
          "inputstream.adaptive.manifest_type",
        ),
        equals(true),
      );
      expect(
        result[0].kodiProps.first["inputstream.adaptive.manifest_type"],
        equals("dash"),
      );
      expect(
        result[0].kodiProps.first.containsKey(
          "inputstream.adaptive.license_type",
        ),
        equals(true),
      );
      expect(
        result[0].kodiProps.first["inputstream.adaptive.license_type"],
        equals("org.w3.clearkey"),
      );
      expect(
        result[0].links.first,
        equals(
          "https://linearjitp-playback.astro.com.my/dash-wv/linear/2503/default_ott.mpd",
        ),
      );
      expect(
        result[0].extVlcOpts.first.containsKey("http-user-agent"),
        equals(true),
      );
      expect(
        result[0].extVlcOpts.first["http-user-agent"],
        equals(
          "Mozilla/5.0 (Linux; Android 14; 27821-67832-42-315-4231-233-21-43-12-1312-321-23-21-232-) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Mobile Safari/537.36",
        ),
      );
    });

    test('TestTrackShouldGiveHeaders:ClearKeyJsonPure:1', () async {
      final String content = r'''
#EXTINF:-1 group-title="RYANTV CHANNELS" tvg-id="" tvg-logo="https://logo.iptveditor.com/tlc.png" ,TLC
#KODIPROP:inputstreamaddon=inputstream.adaptive
#KODIPROP:inputstream.adaptive.manifest_type=dash
#KODIPROP:inputstream.adaptive.license_type=clearkey
#KODIPROP:inputstream.adaptive.license_key={ "keys":[ { "kty":"oct", "k":"f15saWmN3vy3RVNDGyscmA", "kid":"lC7BViA7Ksod3zSY9mPBEA" } ], "type":"temporary" }
#EXTVLCOPT:http-user-agent=Mozilla/5.0 (Linux; Android 14; 27821-67832-42-315-4231-233-21-43-12-1312-321-23-21-232-) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Mobile Safari/537.36
https://linearjitp-playback.astro.com.my/dash-wv/linear/2709/default_ott.mpd
''';

      List<Track> result = M3UParser.parse(content);

      expect(result[0].title, equals("TLC"));
      expect(
        result[0].kodiProps.first.containsKey(
          "inputstream.adaptive.license_key",
        ),
        equals(true),
      );
      expect(
        result[0].kodiProps.first["inputstream.adaptive.license_key"],
        equals(
          "{ \"keys\":[ { \"kty\":\"oct\", \"k\":\"f15saWmN3vy3RVNDGyscmA\", \"kid\":\"lC7BViA7Ksod3zSY9mPBEA\" } ], \"type\":\"temporary\" }",
        ),
      );
      expect(
        result[0].kodiProps.first.containsKey(
          "inputstream.adaptive.manifest_type",
        ),
        equals(true),
      );
      expect(
        result[0].kodiProps.first["inputstream.adaptive.manifest_type"],
        equals("dash"),
      );
      expect(
        result[0].kodiProps.first.containsKey(
          "inputstream.adaptive.license_type",
        ),
        equals(true),
      );
      expect(
        result[0].kodiProps.first["inputstream.adaptive.license_type"],
        equals("clearkey"),
      );
      expect(
        result[0].links.first,
        equals(
          "https://linearjitp-playback.astro.com.my/dash-wv/linear/2709/default_ott.mpd",
        ),
      );
      expect(
        result[0].extVlcOpts.first.containsKey("http-user-agent"),
        equals(true),
      );
      expect(
        result[0].extVlcOpts.first["http-user-agent"],
        equals(
          "Mozilla/5.0 (Linux; Android 14; 27821-67832-42-315-4231-233-21-43-12-1312-321-23-21-232-) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Mobile Safari/537.36",
        ),
      );
    });

    test('TestTrackShouldGiveHeaders:ClearKeyJsonPure:1', () async {
      final String content = r'''
#EXTINF:-1 group-title="RYANTV CHANNELS" tvg-id="" tvg-logo="https://i.imgur.com/LkisXI3.png",Golf Pass
#KODIPROP:inputstream.adaptive.license_type=clearkey
#KODIPROP:inputstream.adaptive.license_key={"0020212a47511b226f7cc9d030aa171b":"323c16315e1cb8d7c821facc3c1778a4"}
https://fsly.stream.peacocktv.com/Content/CMAF_CTR-4s-v2/Live/channel(vc124phhny)/master.mpd
''';

      List<Track> result = M3UParser.parse(content);

      expect(result[0].title, equals("Golf Pass"));
      expect(
        result[0].kodiProps.first.containsKey(
          "inputstream.adaptive.license_key",
        ),
        equals(true),
      );
      expect(
        result[0].kodiProps.first["inputstream.adaptive.license_key"],
        equals(
          "{\"0020212a47511b226f7cc9d030aa171b\":\"323c16315e1cb8d7c821facc3c1778a4\"}",
        ),
      );
      expect(
        result[0].kodiProps.first.containsKey(
          "inputstream.adaptive.license_type",
        ),
        equals(true),
      );
      expect(
        result[0].kodiProps.first["inputstream.adaptive.license_type"],
        equals("clearkey"),
      );
      expect(
        result[0].links.first,
        equals(
          "https://fsly.stream.peacocktv.com/Content/CMAF_CTR-4s-v2/Live/channel(vc124phhny)/master.mpd",
        ),
      );
    });

    test('TestTrackShouldGiveLength:1', () async {
      final String content = r'''
#EXTINF:-1 tvg-name="卡酷动画",BRTV卡酷少儿[高清]
http://192.168.1.4:7088/rtp/239.3.1.189:8000
# #EXTINF:-1 tvg-name="北京纪实",BRTV冬奥纪实[高清]
# http://192.168.1.4:7088/rtp/239.3.1.243:8000
''';

      List<Track> result = M3UParser.parse(content);

      expect(result.length, equals(1));
    });

    test('TestTrackShouldGiveHeaders:ClearKeyJsonPure:2', () async {
      final String content = r'''
#KODIPROP:inputstream.adaptive.license_type=clearkey
#KODIPROP:inputstream.adaptive.license_key={ "keys":[ { "kty":"oct", "k":"BW4eSVc9LK7ly0/nj4xPPQ", "kid":"qcYZB07TjCDiWtNsPFfBDA" } ], "type":"temporary" }
#EXTINF:-1 tvg-id="8TV.my" tvg-name="8TV" group-title="NJOI TV" tvg-logo="https://divign0fdw3sv.cloudfront.net/Images/ChannelLogo/contenthub/115_144.png",8TV
#EXTVLCOPT:http-user-agent=Mozilla/5.0 (Linux; Android 12; Pixel 3a XL Build/SP2A.220505.008; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/114.0.5715.0 Mobile Safari/537.36
#EXTVLCOPT:http-referrer=https://playtv.unifi.com.my
https://unifi-live08.secureswiftcontent.com/UnifiHD/live08.mpd
''';

      List<Track> result = M3UParser.parse(content);

      expect(result[0].title, equals("8TV"));
      expect(result[0].kodiProps.length, equals(1));

      expect(
        result[0].kodiProps.first.containsKey(
          "inputstream.adaptive.license_key",
        ),
        equals(true),
      );
      expect(
        result[0].kodiProps.first["inputstream.adaptive.license_key"],
        equals(
          "{ \"keys\":[ { \"kty\":\"oct\", \"k\":\"BW4eSVc9LK7ly0/nj4xPPQ\", \"kid\":\"qcYZB07TjCDiWtNsPFfBDA\" } ], \"type\":\"temporary\" }",
        ),
      );
      expect(
        result[0].kodiProps.first.containsKey(
          "inputstream.adaptive.license_type",
        ),
        equals(true),
      );
      expect(
        result[0].kodiProps.first["inputstream.adaptive.license_type"],
        equals("clearkey"),
      );
      expect(
        result[0].links.first,
        equals(
          "https://unifi-live08.secureswiftcontent.com/UnifiHD/live08.mpd",
        ),
      );
      expect(
        result[0].extVlcOpts.first.containsKey("http-user-agent"),
        equals(true),
      );
      expect(
        result[0].extVlcOpts.first["http-user-agent"],
        equals(
          "Mozilla/5.0 (Linux; Android 12; Pixel 3a XL Build/SP2A.220505.008; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/114.0.5715.0 Mobile Safari/537.36",
        ),
      );
      expect(
        result[0].extVlcOpts.first.containsKey("http-referrer"),
        equals(true),
      );
      expect(
        result[0].extVlcOpts.first["http-referrer"],
        equals("https://playtv.unifi.com.my"),
      );
    });

    test('TestTrackShouldGiveHeaders:ClearKeyJsonPure:3', () async {
      final String content = r'''
#EXTM3U billed-msg="1 DEVICE SAHAJA"

#KODIPROP:inputstream.adaptive.license_type=clearkey
#KODIPROP:inputstream.adaptive.license_key={ "keys":[ { "kty":"oct", "k":"BW4eSVc9LK7ly0/nj4xPPQ", "kid":"qcYZB07TjCDiWtNsPFfBDA" } ], "type":"temporary" }
#EXTINF:-1 tvg-id="8TV.my" tvg-name="8TV" group-title="NJOI TV" tvg-logo="https://divign0fdw3sv.cloudfront.net/Images/ChannelLogo/contenthub/115_144.png",8TV
#EXTVLCOPT:http-user-agent=Mozilla/5.0 (Linux; Android 12; Pixel 3a XL Build/SP2A.220505.008; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/114.0.5715.0 Mobile Safari/537.36
#EXTVLCOPT:http-referrer=https://playtv.unifi.com.my
https://unifi-live08.secureswiftcontent.com/UnifiHD/live08.mpd
''';

      List<Track> result = M3UParser.parse(content);

      expect(result[0].title, equals("8TV"));
      expect(result[0].kodiProps.length, equals(1));

      expect(
        result[0].kodiProps.first.containsKey(
          "inputstream.adaptive.license_key",
        ),
        equals(true),
      );
      expect(
        result[0].kodiProps.first["inputstream.adaptive.license_key"],
        equals(
          "{ \"keys\":[ { \"kty\":\"oct\", \"k\":\"BW4eSVc9LK7ly0/nj4xPPQ\", \"kid\":\"qcYZB07TjCDiWtNsPFfBDA\" } ], \"type\":\"temporary\" }",
        ),
      );
      expect(
        result[0].kodiProps.first.containsKey(
          "inputstream.adaptive.license_type",
        ),
        equals(true),
      );
      expect(
        result[0].kodiProps.first["inputstream.adaptive.license_type"],
        equals("clearkey"),
      );
      expect(
        result[0].links.first,
        equals(
          "https://unifi-live08.secureswiftcontent.com/UnifiHD/live08.mpd",
        ),
      );
      expect(
        result[0].extVlcOpts.first.containsKey("http-user-agent"),
        equals(true),
      );
      expect(
        result[0].extVlcOpts.first["http-user-agent"],
        equals(
          "Mozilla/5.0 (Linux; Android 12; Pixel 3a XL Build/SP2A.220505.008; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/114.0.5715.0 Mobile Safari/537.36",
        ),
      );
      expect(
        result[0].extVlcOpts.first.containsKey("http-referrer"),
        equals(true),
      );
      expect(
        result[0].extVlcOpts.first["http-referrer"],
        equals("https://playtv.unifi.com.my"),
      );
    });

    test('TestTrackShouldGiveName:102 TV2 (SERVER 1)', () async {
      final String content = r'''
#EXTINF:-1 tvg-id="TV2" ch-number="102" tvg-name="TV2 HD"" group-title="MALAYSIA" tvg-logo="https://divign0fdw3sv.cloudfront.net/Images/ChannelLogo/contenthub/396_144.png", 102 TV2 (SERVER 1)
https://d25tgymtnqzu8s.cloudfront.net/smil:tv2/manifest.mpd
''';

      List<Track> result = M3UParser.parse(content);

      expect(result[0].title, equals("102 TV2 (SERVER 1)"));
      expect(result[0].kodiProps.length, equals(0));
    });

    test('TestTrackShouldGiveLength:1', () async {
      final String content = r'''
#EXTINF:-1 tvg-name="卡酷动画",BRTV卡酷少儿[高清]
http://192.168.1.4:7088/rtp/239.3.1.189:8000
# #EXTINF:-1 tvg-name="北京纪实",BRTV冬奥纪实[高清]
# http://192.168.1.4:7088/rtp/239.3.1.243:8000
''';

      List<Track> result = M3UParser.parse(content);

      expect(result.length, equals(1));
    });

    test('TestTrackShouldGiveName:501 Astro Awani', () async {
      final String content = r'''
#KODIPROP:inputstreamaddon=inputstream.adaptive
#KODIPROP:inputstream.adaptive.manifest_type=dash
#KODIPROP:inputstream.adaptive.license_type=org.w3.clearkey
#KODIPROP:inputstream.adaptive.license_key={ "keys":[ { "kty":"oct", "k":"UlUQz6Y0vWMK+MlfqTV2yg", "kid":"bwbzs898utDMiyHiyU37EA" } ], "type":"temporary" }
#EXTINF:-1 tvg-id="501" ch-number:"AstroAwani" ch-number=" " tvg-name="Astro Awani HD" group-title="NEWS" group-logo="https://iili.io/dMQO9t4.png" tvg-logo="https://divign0fdw3sv.cloudfront.net/Images/ChannelLogo/contenthub/84_144.png",501 Astro Awani
#EXTVLCOPT:http-user-agent=Mozilla/5.0 (Linux; Android 14; lontong-yuhu6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Mobile Safari/537.36
http://linearjitp-playback.astro.com.my/dash-wv/linear/5025/default_ott.mpd
''';

      List<Track> result = M3UParser.parse(content);

      expect(result[0].title, equals("501 Astro Awani"));
      expect(result[0].kodiProps.length, equals(1));
      expect(
        result[0].kodiProps.first.containsKey(
          "inputstream.adaptive.license_key",
        ),
        equals(true),
      );
      expect(
        result[0].kodiProps.first["inputstream.adaptive.license_key"],
        equals(
          "{ \"keys\":[ { \"kty\":\"oct\", \"k\":\"UlUQz6Y0vWMK+MlfqTV2yg\", \"kid\":\"bwbzs898utDMiyHiyU37EA\" } ], \"type\":\"temporary\" }",
        ),
      );
      expect(
        result[0].kodiProps.first.containsKey(
          "inputstream.adaptive.license_type",
        ),
        equals(true),
      );
      expect(
        result[0].kodiProps.first["inputstream.adaptive.license_type"],
        equals("org.w3.clearkey"),
      );
      expect(
        result[0].links.first,
        equals(
          "http://linearjitp-playback.astro.com.my/dash-wv/linear/5025/default_ott.mpd",
        ),
      );
      expect(
        result[0].extVlcOpts.first.containsKey("http-user-agent"),
        equals(true),
      );
      expect(
        result[0].extVlcOpts.first["http-user-agent"],
        equals(
          "Mozilla/5.0 (Linux; Android 14; lontong-yuhu6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Mobile Safari/537.36",
        ),
      );
    });
    test('TestTrackShouldGiveName:Vevo \'70s', () async {
      final String content = r'''
#EXTINF:-1   tvg-logo="https://i.postimg.cc/P5YwxwPj/Screenshot-3.png" group-title="VIDEO MUSIC"", Vevo '70s
http://stitcher-ipv4.pluto.tv/v1/stitch/embed/hls/channel/5f32f26bcd8aea00071240e5/master.m3u8?deviceType=samsung-tvplus&deviceMake=samsung&deviceModel=samsung&deviceVersion=unknown&appVersion=unknown&deviceLat=0&deviceLon=0&deviceDNT=%7BTARGETOPT%7D&deviceId=%7BPSID%7D&advertisingId=%7BPSID%7D&us_privacy=1YNY&samsung_app_domain=%7BAPP_DOMAIN%7D&samsung_app_name=%7BAPP_NAME%7D&profileLimit=&profileFloor=&embedPartner=samsung-tvplus
''';

      List<Track> result = M3UParser.parse(content);

      expect(result[0].title, equals("Vevo '70s"));
      expect(result[0].kodiProps.length, equals(0));
    });

    test('TestTrackShouldGiveName:617 Nick Jr', () async {
      final String content = r'''
#EXTINF:-1 tvg-id="NickJr" tvg-name"Nickelodeon Junior" group-title="KIDS" tvg-logo="https://divign0fdw3sv.cloudfront.net/Images/ChannelLogo/contenthub/392_144.png" ch-number="617",617 Nick Jr
#KODIPROP:inputstream.adaptive.license_type=clearkey
#KODIPROP:inputstream.adaptive.license_key={ "keys":[ { "kty":"oct", "k":"tKu+6Vtps+gKDRQScshw2w", "kid":"+mUiDJ925CQXOJnfUzptEA" } ], "type":"temporary" }
#EXTVLCOPT:http-user-agent=Mozilla/5.0 (Linux; Android 14; lontong-yuhu6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Mobile Safari/537.36
https://linearjitp-playback.astro.com.my/dash-wv/linear/9982/default_ott.mpd
''';

      List<Track> result = M3UParser.parse(content);

      expect(result[0].title, equals("617 Nick Jr"));
    });

    test('TestTrackShouldGiveName:617 Nick Jr', () async {
      final String content = r'''
#EXTINF:-1 tvg-id="NickJr" tvg-name"Nickelodeon Junior" group-title="KIDS" tvg-logo="https://divign0fdw3sv.cloudfront.net/Images/ChannelLogo/contenthub/392_144.png" ch-number="617",617 Nick Jr
#KODIPROP:inputstream.adaptive.license_type=clearkey
#KODIPROP:inputstream.adaptive.license_key={ "keys":[ { "kty":"oct", "k":"tKu+6Vtps+gKDRQScshw2w", "kid":"+mUiDJ925CQXOJnfUzptEA" } ], "type":"temporary" }
#EXTVLCOPT:http-user-agent=Mozilla/5.0 (Linux; Android 14; lontong-yuhu6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Mobile Safari/537.36
https://linearjitp-playback.astro.com.my/dash-wv/linear/9982/default_ott.mpd
''';

      List<Track> result = M3UParser.parse(content);

      expect(result[0].title, equals("617 Nick Jr"));
    });

    test('TestTrackShouldGiveName:616 Nickelodeon', () async {
      final String content = r'''
#EXTINF:-1 tvg-id="Nickelodeon" tvg-name"Nickelodeon HD" group-title="KIDS" tvg-logo="https://divign0fdw3sv.cloudfront.net/Images/ChannelLogo/contenthub/370_144.png" ch-number="616",616 Nickelodeon
#KODIPROP:inputstream.adaptive.license_type=clearkey
#KODIPROP:inputstream.adaptive.license_key={ "keys":[ { "kty":"oct", "k":"vaX3u8HkQJb3eaBhn+mIHw", "kid":"2FIOlqEoOrblvlOEdL+oEA" } ], "type":"temporary" }
#EXTVLCOPT:http-user-agent=Mozilla/5.0 (Linux; Android 14; lontong-yuhu6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Mobile Safari/537.36
https://linearjitp-playback.astro.com.my/dash-wv/linear/2511/default_ott.mpd
''';

      List<Track> result = M3UParser.parse(content);

      expect(result[0].title, equals("616 Nickelodeon"));
    });

    test('TestTrackShouldGiveName:DreamWorks ⁱⁿᵈⁱʰᵒᵐᵉ ᵗᵛ', () async {
      final String content = r'''
#KODIPROP:inputstreamaddon=inputstream.adaptive
#KODIPROP:inputstream.adaptive.manifest_type=dash
#KODIPROP:inputstream.adaptive.license_type=org.w3.clearkey
#KODIPROP:inputstream.adaptive.license_key=69646b755f3130303030303030303030:e4a2359b05563399f1d9adfce641724a
#EXTINF:-1 tvg-id="DreamWorksChannelAsia.us.id" tvg-name"Dreamworks Channel" tvg-logo="https://dl.dropboxusercontent.com/s/9rzjsn0q24b37y6/dreamworks.png" group-title="KIDS",DreamWorks ⁱⁿᵈⁱʰᵒᵐᵉ ᵗᵛ
https://cdn08jtedge.indihometv.com/dassdvr/133/dreamworks_dash/manifest_wuseetv_qRFZS.mpd
''';

      List<Track> result = M3UParser.parse(content);

      expect(result[0].title, equals("DreamWorks ⁱⁿᵈⁱʰᵒᵐᵉ ᵗᵛ"));
    });

    test('TestTrackShouldGiveName:702 HITS Now', () async {
      final String content = r'''
#EXTINF:-1 tvg-id="HITSNow" group-title="MOVIES" group-logo="https://aqfadtv.xyz/images/entertainment.png" tvg-logo="https://aqfadtv.xyz/logos/HITSNow.png", ch-number="702",702 HITS Now
#KODIPROP:inputstream.adaptive.license_type=clearkey
#KODIPROP:inputstream.adaptive.license_key=https://ck-server.danng.me/?username=HishamKamarul&channelid=5110
#EXTVLCOPT:http-user-agent=Mozilla/5.0 (Linux; Android 14; lontong-yuhu6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Mobile Safari/537.36
https://linearjitp-playback.astro.com.my/dash-wv/linear/5110/default_ott.mpd
''';

      List<Track> result = M3UParser.parse(content);

      expect(result[0].title, equals("702 HITS Now"));
    });

    test('TestTrackShouldGiveName:TV1', () async {
      final String content = r'''
#EXTINF:-1 tvg-id="101.astro" tvg-logo="http://linear-poster.astro.com.my/prod/logo/TV1_v1.png" group-logo="" group-title="MYTV",TV1
https://raw.githubusercontent.com/mystery75/m3u8/main/TV1.m3u8
#https://d25tgymtnqzu8s.cloudfront.net/smil:tv1/manifest.mpd
''';

      List<Track> result = M3UParser.parse(content);

      expect(result[0].title, equals("TV1"));
    });

    test('TestTrackShouldGiveName:CARTOON NETWORK (IndiHomeTV)', () async {
      final String content = r'''
#EXTINF:-1 tvg-id="" tvg-logo="https://upload.wikimedia.org/wikipedia/commons/thumb/8/80/Cartoon_Network_2010_logo.svg/1200px-Cartoon_Network_2010_logo.svg.png" group-logo="" group-title="KIDS",CARTOON NETWORK (IndiHomeTV)
https://github.com/MIFNtechnology/siaranMy/raw/refs/heads/main/channels/CartoonNetwork/index.m3u8
''';

      List<Track> result = M3UParser.parse(content);

      expect(result[0].title, equals("CARTOON NETWORK (IndiHomeTV)"));
    });

    test('TestTrackShouldGiveName:Animax (3)', () async {
      final String content = r'''
#KODIPROP:inputstreamaddon=inputstream.adaptive
#KODIPROP:inputstream.adaptive.manifest_type=dash
#KODIPROP:inputstream.adaptive.license_type=org.w3.clearkey
#KODIPROP:inputstream.adaptive.license_key={ "keys":[ { "kty":"oct", "k":"L1oxmbJum2k66IGvf/hkzw", "kid":"7fGnFd6XSGON0vrXWkGa8g" } ], "type":"temporary" }
#EXTINF:-1 group-title="ANIME" tvg-id="" tvg-chno="" group-logo="" tvg-logo="https://i.ibb.co/zsDGJDK/trtrtrt.jpg",Animax (3)
https://tglmp01.akamaized.net/out/v1/de55fad9216e4fe7ad8d2eed456ba1ec/manifest.mpd
''';

      List<Track> result = M3UParser.parse(content);

      expect(result[0].title, equals("Animax (3)"));
    });

    test(
      'TestTrackShouldGiveName:Kompleks Sukan Shah Alam (KSSA) Teaser',
      () async {
        final String content = r'''
#EXTINF:-1 tvg-id="" tvg-logo="https://assets.bharian.com.my/images/articles/sshahaha_1674979001.jpg" group-logo="" group-title="TEST",Kompleks Sukan Shah Alam (KSSA) Teaser
https://v.redd.it/x2e69l46vdea1/HLS_576.m3u8
''';

        List<Track> result = M3UParser.parse(content);

        expect(
          result[0].title,
          equals("Kompleks Sukan Shah Alam (KSSA) Teaser"),
        );
        expect(result[0].groupTitle, equals("TEST"));
        expect(result[0].tvgId, equals(""));
        expect(
          result[0].tvgLogo,
          equals(
            "https://assets.bharian.com.my/images/articles/sshahaha_1674979001.jpg",
          ),
        );
        expect(
          result[0].links.first,
          equals("https://v.redd.it/x2e69l46vdea1/HLS_576.m3u8"),
        );
      },
    );

    test('TestTrackShouldGiveName:Hot FM', () async {
      final String content = r'''
#EXTINF:-1 tvg-id="" ch-number="976" tvg-name="Hot FM" group-title="RADIO" tvg-logo"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSzuZAw9V6Gej63cikLeVuX4cx-hJB3d7ftSQ&s",Hot FM
https://n30a-eu.rcs.revma.com/drakdf8mtd3vv/48_1vmr9fw8eh2ml02/playlist.m3u8?rj-ttl=5&rj-tok=AAABlC_DOo8Ac734sTC2N2aVIQ
''';

      List<Track> result = M3UParser.parse(content);

      expect(result[0].title, equals("Hot FM"));
    });

    test('TestTrackShouldGiveName:Hot FM', () async {
      final String content = r'''
#EXTINF:-1 tvg-id="" ch-number="976" tvg-name="Hot FM" group-title="RADIO" tvg-logo"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSzuZAw9V6Gej63cikLeVuX4cx-hJB3d7ftSQ&s",Hot FM
https://n30a-eu.rcs.revma.com/drakdf8mtd3vv/48_1vmr9fw8eh2ml02/playlist.m3u8?rj-ttl=5&rj-tok=AAABlC_DOo8Ac734sTC2N2aVIQ
''';

      List<Track> result = M3UParser.parse(content);

      expect(result[0].title, equals("Hot FM"));
    });

    test('TestTrackShouldGiveName:ANIMAX', () async {
      final String content = r'''
#KODIPROP:inputstreamaddon=inputstream.adaptive
#KODIPROP:inputstream.adaptive.manifest_type=dash
#KODIPROP:inputstream.adaptive.license_type=org.w3.clearkey
#KODIPROP:inputstream.adaptive.license_key={ "keys":[ { "kty":"oct", "k":"L1oxmbJum2k66IGvf/hkzw", "kid":"7fGnFd6XSGON0vrXWkGa8g" } ], "type":"temporary" }
#EXTINF:-1 group-title="KIDS" tvg-id="472.unifi" group-logo=" tvg-logo="https://www.animax-asia.com/sites/animax-asia.com/files/logos/animax-logo_0.png",ANIMAX
https://tglmp01.akamaized.net/out/v1/de55fad9216e4fe7ad8d2eed456ba1ec/manifest.mpd

''';

      List<Track> result = M3UParser.parse(content);

      expect(result[0].title, equals("ANIMAX"));
      expect(result[0].kodiProps.length, equals(1));
      expect(
        result[0].kodiProps.first.containsKey(
          "inputstream.adaptive.license_key",
        ),
        equals(true),
      );
      expect(
        result[0].kodiProps.first["inputstream.adaptive.license_key"],
        equals(
          "{ \"keys\":[ { \"kty\":\"oct\", \"k\":\"L1oxmbJum2k66IGvf/hkzw\", \"kid\":\"7fGnFd6XSGON0vrXWkGa8g\" } ], \"type\":\"temporary\" }",
        ),
      );
      expect(
        result[0].kodiProps.first.containsKey(
          "inputstream.adaptive.license_type",
        ),
        equals(true),
      );
      expect(
        result[0].kodiProps.first["inputstream.adaptive.license_type"],
        equals("org.w3.clearkey"),
      );
      expect(
        result[0].links.first,
        equals(
          "https://tglmp01.akamaized.net/out/v1/de55fad9216e4fe7ad8d2eed456ba1ec/manifest.mpd",
        ),
      );
    });

    test('TestTrackShouldGiveValidUrlWithInvalidOrder:ANIMAX', () async {
      final String content = r'''
#EXTM3U

#EXTINF:-1 group-title="KIDS" tvg-id="472.unifi" group-logo=" tvg-logo="https://www.animax-asia.com/sites/animax-asia.com/files/logos/animax-logo_0.png",ANIMAX
https://tglmp01.akamaized.net/out/v1/de55fad9216e4fe7ad8d2eed456ba1ec/manifest.mpd
#KODIPROP:inputstreamaddon=inputstream.adaptive
#KODIPROP:inputstream.adaptive.manifest_type=dash
#KODIPROP:inputstream.adaptive.license_type=org.w3.clearkey
#KODIPROP:inputstream.adaptive.license_key={ "keys":[ { "kty":"oct", "k":"L1oxmbJum2k66IGvf/hkzw", "kid":"7fGnFd6XSGON0vrXWkGa8g" } ], "type":"temporary" }

''';

      List<Track> result = M3UParser.parse(content);

      expect(result[0].title, equals("ANIMAX"));
      expect(result[0].kodiProps.length, equals(1));
      expect(
        result[0].kodiProps.first.containsKey(
          "inputstream.adaptive.license_key",
        ),
        equals(true),
      );
      expect(
        result[0].kodiProps.first["inputstream.adaptive.license_key"],
        equals(
          "{ \"keys\":[ { \"kty\":\"oct\", \"k\":\"L1oxmbJum2k66IGvf/hkzw\", \"kid\":\"7fGnFd6XSGON0vrXWkGa8g\" } ], \"type\":\"temporary\" }",
        ),
      );
      expect(
        result[0].kodiProps.first.containsKey(
          "inputstream.adaptive.license_type",
        ),
        equals(true),
      );
      expect(
        result[0].kodiProps.first["inputstream.adaptive.license_type"],
        equals("org.w3.clearkey"),
      );
      expect(
        result[0].links.first,
        equals(
          "https://tglmp01.akamaized.net/out/v1/de55fad9216e4fe7ad8d2eed456ba1ec/manifest.mpd",
        ),
      );
    });

    test('TestTrackShouldGiveLength:1', () async {
      final String content = r'''
#EXTINF:-1 tvg-name="卡酷动画",BRTV卡酷少儿[高清]
http://192.168.1.4:7088/rtp/239.3.1.189:8000
# #EXTINF:-1 tvg-name="北京纪实",BRTV冬奥纪实[高清]
# http://192.168.1.4:7088/rtp/239.3.1.243:8000
''';

      List<Track> result = M3UParser.parse(content);

      expect(result.length, equals(1));
    });

    test('TestTrackShouldGiveName:Ambient Sleeping Pill [Opt-1]', () async {
      // ini adalah malformed EXTINF
      final String content = r'''
#EXTINF:-1,#EXTINF:0,Ambient Sleeping Pill [Opt-1]
http://tvmate.icu:8080/3KfKch/070831/14823
''';

      List<Track> result = M3UParser.parse(content);

      expect(result.length, equals(1));
      expect(result[0].title, equals("Ambient Sleeping Pill [Opt-1]"));
    });

    test(
      'TestTrackShouldGiveName:Party Vibe: Techno, House, Trance, Electronic live',
      () async {
        // ini adalah malformed = #EXTINF:-1,House -  Trance, Electronic live"
        final String content = r'''
#EXTINF:-1,House -  Trance, Electronic live" tvg-logo="" group-title="Radio stations",Party Vibe: Techno, House, Trance, Electronic live
http://tvmate.icu:8080/3KfKch/070831/122865
''';

        List<Track> result = M3UParser.parse(content);

        expect(result.length, equals(1));

        expect(
          result[0].title,
          equals("Party Vibe: Techno, House, Trance, Electronic live"),
        );
        expect(result[0].groupTitle, equals("Radio stations"));
      },
    );

    test(
      'TestTrackShouldGiveName:NCAAF 044 | HAMPTON VS HOWARD (IN WASHINGTON, DC) | 09/20-04:00PM | ESPN+',
      () async {
        // ini adalah malformed = #EXTINF:-1,DC) | 09/20-04:00PM | "
        final String content = r'''
#EXTINF:-1,DC) | 09/20-04:00PM | ESPN+" tvg-logo="https://restream.tv4k.me:2096/images/AbD8VtJ_IyZz67zilLXsxhypO-MwxZHNGldlaZV2bRKMGtBbWbtdaBGlzHTdrQPV-77pvKrqV6aHQzg78jp75tIHOxmSMsfpXN8o9dl_euU.jpg" group-title="EVENT | NCAAF" - NCAAF 044 | HAMPTON VS HOWARD (IN WASHINGTON, DC) | 09/20-04:00PM | ESPN+
http://tvmate.icu:8080/3KfKch/070831/251662
''';

        List<Track> result = M3UParser.parse(content);

        expect(result.length, equals(1));

        expect(
          result[0].title,
          equals(
            "NCAAF 044 | HAMPTON VS HOWARD (IN WASHINGTON, DC) | 09/20-04:00PM | ESPN+",
          ),
        );
        expect(result[0].groupTitle, equals("EVENT | NCAAF"));
      },
    );

    test(
      'TestTrackShouldGiveName:NCAAF 044 | HAMPTON VS HOWARD (IN WASHINGTON, DC) | 09/20-04:00PM | ESPN+',
      () async {
        // ini adalah malformed = #EXTINF:-1,EXTINF:-1,
        final String content = r'''
#EXTINF:-1,EXTINF:-1,RADIO 60s&70s(1.fm) – UK (70e, 60e)
http://tvmate.icu:8080/3KfKch/070831/14749
''';

        List<Track> result = M3UParser.parse(content);

        expect(result.length, equals(1));

        expect(result[0].title, equals("RADIO 60s&70s(1.fm) – UK (70e, 60e)"));
      },
    );

    test(
      'TestTrackShouldGiveName:Meet the Pickles: The Making of "Win or Lose" (2025)',
      () async {
        // ini adalah malformed = #EXTINF:-1,DC) | 09/20-04:00PM | "
        final String content = r'''
#EXTINF:-1,Meet the Pickles: The Making of "Win or Lose" (2025)
http://tvmate.icu:8080/movie/3KfKch/070831/249994.mp4
''';

        List<Track> result = M3UParser.parse(content);

        expect(result.length, equals(1));

        expect(
          result[0].title,
          equals("Meet the Pickles: The Making of \"Win or Lose\" (2025)"),
        );
      },
    );

    test('Test8TV:ShouldGiveTwoTracks', () async {
      final String content = r'''
#EXTM3U billed-msg="1 DEVICE SAHAJA"

#KODIPROP:inputstream.adaptive.license_type=clearkey
#KODIPROP:inputstream.adaptive.license_key={ "keys":[ { "kty":"oct", "k":"BW4eSVc9LK7ly0/nj4xPPQ", "kid":"qcYZB07TjCDiWtNsPFfBDA" } ], "type":"temporary" }
#EXTINF:-1 tvg-id="8TV.my" tvg-name="8TV" group-title="MALAYSIA" tvg-logo="https://divign0fdw3sv.cloudfront.net/Images/ChannelLogo/contenthub/115_144.png",148 8TV
#EXTVLCOPT:http-user-agent=Mozilla/5.0 (Linux; Android 14; lontong-yuhu6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Mobile Safari/537.36
#EXTVLCOPT:http-referrer=https://playtv.unifi.com.my
https://unifi-live08.secureswiftcontent.com/UnifiHD/live08.mpd

#KODIPROP:inputstream.adaptive.license_type=clearkey
#KODIPROP:inputstream.adaptive.license_key={ "keys":[ { "kty":"oct", "k":"BW4eSVc9LK7ly0/nj4xPPQ", "kid":"qcYZB07TjCDiWtNsPFfBDA" } ], "type":"temporary" }
#EXTINF:-1 tvg-id="8TV.my" tvg-name="8TV" group-title="ASTRXX NJOI" tvg-logo="https://divign0fdw3sv.cloudfront.net/Images/ChannelLogo/contenthub/115_144.png",8TV
#EXTVLCOPT:http-user-agent=Mozilla/5.0 (Linux; Android 12; Pixel 3a XL Build/SP2A.220505.008; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/114.0.5715.0 Mobile Safari/537.36
#EXTVLCOPT:http-referrer=https://playtv.unifi.com.my
https://unifi-live08.secureswiftcontent.com/UnifiHD/live08.mpd
''';

      List<Track> result = M3UParser.parse(content);

      expect(result.length, equals(2));

      expect(result.first.title, equals("148 8TV"));
      expect(result.last.title, equals("8TV"));
      expect(result.first.kodiProps.length, equals(1));
      expect(result.last.kodiProps.length, equals(1));
      expect(
        result.first.kodiProps.first.containsKey(
          "inputstream.adaptive.license_key",
        ),
        equals(true),
      );
      expect(
        result.last.kodiProps.first.containsKey(
          "inputstream.adaptive.license_key",
        ),
        equals(true),
      );
      expect(
        result.first.kodiProps.first["inputstream.adaptive.license_key"],
        equals(
          "{ \"keys\":[ { \"kty\":\"oct\", \"k\":\"BW4eSVc9LK7ly0/nj4xPPQ\", \"kid\":\"qcYZB07TjCDiWtNsPFfBDA\" } ], \"type\":\"temporary\" }",
        ),
      );
      expect(
        result.last.kodiProps.first["inputstream.adaptive.license_key"],
        equals(
          "{ \"keys\":[ { \"kty\":\"oct\", \"k\":\"BW4eSVc9LK7ly0/nj4xPPQ\", \"kid\":\"qcYZB07TjCDiWtNsPFfBDA\" } ], \"type\":\"temporary\" }",
        ),
      );
      expect(
        result.first.kodiProps.first.containsKey(
          "inputstream.adaptive.license_type",
        ),
        equals(true),
      );
      expect(
        result.last.kodiProps.first.containsKey(
          "inputstream.adaptive.license_type",
        ),
        equals(true),
      );
      expect(
        result.first.kodiProps.first["inputstream.adaptive.license_type"],
        equals("clearkey"),
      );
      expect(
        result.last.kodiProps.first["inputstream.adaptive.license_type"],
        equals("clearkey"),
      );
      expect(result.first.links.length, equals(1));
      expect(result.last.links.length, equals(1));
      expect(
        result.first.links.first,
        equals(
          "https://unifi-live08.secureswiftcontent.com/UnifiHD/live08.mpd",
        ),
      );
      expect(
        result.last.links.first,
        equals(
          "https://unifi-live08.secureswiftcontent.com/UnifiHD/live08.mpd",
        ),
      );
      expect(result.first.extVlcOpts.length, equals(1));
      expect(result.last.extVlcOpts.length, equals(1));
      expect(
        result.first.extVlcOpts.first.containsKey("http-user-agent"),
        equals(true),
      );
      expect(
        result.last.extVlcOpts.first.containsKey("http-user-agent"),
        equals(true),
      );
      expect(
        result.first.extVlcOpts.first["http-user-agent"],
        equals(
          "Mozilla/5.0 (Linux; Android 14; lontong-yuhu6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Mobile Safari/537.36",
        ),
      );
      expect(
        result.last.extVlcOpts.first["http-user-agent"],
        equals(
          "Mozilla/5.0 (Linux; Android 12; Pixel 3a XL Build/SP2A.220505.008; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/114.0.5715.0 Mobile Safari/537.36",
        ),
      );
      expect(
        result.first.extVlcOpts.first.containsKey("http-referrer"),
        equals(true),
      );
      expect(
        result.last.extVlcOpts.first.containsKey("http-referrer"),
        equals(true),
      );
      expect(
        result.first.extVlcOpts.first["http-referrer"],
        equals("https://playtv.unifi.com.my"),
      );
      expect(
        result.last.extVlcOpts.first["http-referrer"],
        equals("https://playtv.unifi.com.my"),
      );
    });

    // TEST TEMPORARY WITH FILE

    // test('tmpTest:GenericCase:1', () async {
    //   final file = File('fixtures/digital.m3u');
    //   final contentFile = await file.readAsString();

    //   final String content = contentFile;

    //   List<Track> result = M3UParser.parse(content);

    //   final filter = result.where((element) => element.title.contains("8TV"));

    //   expect(filter.length, equals(2));

    //   expect(filter.first.title, equals("148 8TV"));
    //   expect(filter.last.title, equals("8TV"));
    //   expect(filter.first.kodiProps.length, equals(1));
    //   expect(filter.last.kodiProps.length, equals(1));
    //   expect(
    //     filter.first.kodiProps.first.containsKey(
    //       "inputstream.adaptive.license_key",
    //     ),
    //     equals(true),
    //   );
    //   expect(
    //     filter.last.kodiProps.first.containsKey(
    //       "inputstream.adaptive.license_key",
    //     ),
    //     equals(true),
    //   );
    //   expect(
    //     filter.first.kodiProps.first["inputstream.adaptive.license_key"],
    //     equals(
    //       "{ \"keys\":[ { \"kty\":\"oct\", \"k\":\"BW4eSVc9LK7ly0/nj4xPPQ\", \"kid\":\"qcYZB07TjCDiWtNsPFfBDA\" } ], \"type\":\"temporary\" }",
    //     ),
    //   );
    //   expect(
    //     filter.last.kodiProps.first["inputstream.adaptive.license_key"],
    //     equals(
    //       "{ \"keys\":[ { \"kty\":\"oct\", \"k\":\"BW4eSVc9LK7ly0/nj4xPPQ\", \"kid\":\"qcYZB07TjCDiWtNsPFfBDA\" } ], \"type\":\"temporary\" }",
    //     ),
    //   );
    //   expect(
    //     filter.first.kodiProps.first.containsKey(
    //       "inputstream.adaptive.license_type",
    //     ),
    //     equals(true),
    //   );
    //   expect(
    //     filter.last.kodiProps.first.containsKey(
    //       "inputstream.adaptive.license_type",
    //     ),
    //     equals(true),
    //   );
    //   expect(
    //     filter.first.kodiProps.first["inputstream.adaptive.license_type"],
    //     equals("clearkey"),
    //   );
    //   expect(
    //     filter.last.kodiProps.first["inputstream.adaptive.license_type"],
    //     equals("clearkey"),
    //   );
    //   expect(filter.first.links.length, equals(1));
    //   expect(filter.last.links.length, equals(1));
    //   expect(
    //     filter.first.links.first,
    //     equals(
    //       "https://unifi-live08.secureswiftcontent.com/UnifiHD/live08.mpd",
    //     ),
    //   );
    //   expect(
    //     filter.last.links.first,
    //     equals(
    //       "https://unifi-live08.secureswiftcontent.com/UnifiHD/live08.mpd",
    //     ),
    //   );
    //   expect(filter.first.extVlcOpts.length, equals(1));
    //   expect(filter.last.extVlcOpts.length, equals(1));
    //   expect(
    //     filter.first.extVlcOpts.first.containsKey("http-user-agent"),
    //     equals(true),
    //   );
    //   expect(
    //     filter.last.extVlcOpts.first.containsKey("http-user-agent"),
    //     equals(true),
    //   );
    //   expect(
    //     filter.first.extVlcOpts.first["http-user-agent"],
    //     equals(
    //       "Mozilla/5.0 (Linux; Android 14; lontong-yuhu6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Mobile Safari/537.36",
    //     ),
    //   );
    //   expect(
    //     filter.last.extVlcOpts.first["http-user-agent"],
    //     equals(
    //       "Mozilla/5.0 (Linux; Android 12; Pixel 3a XL Build/SP2A.220505.008; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/114.0.5715.0 Mobile Safari/537.36",
    //     ),
    //   );
    //   expect(
    //     filter.first.extVlcOpts.first.containsKey("http-referrer"),
    //     equals(true),
    //   );
    //   expect(
    //     filter.last.extVlcOpts.first.containsKey("http-referrer"),
    //     equals(true),
    //   );
    //   expect(
    //     filter.first.extVlcOpts.first["http-referrer"],
    //     equals("https://playtv.unifi.com.my"),
    //   );
    //   expect(
    //     filter.last.extVlcOpts.first["http-referrer"],
    //     equals("https://playtv.unifi.com.my"),
    //   );
    // });

    // test('tmpTest:GenericCase:2', () async {
    //   final String key = BetterPlayerClearKeyUtils.generateKey({
    //     "71cbdf02b595468bb77398222e1ade09": "c3f2aa420b8908ab8761571c01899460",
    //   });

    //   print(key);
    // });
  });
}
