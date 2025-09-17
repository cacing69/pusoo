import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:pusoo/core/utils/m3u_parser.dart';
import 'package:pusoo/features/track/domain/models/track.dart';

void main() async {
  final fileMaytoko = File('fixtures/sample_playlist_maytoko.txt');
  final contentMayToko = await fileMaytoko.readAsString();

  final fileMaksin = File('fixtures/sample_playlist_maksin.m3u');
  final contentMaksin = await fileMaksin.readAsString();

  final fileIptvOrg = File('fixtures/sample_playlist_iptv_org.m3u');
  final contentIptvOrg = await fileIptvOrg.readAsString();

  final fileNewpilem = File('fixtures/sample_playlist_newpilem.m3u');
  final contentNewpilem = await fileNewpilem.readAsString();

  final fileRyantv = File('fixtures/sample_playlist_ryantv.m3u');
  final contentRyanTv = await fileRyantv.readAsString();

  final fileUdp = File('fixtures/sample_playlist_udp.txt');
  final contentUdp = await fileUdp.readAsString();

  final fileMixedWithHtml = File(
    'fixtures/sample_playlist_mixed_with_html.txt',
  );
  final contentMixedWithHtml = await fileMixedWithHtml.readAsString();

  group('M3UParser Test', () {
    test('testLastTrack', () async {
      List<Track> check = M3UParser.parse(contentMayToko);

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
      List<Track> result = M3UParser.parse(contentMayToko);

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

    test('testTvgCountry:ID=115 rows', () async {
      List<Track> result = M3UParser.parse(contentMayToko);

      List<Track> items = result.where((track) {
        if (track.attributes.containsKey("tvg-country")) {
          return track.attributes["tvg-country"] == "ID";
        }

        return false;
      }).toList();

      expect(115, equals(items.length));
    });

    test('testMaksinExtInf=10602', () async {
      List<Track> result = M3UParser.parse(contentMaksin);
      expect(10602, equals(result.length));
    });

    test('testIptvOrgExtInf=11421', () async {
      List<Track> result = M3UParser.parse(contentIptvOrg);

      expect(11421, equals(result.length));
    });

    test('testRyantvExtInf=268', () async {
      List<Track> result = M3UParser.parse(contentRyanTv);

      expect(268, equals(result.length));
    });

    test('testUdpExtInf=23', () async {
      List<Track> result = M3UParser.parse(contentUdp);

      expect(23, equals(result.length));
    });

    test('test:contentMixedWithHtml:extInf=11938', () async {
      List<Track> result = M3UParser.parse(contentMixedWithHtml);

      expect(11938, equals(result.length));
    });

    test('checkLastRowNewpilemShouldHave2Links', () async {
      List<Track> result = M3UParser.parse(contentNewpilem);

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
      List<Track> result = M3UParser.parse(
        contentNewpilem,
      ).where((track) => track.title.contains("BLOOD AND SAND-S1")).toList();
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
      List<Track> result = M3UParser.parse(
        contentMayToko,
      ).where((track) => track.title.contains("NBA TV")).toList();

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
  });
}
