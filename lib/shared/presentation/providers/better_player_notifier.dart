import 'package:better_player_plus/better_player_plus.dart';
import 'package:flutter/material.dart';
import 'package:forui/widgets/progress.dart';
import 'package:logger/logger.dart';
import 'package:pusoo/features/track/domain/models/track.dart';
import 'package:pusoo/shared/presentation/providers/logger_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'better_player_notifier.g.dart';

@riverpod
class BetterPlayerNotifier extends _$BetterPlayerNotifier {
  Track? _currentTrack;
  bool _isLiveStream = false;
  int _currentUrlIndex = 0;
  bool _isChangingDataSource = false; // FIX: Guard flag

  BetterPlayerController? build() {
    ref.onDispose(() {
      final Logger log = ref.read(loggerProvider);
      log.i("BetterPlayerNotifier and controller disposed");
      state?.dispose();
    });

    return null;
  }

  void _onPlayerEvent(BetterPlayerEvent event) {
    final log = ref.read(loggerProvider);
    log.i("BetterPlayer event: ${event.betterPlayerEventType}");

    if (event.betterPlayerEventType == BetterPlayerEventType.exception) {
      log.e("Player exception. Trying next source.");
      _currentUrlIndex++;
      if (_currentTrack != null &&
          _currentUrlIndex < _currentTrack!.links.length) {
        log.i("Playing next source at index $_currentUrlIndex");
        // FIX: Call the guarded openMediaStream for retries
        openMediaStream(
          _currentTrack!,
          isLiveStream: _isLiveStream,
          useUrlOnIndex: _currentUrlIndex,
        );
      } else {
        log.e("All sources failed for track ${_currentTrack?.title}");
      }
    }
  }

  BetterPlayerConfiguration _buildConfiguration({
    required bool isLiveStream,
    required Logger log,
  }) {
    final List<BetterPlayerOverflowMenuItem> customMenuItems = [
      BetterPlayerOverflowMenuItem(Icons.share_outlined, "Bagikan", () {
        log.i("Aksi 'Bagikan' dipicu!");
      }),
      BetterPlayerOverflowMenuItem(Icons.report_outlined, "Laporkan", () {
        log.i("Aksi 'Laporkan' dipicu!");
      }),
    ];

    return BetterPlayerConfiguration(
      autoPlay: true,
      aspectRatio: 16 / 9,
      fit: BoxFit.contain,
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
      ),
    );
  }

  // FIX: Make the method async and add a guard to prevent concurrent calls
  Future<void> openMediaStream(
    Track track, {
    bool isLiveStream = false,
    int useUrlOnIndex = 0,
  }) async {
    final log = ref.read(loggerProvider);
    if (_isChangingDataSource) {
      log.w("Data source change already in progress. Ignoring.");
      return;
    }
    _isChangingDataSource = true;

    try {
      _currentTrack = track;
      _isLiveStream = isLiveStream;
      _currentUrlIndex = useUrlOnIndex;

      if (state == null) {
        log.i("[BetterPlayerNotifier] Creating new BetterPlayerController.");
        final configuration = _buildConfiguration(
          isLiveStream: isLiveStream,
          log: log,
        );
        final controller = BetterPlayerController(configuration);
        controller.addEventsListener(_onPlayerEvent);
        state = controller;
      }

      final dataSource = _prepareDataSource(
        track,
        isLiveStream: isLiveStream,
        useUrlOnIndex: useUrlOnIndex,
      );

      log.i("[BetterPlayerNotifier] Setting up data source for ${track.title}");
      await state!.setupDataSource(dataSource);
    } finally {
      _isChangingDataSource = false;
    }
  }

  BetterPlayerDataSource _prepareDataSource(
    Track track, {
    bool isLiveStream = false,
    int useUrlOnIndex = 0,
  }) {
    final Logger log = ref.read(loggerProvider);
    final String videoUrl = track.links[useUrlOnIndex];

    log.i("[BetterPlayerNotifier] --- openMediaStream called ---");
    log.i("[BetterPlayerNotifier] Track URL: ${track.links[useUrlOnIndex]}");
    log.i("[BetterPlayerNotifier] Current state is null: ${state == null}");
    log.i(track.links[useUrlOnIndex]);

    Map<String, String>? clearKeyHex;
    String? licenseUrl;
    BetterPlayerVideoFormat? videoFormat;
    final uri = Uri.parse(videoUrl);
    final path = uri.path;
    final extOnUrl = path.split('.').last;
    log.i("extOnUrl: $extOnUrl");

    if (extOnUrl.contains("mpd")) {
      videoFormat = BetterPlayerVideoFormat.dash;
    } else if (extOnUrl.contains("m3u8")) {
      videoFormat = BetterPlayerVideoFormat.hls;
    } else if (["mkv", "mp4", "webm"].contains(extOnUrl)) {
      videoFormat = BetterPlayerVideoFormat.other;
    }

    BetterPlayerDrmType? drmType;
    BetterPlayerDrmConfiguration? drmConfiguration;
    Map<String, String>? httpHeaders;
    Map<String, String> tmpHttpHeaders = {};

    if (track.kodiProps.isNotEmpty) {
      final kodiProps = track.kodiProps.first;
      final bool hasLicenseType = kodiProps.containsKey(
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
        if (mapLicenseType.containsKey(licenseType)) {
          drmType = mapLicenseType[licenseType];
        } else {
          log.e("licenseType not supported: $licenseType");
        }
      }

      final bool hasLicenseKey = kodiProps.containsKey(
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

      final bool hasManifestType = kodiProps.containsKey(
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
