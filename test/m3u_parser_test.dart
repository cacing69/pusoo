import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:pusoo/core/utils/m3u_parser.dart';
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

      expect("Hanacaraka, Lorem Ipsum", equals(item.title));
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
        "https://op-group1-swiftservehd-1.dens.tv/h/h217/02.m3u8",
        equals(item.links.first),
      );

      expect(true, equals(httpHeaders.containsKey("user-agent")));

      expect(
        "DENSGO/3.00.00 (Linux;Android 15.0.0;) ExoPlayerLib/2.19.1",
        equals(httpHeaders["user-agent"]),
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
        "https://d2xz2v5wuvgur6.cloudfront.net/out/v1/2fcc58ccec8c45e9aa094fb980eb642d/index.mpd",
        equals(item.links.first),
      );

      expect(true, equals(httpHeaders.containsKey("referrer")));

      expect("https://visionplus.id/", equals(httpHeaders["referrer"]));
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

      expect(true, equals(kodiProps.containsKey("inputstreamaddon")));
      expect(
        true,
        equals(kodiProps.containsKey("inputstream.adaptive.manifest_type")),
      );
      expect(
        true,
        equals(kodiProps.containsKey("inputstream.adaptive.license_type")),
      );
      expect(
        true,
        equals(kodiProps.containsKey("inputstream.adaptive.license_key")),
      );

      // Test Value
      expect("inputstream.adaptive", equals(kodiProps["inputstreamaddon"]));

      expect("dash", equals(kodiProps["inputstream.adaptive.manifest_type"]));

      expect(
        "clearkey",
        equals(kodiProps["inputstream.adaptive.license_type"]),
      );

      expect(
        "b576e5f5f1bc4cbaa866e5b0face5a30:3377be6c3b5f688ebed687312c9b9d95",
        equals(kodiProps["inputstream.adaptive.license_key"]),
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

      expect(true, equals(extVlcOpts.containsKey("http-user-agent")));

      // Test Value
      expect(
        "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36",
        equals(extVlcOpts["http-user-agent"]),
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

      expect(true, equals(extVlcOpts.containsKey("http-user-agent")));
      expect(true, equals(extVlcOpts.containsKey("http-referrer")));

      // Test Value
      expect(
        "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36",
        equals(extVlcOpts["http-user-agent"]),
      );

      expect("https://visionplus.id/", equals(extVlcOpts["http-referrer"]));
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

      expect(2, equals(item.links.length));
      expect(2, equals(item.httpHeaders.length));
      expect(2, equals(item.kodiProps.length));

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
      expect(true, equals(item.httpHeaders[0].containsKey("referer")));
      expect(true, equals(item.httpHeaders[0].containsKey("user-agent")));

      expect(
        "https://www.visionplus.id/",
        equals(item.httpHeaders[0]["referer"]),
      );
      expect(
        "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36",
        equals(item.httpHeaders[0]["user-agent"]),
      );

      expect(true, equals(item.httpHeaders[1].containsKey("referer")));
      expect(true, equals(item.httpHeaders[1].containsKey("user-agent")));

      expect(
        "https://www.visionplus.id/",
        equals(item.httpHeaders[1]["referer"]),
      );
      expect(
        "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36",
        equals(item.httpHeaders[1]["user-agent"]),
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
        true,
        equals(kodiProps.containsKey("inputstream.adaptive.license_type")),
      );

      expect(
        true,
        equals(kodiProps.containsKey("inputstream.adaptive.license_key")),
      );

      expect(
        true,
        equals(kodiProps.containsKey("inputstream.adaptive.stream_headers")),
      );

      expect(
        "com.widevine.alpha",
        equals(kodiProps["inputstream.adaptive.license_type"]),
      );

      expect(
        "https://cubmu-cindo.cenc16995.workers.dev/",
        equals(kodiProps["inputstream.adaptive.license_key"]),
      );

      expect(
        "user-agent=Xstream XGO/1.22 (Linux;Android 9) ExoPlayerLib/2.10.5",
        equals(kodiProps["inputstream.adaptive.stream_headers"]),
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

      expect("TNT SPORTS 2 FHD", equals(item.title));
      expect("TNT 2", equals(item.attributes["tvg-id"]));
    });

    test('testeHaveAttrXuiId', () async {
      final String content = r'''
#EXTINF:-1 xui-id="{XUI_ID}" tvg-id="NowSports2.hk" tvg-name="HK | Now Sports 2" tvg-logo="http://b1gchlogos.xyz/wp-content/uploads/2023/08/Now-Sports-2.png" group-title="CHANNEL | SPORTS",HK | Now Sports 2
https://raw.githubusercontent.com/B-inal-123/s-asia/inal-22/Nowsport2.m3u8
''';
      List<Track> result = M3UParser.parse(content);

      Track item = result.first;

      expect("{XUI_ID}", equals(item.attributes["xui-id"]));
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

      expect(2, equals(items.length));

      // CHECCK EVERY ITEM
      // ONE HD : 1
      expect(
        "https://atemecdnbalancer-voe.sysln.id/live/eds/ONEHD/mpd/ONEHD.mpd",
        equals(items[0].links.first),
      );

      expect(
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSCDGeSdmHlQ9vXAaRORx9-fhbeCx8_81AnQQ&s",
        equals(items[0].attributes["tvg-logo"]),
      );

      // ONE HD : 2
      expect(
        "https://atemecdnbalancer-voe.sysln.id/live/eds/ONEHD/mpd/ONEHD.mpd",
        equals(items[1].links.first),
      );
      expect(
        "https://www.visionplus.id/images/repository/634/634-LOGO-m.png",
        equals(items[1].attributes["tvg-logo"]),
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

      expect("aktif malam", equals(item.title));

      expect(true, equals(item.attributes.containsKey("group-title")));
      expect("🔒 TENSI SUB 🔒", equals(item.attributes["group-title"]));

      expect(true, equals(item.attributes.containsKey("tvg-logo")));
      expect(
        "https://www.mediafire.com/convkey/334f/6h7nlypi651hwqd5g",
        equals(item.attributes["tvg-logo"]),
      );

      expect(2, equals(item.links.length));
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
      expect(13, equals(result.length));

      expect("BLOOD AND SAND-S1 EPS 1", equals(result[0].title));
      expect("BLOOD AND SAND-S1 EPS 2", equals(result[1].title));
      expect("BLOOD AND SAND-S1 EPS 3", equals(result[2].title));
      expect("BLOOD AND SAND-S1 EPS 4", equals(result[3].title));
      expect("BLOOD AND SAND-S1 EPS 5", equals(result[4].title));
      expect("BLOOD AND SAND-S1 EPS 6", equals(result[5].title));
      expect("BLOOD AND SAND-S1 EPS 7", equals(result[6].title));
      expect("BLOOD AND SAND-S1 EPS 8", equals(result[7].title));
      expect("BLOOD AND SAND-S1 EPS 9", equals(result[8].title));
      expect("BLOOD AND SAND-S1 EPS 10", equals(result[9].title));
      expect("BLOOD AND SAND-S1 EPS 11", equals(result[10].title));
      expect("BLOOD AND SAND-S1 EPS 12", equals(result[11].title));
      expect("BLOOD AND SAND-S1 EPS 13", equals(result[12].title));
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

      expect(2, equals(result.length));

      expect("NBA TV (Indi)", equals(result[0].title));
      expect("NBA TV", equals(result[1].title));
    });

    test('testTvgIdAndTvgLogoOnTrack:1', () async {
      final String content = r'''
#EXTINF:-1 xui-id="{XUI_ID}" tvg-id="AstroPremierLeague.my" tvg-name="MY | Astro Premier League 1 FHD" tvg-logo="https://b1gchlogos.xyz/wp-content/uploads/2024/10/Astro_Premier_League_1_2024.png" group-title="CHANNEL | SPORTS",MY | Astro Premier League 1
##https://5nhp186eg31fofnc.chinese-restaurant-api.site/v3/variant/VE1AO1NTbu8mbv12LxEWM21ycrNWYyR3L3cTOhNmZ4UWZ2E2YtcjZ0kTLzYzN00iY0QmYtY2MmRTM3QTY/master.m3u8
http://royalibox.com:80/plcedarkaouishbissm/px6pzjgmf8/1163984
''';

      List<Track> result = M3UParser.parse(content);

      final Track item = result.first;

      expect("AstroPremierLeague.my", equals(item.tvgId));
      expect("MY | Astro Premier League 1 FHD", equals(item.tvgName));
      expect(
        "https://b1gchlogos.xyz/wp-content/uploads/2024/10/Astro_Premier_League_1_2024.png",
        equals(item.tvgLogo),
      );
      expect("CHANNEL | SPORTS", equals(item.groupTitle));
      expect("MY | Astro Premier League 1", equals(item.title));
    });

    test('TestShouldGetName:The Life of Chuck (2025)', () async {
      final String content = r'''
#EXTINF:-1 tvg-id="5002:0:19:112F8:0:0:0:0:0:0" tvg-logo="https://gamatotv.info/wp-content/uploads/2025/09/oumprkO9bThExP8NwxBIBnvBu2v1-200x300.jpg"
group-title="RYANTV MOVIES 2025", The Life of Chuck (2025)
http://s1.gmtcloud.site/video/moviess/TheLifeofChuck2024.mp4?id=0
''';

      List<Track> result = M3UParser.parse(content);

      final Track item = result.first;

      expect("The Life of Chuck (2025)", equals(item.title));
      expect("RYANTV MOVIES 2025", equals(item.groupTitle));
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

      expect("Movies,1 Kakak 7 Ponakan (2025)", equals(item.title));
      expect("Movies", equals(item.groupTitle));
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
      expect("Denver1769", equals(item.extVlcOpts.first["http-user-agent"]));
      expect(
        "https://game.denver1769.fun/Jtv/2HZyBc/Jtv.mpd?id=166",
        equals(item.links.first),
      );

      expect(true, equals(item.httpHeaders.first.containsKey("user-agent")));
      expect("Denver1769", equals(item.httpHeaders.first["user-agent"]));
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
      expect("LIVE", equals(item.groupTitle));
      expect("tv", equals(item.title));
      expect("", equals(item.extVlcOpts.first["http-user-agent"]));
      expect(
        "https://bldcmprod-cdn.toffeelive.com/cdn/live/sony_sports_1_hd/playlist.m3u8",
        equals(item.links.first),
      );

      expect(true, equals(item.httpHeaders.first.containsKey("cookie")));
      expect(
        "Edge-Cache-Cookie=URLPrefix=aHR0cHM6Ly9ibGRjbXByb2QtY2RuLnRvZmZlZWxpdmUuY29tLw:Expires=1750297799:KeyName=prod_linear:Signature=TDBMq5Xc03aTvlgHIbGzOJRfXo1Ci6MBkMVPtER7RMKYwBr6xRLqsXpDCYdHaDC_ojg5k5EC7ww-uWB62kirBg",
        equals(item.httpHeaders.first["cookie"]),
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
https://habetar.com/stream/HG0yxg6811DqlFTuVEC1Gw/kjhhiuahiuhgihdf/1755465140/55567685/master.m3u8
#EXTINF:-1 tvg-id="" tvg-logo="https://images4.imagebam.com/ab/a2/c7/ME151SY1_o.jpg" group-title="Movies",    	Singsot: Siulan Kematian (2025)Tidak ada voting
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
      print(item.extVlcOpts);
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
      expect(kodiProps.containsKey("inputstream.adaptive.license_type"), equals(true));
      expect(kodiProps["inputstream.adaptive.license_type"], equals("org.w3.clearkey"));
      expect(kodiProps.containsKey("inputstream.adaptive.license_key"), equals(true));
      expect(kodiProps["inputstream.adaptive.license_key"], equals("3b0c1cebd0c4518d600f52c354ed1910:76d409ffc4eaa012c61d8c31bd13df5d"));
      expect(kodiProps.containsKey("inputstream.adaptive.stream_headers"), equals(true));
      expect(kodiProps["inputstream.adaptive.stream_headers"], equals("referer=https://astrogo.astro.com.my//&user-agent=Mozilla/5.0 (Linux; Android 10; MI 9 Build/QKQ1.190825.002; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/111.0.5563.58 Mobile Safari/537.36"));
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
      expect(kodiProps.containsKey("inputstream.adaptive.license_type"), equals(true));
      expect(kodiProps["inputstream.adaptive.license_type"], equals("org.w3.clearkey"));
      expect(kodiProps.containsKey("inputstream.adaptive.license_key"), equals(true));
      expect(kodiProps["inputstream.adaptive.license_key"], equals("faf4d62bb898de503446c28fb1aa9210:19e80ecc5d337215c64004cb49c9cb01"));
      expect(kodiProps.containsKey("inputstream.adaptive.stream_headers"), equals(true));
      expect(kodiProps["inputstream.adaptive.stream_headers"], equals("User-Agent=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36"));
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
      expect(item.tvgLogo, equals("https://jiotvimages.cdn.jio.com/dare_images/images/Star_Sports_Select_1.png"));
      expect(item.links.first, equals("https://jiotvpllive.cdn.jio.com/bpk-tv/Star_Sports_Select_1_BTS/output/index.mpd?__hdnea__=st=1758107257~exp=1758193657~acl=/*~hmac=99dec41934473d7fb71e7850a7a088fdb138b63b884a511c262244beefee8bed&xxx=%7Ccookie=__hdnea__=st=1758107257~exp=1758193657~acl=/*~hmac=99dec41934473d7fb71e7850a7a088fdb138b63b884a511c262244beefee8bed"));

      expect(item.kodiProps.first.containsKey("inputstream.adaptive.license_type"), equals(true));
      expect(item.kodiProps.first["inputstream.adaptive.license_type"], equals("clearkey"));
      expect(item.kodiProps.first.containsKey("inputstream.adaptive.license_key"), equals(true));
      expect(item.kodiProps.first["inputstream.adaptive.license_key"], equals("ea7985dacbb95f1c9d62e5a1675142e5:39d5910ca04841b5f32bf24623cdae58"));

      expect(item.extVlcOpts.first.containsKey("http-user-agent"), equals(true));
      expect(item.extVlcOpts.first["http-user-agent"], equals("plaYtv/7.1.3 (Linux;Android 13) ygx/69.1 ExoPlayerLib/824.0"));

      expect(item.httpHeaders.first.containsKey("cookie"), equals(true));
      expect(item.httpHeaders.first["cookie"], equals("__hdnea__=st=1758107257~exp=1758193657~acl=/*~hmac=99dec41934473d7fb71e7850a7a088fdb138b63b884a511c262244beefee8bed"));
    });
    
    test('TestExDesc', () async {
      final String content = r'''
#EXTINF:-1 media="true" tvg-logo="https://cfvod.kaltura.com/p/4526593/sp/452659300/thumbnail/entry_id/1_pbep9odt/width/0/height/0/quality/85", Obscene Beauty
#EXTDESC: Mergulhando na cena Neo-Burlesca de Nova Iorque, este documentário explora a sexualidade, comédia e arte dessa cultura, analisando como os artistas utilizam os seus três minutos em palco como uma plataforma para comentário sociopolítico.
https://cfvod.kaltura.com/hls/p/4526593/sp/452659300/serveFlavor/entryId/1_1fxmr1o3/v/1/ev/7/flavorId/1_eac4uysh/name/a.mp4/index.m3u8
''';

      List<Track> result = M3UParser.parse(content);

      final Track item = result.first;
      
      expect(item.title, equals("Obscene Beauty"));
      expect(item.desc, equals("Mergulhando na cena Neo-Burlesca de Nova Iorque, este documentário explora a sexualidade, comédia e arte dessa cultura, analisando como os artistas utilizam os seus três minutos em palco como uma plataforma para comentário sociopolítico."));
      expect(item.links.first, equals("https://cfvod.kaltura.com/hls/p/4526593/sp/452659300/serveFlavor/entryId/1_1fxmr1o3/v/1/ev/7/flavorId/1_eac4uysh/name/a.mp4/index.m3u8"));
    });

    // TEST TEMPORARY WITH FILE

    // test('tmpTest:GenericCase:1', () async {
    //   final file = File('fixtures/sample.m3u');
    //   final contentFile = await file.readAsString();

    //   final String content = contentFile;

    //   List<Track> result = M3UParser.parse(content);

    //   expect(result.length, 15691);
    // });
  });
}
