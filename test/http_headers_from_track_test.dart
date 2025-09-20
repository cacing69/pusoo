// Copyright (c) 2025, Ibnul Mutaki (@cacing69)
// Licensed under the MIT License
// Pusoo - Open Source IPTV Player
// GitHub: https://github.com/cacing69/pusoo

import 'package:flutter_test/flutter_test.dart';
import 'package:pusoo/core/utils/http_headers_from_track.dart';
import 'package:pusoo/core/utils/m3u_parser.dart';
import 'package:pusoo/features/track/domain/models/track.dart';

void main() async {
  group('HttpHeadersFromTrackTest', () {
    test('test:1', () async {
      final String content = r'''
#EXTHTTP:{"cookie":"Edge-Cache-Cookie=URLPrefix=aHR0cHM6Ly9ibGRjbXByb2QtY2RuLnRvZmZlZWxpdmUuY29tLw:Expires=1750297799:KeyName=prod_linear:Signature=TDBMq5Xc03aTvlgHIbGzOJRfXo1Ci6MBkMVPtER7RMKYwBr6xRLqsXpDCYdHaDC_ojg5k5EC7ww-uWB62kirBg"}
#EXTINF:-1 tvg-id="Champions TV 3.id" tvg-logo="https://thumbor.prod.vidiocdn.com/iJMuLDOoWxwxsc7BMjwtBrEowqg=/372x211/filters:strip_icc():quality(70)/vidio-web-prod-livestreaming/uploads/livestreaming/image/6786/champions-tv-3-7898f2.jpg" group-title="PREMIUM SPORT",Champions TV 3
#EXTVLCOPT:http-user-agent=Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1
#EXTVLCOPT:http-user-agent=VidioPlayer/4.3.0-WITH_ADS
#KODIPROP:mimetype=application/dash+xml
#KODIPROP:inputstream=inputstream.adaptive
#KODIPROP:inputstream.adaptive.stream_headers=origin=https://www.vidio.com&referer=https://www.vidio.com/&user-agent=Vidio/6.43.9-8ec34856ef (Linux;Android 11) ExoPlayerLib/2.19.1
#KODIPROP:inputstream.adaptive.manifest_type=dash
#KODIPROP:inputstream.adaptive.license_type=com.widevine.alpha
#KODIPROP:inputstream.adaptive.license_key=https://seprai.jasoncreak8.workers.dev/play.mpd?id=6786&type=drm
https://seprai.jasoncreak8.workers.dev/play.mpd?id=6786&type=dash|referrer=https://visionplus.id/&user-agent=VidioPlayer/4.3.0-WITHOUT_ADS
''';

      List<Track> track = M3UParser.parse(content);

      final Map<String, String> result = HttpHeadersFromTrack.build(
        track.first,
      );

      expect(result.containsKey("User-Agent"), equals(true));
      expect(result.containsKey("Origin"), equals(true));
      expect(result.containsKey("Cookie"), equals(true));

      // stream_headers adalah hierarki tertinggi, akan ignore vlcopt dan exthttp
      expect(
        result["User-Agent"],
        equals(
          "Vidio/6.43.9-8ec34856ef (Linux;Android 11) ExoPlayerLib/2.19.1",
        ),
      );
      expect(result["Origin"], equals("https://www.vidio.com"));
      expect(
        result["Cookie"],
        equals(
          "Edge-Cache-Cookie=URLPrefix=aHR0cHM6Ly9ibGRjbXByb2QtY2RuLnRvZmZlZWxpdmUuY29tLw:Expires=1750297799:KeyName=prod_linear:Signature=TDBMq5Xc03aTvlgHIbGzOJRfXo1Ci6MBkMVPtER7RMKYwBr6xRLqsXpDCYdHaDC_ojg5k5EC7ww-uWB62kirBg",
        ),
      );
    });

    test('test:2', () async {
      final String content = r'''
#EXTHTTP:{"cookie":"__hdnea__=st=1758107257~exp=1758193657~acl=/*~hmac=99dec41934473d7fb71e7850a7a088fdb138b63b884a511c262244beefee8bed"}
#EXTINF:-1 tvg-id="Champions TV 3.id" tvg-logo="https://thumbor.prod.vidiocdn.com/iJMuLDOoWxwxsc7BMjwtBrEowqg=/372x211/filters:strip_icc():quality(70)/vidio-web-prod-livestreaming/uploads/livestreaming/image/6786/champions-tv-3-7898f2.jpg" group-title="PREMIUM SPORT",Champions TV 3
#EXTVLCOPT:http-user-agent=Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1
#EXTVLCOPT:http-user-agent=VidioPlayer/4.3.0-WITH_ADS
#KODIPROP:mimetype=application/dash+xml
#KODIPROP:inputstream=inputstream.adaptive
#KODIPROP:inputstream.adaptive.stream_headers=origin=https://www.vidio.com&referer=https://www.vidio.com/
#KODIPROP:inputstream.adaptive.manifest_type=dash
#KODIPROP:inputstream.adaptive.license_type=com.widevine.alpha
#KODIPROP:inputstream.adaptive.license_key=https://seprai.jasoncreak8.workers.dev/play.mpd?id=6786&type=drm
https://seprai.jasoncreak8.workers.dev/play.mpd?id=6786&type=dash|referrer=https://visionplus.id/&user-agent=VidioPlayer/4.3.0-WITHOUT_ADS
''';

      List<Track> track = M3UParser.parse(content);

      final Map<String, String> result = HttpHeadersFromTrack.build(
        track.first,
      );

      expect(result.containsKey("User-Agent"), equals(true));
      expect(result.containsKey("Origin"), equals(true));
      expect(result.containsKey("Referer"), equals(true));
      expect(result.containsKey("Cookie"), equals(true));

      // stream_headers adalah hierarki tertinggi, akan ignore vlcopt dan exthttp
      expect(result["User-Agent"], equals("VidioPlayer/4.3.0-WITH_ADS"));
      expect(result["Origin"], equals("https://www.vidio.com"));
      expect(result["Referer"], equals("https://www.vidio.com/"));
      expect(
        result["Cookie"],
        equals(
          "__hdnea__=st=1758107257~exp=1758193657~acl=/*~hmac=99dec41934473d7fb71e7850a7a088fdb138b63b884a511c262244beefee8bed",
        ),
      );
    });

    test('test:3', () async {
      final String content = r'''
#EXTINF:-1 tvg-id="Champions TV 3.id" tvg-logo="https://thumbor.prod.vidiocdn.com/iJMuLDOoWxwxsc7BMjwtBrEowqg=/372x211/filters:strip_icc():quality(70)/vidio-web-prod-livestreaming/uploads/livestreaming/image/6786/champions-tv-3-7898f2.jpg" group-title="PREMIUM SPORT",Champions TV 3
#EXTVLCOPT:http-user-agent=Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1
#EXTVLCOPT:http-user-agent=VidioPlayer/4.3.0-WITH_ADS
#KODIPROP:mimetype=application/dash+xml
#KODIPROP:inputstream=inputstream.adaptive
#KODIPROP:inputstream.adaptive.manifest_type=dash
#KODIPROP:inputstream.adaptive.license_type=com.widevine.alpha
#KODIPROP:inputstream.adaptive.license_key=https://seprai.jasoncreak8.workers.dev/play.mpd?id=6786&type=drm
https://seprai.jasoncreak8.workers.dev/play.mpd?id=6786&type=dash|referrer=https://visionplus.id/&user-agent=VidioPlayer/4.3.0-WITHOUT_ADS
''';

      List<Track> track = M3UParser.parse(content);

      final Map<String, String> result = HttpHeadersFromTrack.build(
        track.first,
      );

      expect(result.containsKey("User-Agent"), equals(true));

      // stream_headers adalah hierarki tertinggi, akan ignore vlcopt dan exthttp
      expect(result["User-Agent"], equals("VidioPlayer/4.3.0-WITH_ADS"));
      expect(result["Referer"], equals("https://visionplus.id/"));
    });

    test('test:4', () async {
      final String content = r'''
#EXTINF:-1 tvg-id="Champions TV 3.id" tvg-logo="https://thumbor.prod.vidiocdn.com/iJMuLDOoWxwxsc7BMjwtBrEowqg=/372x211/filters:strip_icc():quality(70)/vidio-web-prod-livestreaming/uploads/livestreaming/image/6786/champions-tv-3-7898f2.jpg" group-title="PREMIUM SPORT",Champions TV 3
#EXTVLCOPT:http-user-agent=Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1
#KODIPROP:mimetype=application/dash+xml
#KODIPROP:inputstream=inputstream.adaptive
#KODIPROP:inputstream.adaptive.manifest_type=dash
#KODIPROP:inputstream.adaptive.license_type=com.widevine.alpha
#KODIPROP:inputstream.adaptive.license_key=https://seprai.jasoncreak8.workers.dev/play.mpd?id=6786&type=drm
https://seprai.jasoncreak8.workers.dev/play.mpd?id=6786&type=dash|referrer=https://visionplus.id/&user-agent=VidioPlayer/4.3.0-WITHOUT_ADS
''';

      List<Track> track = M3UParser.parse(content);

      final Map<String, String> result = HttpHeadersFromTrack.build(
        track.first,
      );

      expect(result.containsKey("User-Agent"), equals(true));

      // stream_headers adalah hierarki tertinggi, akan ignore vlcopt dan exthttp
      expect(
        result["User-Agent"],
        equals(
          "Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1",
        ),
      );
      expect(result["Referer"], equals("https://visionplus.id/"));
    });

    test('test:5', () async {
      final String content = r'''
#EXTINF:-1 tvg-id="Champions TV 3.id" tvg-logo="https://thumbor.prod.vidiocdn.com/iJMuLDOoWxwxsc7BMjwtBrEowqg=/372x211/filters:strip_icc():quality(70)/vidio-web-prod-livestreaming/uploads/livestreaming/image/6786/champions-tv-3-7898f2.jpg" group-title="PREMIUM SPORT",Champions TV 3
#KODIPROP:mimetype=application/dash+xml
#KODIPROP:inputstream=inputstream.adaptive
#KODIPROP:inputstream.adaptive.manifest_type=dash
#KODIPROP:inputstream.adaptive.license_type=com.widevine.alpha
#KODIPROP:inputstream.adaptive.license_key=https://seprai.jasoncreak8.workers.dev/play.mpd?id=6786&type=drm
https://seprai.jasoncreak8.workers.dev/play.mpd?id=6786&type=dash|referrer=https://visionplus.id/&user-agent=VidioPlayer/4.3.0-WITHOUT_ADS
''';

      List<Track> track = M3UParser.parse(content);

      final Map<String, String> result = HttpHeadersFromTrack.build(
        track.first,
      );

      expect(result.containsKey("User-Agent"), equals(true));

      // stream_headers adalah hierarki tertinggi, akan ignore vlcopt dan exthttp
      expect(result["User-Agent"], equals("VidioPlayer/4.3.0-WITHOUT_ADS"));
      expect(result["Referer"], equals("https://visionplus.id/"));
    });

    test('test:6', () async {
      final String content = r'''
#EXTINF:-1 tvg-id="1123" group-title="Jiostar" tvg-logo="https://jiotvimages.cdn.jio.com/dare_images/images/Star_Sports_Select_1.png",Star Sports Select 1
#KODIPROP:inputstream.adaptive.license_type=clearkey
#KODIPROP:inputstream.adaptive.license_key=ea7985dacbb95f1c9d62e5a1675142e5:39d5910ca04841b5f32bf24623cdae58
#EXTVLCOPT:http-user-agent=plaYtv/7.1.3 (Linux;Android 13) ygx/69.1 ExoPlayerLib/824.0
#EXTHTTP:{"cookie":"__hdnea__=st=1758107257~exp=1758193657~acl=/*~hmac=99dec41934473d7fb71e7850a7a088fdb138b63b884a511c262244beefee8bed"}
https://jiotvpllive.cdn.jio.com/bpk-tv/Star_Sports_Select_1_BTS/output/index.mpd?__hdnea__=st=1758107257~exp=1758193657~acl=/*~hmac=99dec41934473d7fb71e7850a7a088fdb138b63b884a511c262244beefee8bed&xxx=%7Ccookie=__hdnea__=st=1758107257~exp=1758193657~acl=/*~hmac=99dec41934473d7fb71e7850a7a088fdb138b63b884a511c262244beefee8bed
''';

      List<Track> track = M3UParser.parse(content);

      final Map<String, String> result = HttpHeadersFromTrack.build(
        track.first,
      );

      expect(result.containsKey("User-Agent"), equals(true));
      expect(result.containsKey("Cookie"), equals(true));

      // stream_headers adalah hierarki tertinggi, akan ignore vlcopt dan exthttp
      expect(
        result["User-Agent"],
        equals("plaYtv/7.1.3 (Linux;Android 13) ygx/69.1 ExoPlayerLib/824.0"),
      );
      expect(
        result["Cookie"],
        equals(
          "__hdnea__=st=1758107257~exp=1758193657~acl=/*~hmac=99dec41934473d7fb71e7850a7a088fdb138b63b884a511c262244beefee8bed",
        ),
      );
    });

    test('test:7', () async {
      final String content = r'''
#EXTINF:-1 group-title="LIVE | LIGA INGGRIS" tvg-logo="https://i.pinimg.com/236x/dd/7a/94/dd7a94d92ecf53bb3e56de4f7dcff80f.jpg", CH 6
#EXTVLCOPT:http-user-agent=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36
#EXTVLCOPT:network-caching=1000
#EXTVLCOPT--http-reconnect=true
#KODIPROP:inputstream.adaptive.license_type=org.w3.clearkey
#KODIPROP:inputstream.adaptive.license_key={dc69b6159a0f9f0a4e03b3ff91cbacd5:d0dcbcd7723bc40df0bf34c9c092d51f}
#KODIPROP:inputstream.adaptive.stream_headers=cookie=session_id=abc123; user_pref=dark_mode
https://otte.live.fly.ww.aiv-cdn.net/pdx-nitro/live/clients/dash/enc/3b7qwiqzk3/out/v1/9f14895badca43e6a716db021dcd0c31/cenc.mpd
''';

      List<Track> track = M3UParser.parse(content);

      final Map<String, String> result = HttpHeadersFromTrack.build(
        track.first,
      );

      expect(result.containsKey("User-Agent"), equals(true));
      expect(result.containsKey("Cookie"), equals(true));

      // stream_headers adalah hierarki tertinggi, akan ignore vlcopt dan exthttp
      expect(
        result["User-Agent"],
        equals(
          "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36",
        ),
      );

      // Header untuk network caching
      expect(result["Cache-Control"], equals("max-age=1000"));

      // Header untuk HTTP reconnect (setara dengan --http-reconnect=true)
      expect(result["Connection"], equals("keep-alive"));

      expect(result["Keep-Alive"], equals("timeout=5, max=1000"));
    });

    test('test:8:X-TCDN-token', () async {
      final String content = r'''
#EXTINF:-1 tvg-name="CMM TV" tvg-logo="https://estatico.emisiondof6.com/recorte/m-NEONEGR/wpmarcaficha/CASMAN" group-title="MOVISTAR+ TV" group-logo="https://play-lh.googleusercontent.com/1FOULln_iZWLP_M-WY4NiolZ4EXr5_aE3ywIIgrT6o717Azi763_92z-Rim-BsQA54k" catchup-type="default" catchup-source="https://cutv-wp0.cdn.telefonica.com/5265/vxfmt=dp/Manifest.mpd?device_profile=DASH_TV_WIDEVINE&start_time={start_iso}&end_time={end_iso}" catchup-days="21", Castilla la Mancha TV
#KODIPROP:inputstream.adaptive.manifest_type=mpd
#KODIPROP:inputstream.adaptive.license_type=org.w3.clearkey
#KODIPROP:inputstream.adaptive.stream_headers={"X-TCDN-token":"eyJhbGciOiJFUzI1NiIsImtpZCI6ImI1OGNhNGM0NGFiOTQ0Y2FiY2U4N2FjNGJmZmI4MDNkIiwidHlwIjoiYXQrand0In0.eyJuYmYiOjE3NTc1NDQzMTMsImV4cCI6MTc1NzYzMDcxMywiaXNzIjoiaHR0cHM6Ly9pZHNlcnZlci5kb2Y2LmNvbSIsImF1ZCI6InRjZG4iLCJjbGllbnRfaWQiOiJtb3Zpc3RhcnBsdXMiLCJzdWIiOiI3YTdmN3Y4QzhUOGc4diIsImF1dGhfdGltZSI6MTc1NzU0NDMxMywiaWRwIjoibW92aXN0YXIrIiwidWlkIjoiTlRzU21NUjFKQ0tyT3NTS3RETlJCRE5paUZ5S1IrS291SFFFMEExUmhpbz0iLCJhY2MiOiJTSU8vRnlhclFNaVB6ZmtqOEJjdDY0VUZFcTZLbEJoK0JBeHhmYzR4YWJjPSIsImp0aSI6IkM1QjRGNDA2RUE4OTE1QjNGNkIxRTlGOTBCOTgzM0ZFIiwiaWF0IjoxNzU3NTQ0MzEzLCJzY29wZSI6ImNkbiJ9.IW1RBlKWQGSWFsVyI-ORgFnjTKep-W5t3V4GdA7YSI--xKG2rx2SbFvsOSRusVkbd7VXiRy64l1VR39HpBEsCA"}
#KODIPROP:inputstream.adaptive.license_key=78714c2c68c04472b2e311019edc6a93:7aff100e2added9125c4a426626bcd66
#EXTVLCOPT:http-user-agent=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36
http://tdtcastmancha-dash-movistarplus.emisiondof6.com/manifest.mpd
''';

      List<Track> track = M3UParser.parse(content);

      final Map<String, String> result = HttpHeadersFromTrack.build(
        track.first,
      );

      expect(result.containsKey("User-Agent"), equals(true));
      expect(result.containsKey("X-TCDN-token"), equals(true));

      // stream_headers adalah hierarki tertinggi, akan ignore vlcopt dan exthttp
      expect(
        result["User-Agent"],
        equals(
          "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36",
        ),
      );

      // Header untuk network caching
      expect(
        result["X-TCDN-token"],
        equals(
          "eyJhbGciOiJFUzI1NiIsImtpZCI6ImI1OGNhNGM0NGFiOTQ0Y2FiY2U4N2FjNGJmZmI4MDNkIiwidHlwIjoiYXQrand0In0.eyJuYmYiOjE3NTc1NDQzMTMsImV4cCI6MTc1NzYzMDcxMywiaXNzIjoiaHR0cHM6Ly9pZHNlcnZlci5kb2Y2LmNvbSIsImF1ZCI6InRjZG4iLCJjbGllbnRfaWQiOiJtb3Zpc3RhcnBsdXMiLCJzdWIiOiI3YTdmN3Y4QzhUOGc4diIsImF1dGhfdGltZSI6MTc1NzU0NDMxMywiaWRwIjoibW92aXN0YXIrIiwidWlkIjoiTlRzU21NUjFKQ0tyT3NTS3RETlJCRE5paUZ5S1IrS291SFFFMEExUmhpbz0iLCJhY2MiOiJTSU8vRnlhclFNaVB6ZmtqOEJjdDY0VUZFcTZLbEJoK0JBeHhmYzR4YWJjPSIsImp0aSI6IkM1QjRGNDA2RUE4OTE1QjNGNkIxRTlGOTBCOTgzM0ZFIiwiaWF0IjoxNzU3NTQ0MzEzLCJzY29wZSI6ImNkbiJ9.IW1RBlKWQGSWFsVyI-ORgFnjTKep-W5t3V4GdA7YSI--xKG2rx2SbFvsOSRusVkbd7VXiRy64l1VR39HpBEsCA",
        ),
      );
    });
  });
}
