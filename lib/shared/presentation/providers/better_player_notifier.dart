import 'package:better_player_plus/better_player_plus.dart';
import 'package:flutter/material.dart';
import 'package:forui/widgets/progress.dart';
import 'package:logger/logger.dart';
import 'package:pusoo/shared/data/models/track.dart';
import 'package:pusoo/shared/presentation/providers/logger_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'better_player_notifier.g.dart';

@Riverpod(keepAlive: true)
class BetterPlayerNotifier extends _$BetterPlayerNotifier {
  // Metode build ini akan dipanggil pertama kali oleh Riverpod
  @override
  BetterPlayerController? build() {
    // Return null sebagai state awal.
    // Provider ini akan di-dispose secara otomatis berkat @riverpod.
    // Kita tidak perlu lagi menulis logika onDispose.
    return null;
  }

  // Fungsi untuk menginisialisasi dan membuka video
  void openMediaStream(Track track, {bool isLiveStream = false}) {
    final Logger log = ref.read(loggerProvider);

    // 2. Siapkan data dari Track
    final String videoUrl = track.links.first;

    if (state != null && state?.betterPlayerDataSource?.url == videoUrl) {
      return;
    }

    log.i("[BetterPlayerNotifier] --- openMediaStream called ---");
    log.i("[BetterPlayerNotifier] Track URL: ${track.links.first}");
    log.i("[BetterPlayerNotifier] Current state is null: ${state == null}");

    // Pastikan controller sebelumnya sudah di-dispose sebelum membuka yang baru
    // Riverpod akan menangani disposenya, tetapi kita tetap perlu
    // memastikan controller di-dispose sebelum diassign ulang.
    if (state != null) {
      log.i(
        "[BetterPlayerNotifier] Disposing previous BetterPlayerController!",
      );
    }

    state?.dispose();

    // --- ✅ LANGKAH 1: BUAT DAFTAR ITEM MENU KUSTOM ---
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

    log.i(track.links.first);

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

    // DRM Prepare
    Map<String, String>? clearKeyHex;
    String? licenseUrl;

    // 3. Tentukan format video dari ekstensi URL
    BetterPlayerVideoFormat? videoFormat;

    final String extOnUrl = videoUrl.split(".").last;

    if (extOnUrl == "mpd") {
      videoFormat = BetterPlayerVideoFormat.dash;
    } else if (extOnUrl == "m3u8") {
      videoFormat = BetterPlayerVideoFormat.hls;
    }

    BetterPlayerDrmType? drmType;

    // 4. Siapkan konfigurasi DRM (jika ada)
    BetterPlayerDrmConfiguration? drmConfiguration;

    // 5. Siapkan HTTP headers (jika ada)
    Map<String, String>? httpHeaders;

    // Logika parsing DRM dari track.kodiProps

    // Logika parsing headers dari track.extVlcOpts

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

    // 6. Buat DataSource pemutar
    final BetterPlayerDataSource betterPlayerDataSource =
        BetterPlayerDataSource(
          BetterPlayerDataSourceType.network,
          videoUrl,
          videoFormat: videoFormat,
          headers: httpHeaders,
          liveStream: isLiveStream,
          drmConfiguration: drmConfiguration,
        );

    // 7. Inisialisasi controller baru dan atur datasource
    final BetterPlayerController initController = BetterPlayerController(
      betterPlayerConfiguration,
    );

    initController.setupDataSource(betterPlayerDataSource);

    // 8. Update state dengan controller yang baru
    log.i("[BetterPlayerNotifier] New BetterPlayerController created.");
    state = initController;
  }
}
