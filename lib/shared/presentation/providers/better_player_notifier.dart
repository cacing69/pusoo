import 'package:better_player_plus/better_player_plus.dart';
import 'package:flutter/material.dart';
import 'package:forui/widgets/progress.dart';
import 'package:logger/logger.dart';
import 'package:pusoo/shared/data/models/track.dart';
import 'package:pusoo/shared/presentation/providers/logger_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'better_player_notifier.g.dart';

@riverpod
class BetterPlayerNotifier extends _$BetterPlayerNotifier {
  // Metode build ini akan dipanggil pertama kali oleh Riverpod
  @override
  BetterPlayerController? build() {
    // Return null sebagai state awal.
    // Provider ini akan di-dispose secara otomatis berkat @riverpod.
    // Kita tidak perlu lagi menulis logika onDispose.

    ref.onDispose(() {
      final Logger log = ref.read(loggerProvider);
      log.i("BetterPlayerNotifier disposed");
    });

    return null;
  }

  // Fungsi untuk menginisialisasi dan membuka video
  void openMediaStream(
    Track track, {
    bool isLiveStream = false,
    int useUrlOnIndex = 0,
  }) {
    final Logger log = ref.read(loggerProvider);

    final List<BetterPlayerOverflowMenuItem> customMenuItems = [
      BetterPlayerOverflowMenuItem(
        Icons.share_outlined, // Ikon untuk item menu
        "Bagikan", // Teks untuk item menu
        () {
          // Aksi yang dijalankan saat diklik
          log.i("Aksi 'Bagikan' dipicu!");
          // TODO: Tambahkan logika untuk membagikan video di sini
        },
      ),
      BetterPlayerOverflowMenuItem(Icons.report_outlined, "Laporkan", () {
        log.i("Aksi 'Laporkan' dipicu!");
        // TODO: Tambahkan logika untuk melaporkan masalah di sini
      }),
    ];

    // 1. Inisialisasi konfigurasi dasar pemutar
    BetterPlayerConfiguration
    betterPlayerConfiguration = BetterPlayerConfiguration(
      autoPlay: true,
      aspectRatio: 16 / 9,
      fit: BoxFit.contain,
      // overlay: Align(
      //   alignment: Alignment.topLeft,
      //   child: Container(
      //     margin: const EdgeInsets.all(16),
      //     padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      //     decoration: BoxDecoration(
      //       color: Colors.black.withAlpha(180),
      //       borderRadius: BorderRadius.circular(8),
      //     ),
      //     child: const Text(
      //       "LIVE",
      //       style: TextStyle(
      //         color: Colors.red,
      //         fontWeight: FontWeight.bold,
      //       ),
      //     ),
      //   ),
      // ),
      controlsConfiguration: BetterPlayerControlsConfiguration(
        overflowMenuCustomItems: customMenuItems,

        showControls: true,
        enablePlayPause: !isLiveStream,
        enableProgressBar: true,
        enableSkips: !isLiveStream,
        enablePip: false,
        enableFullscreen: true,
        showControlsOnInitialize: false,
        loadingWidget: FProgress.circularIcon(),
        // customControlsBuilder: (controller, onPlayerVisibilityChanged) {
        //   return Placeholder();
        // },
      ),
    );

    // 6. Buat DataSource pemutar
    // final BetterPlayerDataSource betterPlayerDataSource =
    //     BetterPlayerDataSource(
    //       BetterPlayerDataSourceType.network,
    //       videoUrl,
    //       videoFormat: videoFormat,
    //       headers: httpHeaders,
    //       liveStream: isLiveStream,
    //       drmConfiguration: drmConfiguration,
    //     );

    // 7. Inisialisasi controller baru dan atur datasource
    final BetterPlayerController initController = BetterPlayerController(
      betterPlayerConfiguration,
    );

    BetterPlayerDataSource betterPlayerDataSource = _prepareDataSource(
      track,
      isLiveStream: isLiveStream,
      useUrlOnIndex: useUrlOnIndex,
    );

    initController.setupDataSource(betterPlayerDataSource);

    // Function handlePlaybackError = () {
    //   // if (_currentUrlIndex < _videoUrls.length - 1) {
    //   //   setState(() {
    //   //     _currentUrlIndex++;
    //   //     print(
    //   //       "Playback error, trying next URL: ${_videoUrls[_currentUrlIndex]}",
    //   //     );
    //   //     _betterPlayerController.setupDataSource(
    //   //       _createDataSource(_videoUrls[_currentUrlIndex]),
    //   //     );
    //   //     _betterPlayerController.play(); // Mulai putar ulang dengan URL baru
    //   //   });
    //   // } else {
    //   // print("All URLs failed. Cannot play video.");
    //   // Tampilkan pesan error ke pengguna
    //   // }
    // };

    initController.addEventsListener((event) {
      log.i("BetterPlayer event: ${event.betterPlayerEventType}");

      if (event.betterPlayerEventType == BetterPlayerEventType.exception) {
        useUrlOnIndex++;

        log.e("error, try access another source");

        if (useUrlOnIndex <= track.links.length) {
          initController.setupDataSource(
            _prepareDataSource(
              track,
              isLiveStream: isLiveStream,
              useUrlOnIndex: useUrlOnIndex,
            ),
          );
        }
      }
    });

    // _betterPlayerController.addEventsListener((BetterPlayerEvent event) {

    // });

    // 8. Update state dengan controller yang baru
    log.i("[BetterPlayerNotifier] New BetterPlayerController created.");
    state = initController;
  }

  BetterPlayerDataSource _prepareDataSource(
    Track track, {
    bool isLiveStream = false,
    int useUrlOnIndex = 0,
  }) {
    final Logger log = ref.read(loggerProvider);

    // final onIndex = 0;

    // 2. Siapkan data dari Track
    final String videoUrl = track.links[useUrlOnIndex];

    // if (state != null && state?.betterPlayerDataSource?.url == videoUrl) {
    //   return;
    // }

    log.i("[BetterPlayerNotifier] --- openMediaStream called ---");
    log.i("[BetterPlayerNotifier] Track URL: ${track.links[useUrlOnIndex]}");
    log.i("[BetterPlayerNotifier] Current state is null: ${state == null}");

    // Pastikan controller sebelumnya sudah di-dispose sebelum membuka yang baru
    // Riverpod akan menangani disposenya, tetapi kita tetap perlu
    // memastikan controller di-dispose sebelum diassign ulang.
    if (state != null) {
      log.i(
        "[BetterPlayerNotifier] Disposing previous BetterPlayerController!",
      );

      // state?.dispose();
      // state = null;
    }

    // state?.dispose();

    // final List<BetterPlayerOverflowMenuItem> customMenuItems = [
    //   BetterPlayerOverflowMenuItem(
    //     Icons.share_outlined, // Ikon untuk item menu
    //     "Bagikan", // Teks untuk item menu
    //     () {
    //       // Aksi yang dijalankan saat diklik
    //       log.i("Aksi 'Bagikan' dipicu!");
    //       // TODO: Tambahkan logika untuk membagikan video di sini
    //     },
    //   ),
    //   BetterPlayerOverflowMenuItem(Icons.report_outlined, "Laporkan", () {
    //     log.i("Aksi 'Laporkan' dipicu!");
    //     // TODO: Tambahkan logika untuk melaporkan masalah di sini
    //   }),
    // ];

    log.i(track.links[useUrlOnIndex]);

    // DRM Prepare
    Map<String, String>? clearKeyHex;
    String? licenseUrl;

    // 3. Tentukan format video dari ekstensi URL
    BetterPlayerVideoFormat? videoFormat;

    final uri = Uri.parse(videoUrl);
    final path = uri.path; // /video.mp4

    final extOnUrl = path.split('.').last; // mp4

    log.i("extOnUrl: $extOnUrl");

    // bool tmpIsLiveStream = isLiveStream;

    if (extOnUrl.contains("mpd")) {
      videoFormat = BetterPlayerVideoFormat.dash;
    } else if (extOnUrl.contains("m3u8")) {
      videoFormat = BetterPlayerVideoFormat.hls;
    } else if (["mkv", "mp4", "webm"].contains(extOnUrl)) {
      videoFormat = BetterPlayerVideoFormat.other;
    }

    BetterPlayerDrmType? drmType;

    // 4. Siapkan konfigurasi DRM (jika ada)
    BetterPlayerDrmConfiguration? drmConfiguration;

    // 5. Siapkan HTTP headers (jika ada)
    Map<String, String>? httpHeaders;
    Map<String, String> tmpHttpHeaders = {};

    // Logika parsing DRM dari track.kodiProps

    // Logika parsing headers dari track.extVlcOpts

    // TODO : WILL BE MOVED AS TRACK METADATA EXTRACTOR
    if (track.kodiProps.isNotEmpty) {
      final kodiProps = track.kodiProps.first;

      // HANDLING LICENSE TYPE
      final bool hasLicenseType = track.kodiProps.first.containsKey(
        "inputstream.adaptive.license_type",
      );

      log.i("hasLicenseType: $hasLicenseType");
      if (hasLicenseType) {
        final licenseType = kodiProps["inputstream.adaptive.license_type"];

        final Map<String, BetterPlayerDrmType> mapLicenseType = {
          "clearkey": BetterPlayerDrmType.clearKey,
          "org.w3.clearkey": BetterPlayerDrmType.clearKey,
          "com.widevine.alpha": BetterPlayerDrmType.widevine,
        };

        // if (licenseType == "clearkey") {
        if (mapLicenseType.containsKey(licenseType)) {
          drmType = mapLicenseType[licenseType];
        } else {
          log.e("licenseType not supported: $licenseType");
        }
      }

      // HANDLING LICENSE KEY
      final bool hasLicenseKey = track.kodiProps.first.containsKey(
        "inputstream.adaptive.license_key",
      );

      log.i("hasLicenseKey: $hasLicenseKey");
      if (hasLicenseKey) {
        final licenseKey = kodiProps["inputstream.adaptive.license_key"];

        if (drmType == BetterPlayerDrmType.clearKey) {
          final rawClearKey = licenseKey?.split(":");
          if (rawClearKey != null && rawClearKey.length == 2) {
            clearKeyHex = {rawClearKey[0]: rawClearKey[1]};
          } else {
            log.e("invalid clearKey format: $licenseKey");
          }
        } else if (drmType == BetterPlayerDrmType.widevine) {
          licenseUrl = licenseKey;
        }
      }

      // HANDLING MANIFEST TYPE
      final bool hasManifestType = track.kodiProps.first.containsKey(
        "inputstream.adaptive.manifest_type",
      );

      if (hasManifestType) {
        final manifestType = kodiProps["inputstream.adaptive.manifest_type"];

        final Map<String, BetterPlayerVideoFormat> mapManifestType = {
          "dash": BetterPlayerVideoFormat.dash,
          "hls": BetterPlayerVideoFormat.hls,
        };

        if (mapManifestType.containsKey(manifestType)) {
          videoFormat = mapManifestType[manifestType];
        } else {
          log.e("manifestType not registered: $manifestType");
        }
      }
    }

    // HANDLING EXTVLCOPT
    if (track.extVlcOpts.isNotEmpty) {
      final bool hasUserAgent = track.extVlcOpts.first.containsKey(
        "http-user-agent",
      );

      if (hasUserAgent) {
        tmpHttpHeaders["User-Agent"] =
            "${track.extVlcOpts.first["http-user-agent"]}";
      }

      final bool hasReferrer = track.extVlcOpts.first.containsKey(
        "http-referrer",
      );

      if (hasReferrer) {
        tmpHttpHeaders["Referrer"] =
            "${track.extVlcOpts.first["http-referrer"]}";
      }
    }

    if (drmType != null) {
      drmConfiguration = BetterPlayerDrmConfiguration(
        drmType: drmType,
        clearKey: drmType == BetterPlayerDrmType.clearKey
            ? BetterPlayerClearKeyUtils.generateKey(clearKeyHex!)
            : null,
        licenseUrl: drmType == BetterPlayerDrmType.widevine ? licenseUrl : null,
        headers: drmType == BetterPlayerDrmType.widevine ? httpHeaders : null,
      );
    }

    log.i("httpHeaders: $httpHeaders");

    if (tmpHttpHeaders.isNotEmpty) {
      httpHeaders = tmpHttpHeaders;
    }

    log.i("tmpHttpHeaders: $tmpHttpHeaders");

    final BetterPlayerDataSource betterPlayerDataSource =
        BetterPlayerDataSource(
          BetterPlayerDataSourceType.network,
          videoUrl,
          videoFormat: videoFormat,
          headers: httpHeaders,
          liveStream: isLiveStream,
          drmConfiguration: drmConfiguration,
        );

    return betterPlayerDataSource;
  }
}
