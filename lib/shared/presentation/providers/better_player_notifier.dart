import 'dart:convert';
import 'dart:io';

import 'package:better_player_plus/better_player_plus.dart';
import 'package:flutter/material.dart';
import 'package:forui/widgets/progress.dart';
import 'package:logger/logger.dart';
import 'package:pusoo/core/extensions/string_ext.dart';
import 'package:pusoo/core/utils/clear_key_license_key_extractor.dart';
import 'package:pusoo/core/utils/http_headers_from_track.dart';
import 'package:pusoo/features/track/domain/models/track.dart';
import 'package:pusoo/shared/presentation/providers/logger_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'better_player_notifier.g.dart';

@riverpod
class BetterPlayerNotifier extends _$BetterPlayerNotifier {
  Track? _currentTrack;
  bool _isLiveStream = false;
  int _currentUrlIndex = 0;
  bool _isChangingDataSource = false;
  int _retryCount = 0;
  static const int _maxRetries = 3;
  static const Duration _retryDelay = Duration(seconds: 2);

  BetterPlayerController? build() {
    final log = ref.read(loggerProvider);
    ref.onDispose(() {
      log.i("BetterPlayerNotifier and controller disposed");
      state?.dispose();
    });

    return null;
  }

  void _showErrorSnackbar(String message) {
    // You can implement this to show error to user
    // For now, just log it
    final log = ref.read(loggerProvider);
    log.e("Error: $message");
  }

  Future<void> _handlePlayerException() async {
    final log = ref.read(loggerProvider);

    if (_retryCount >= _maxRetries) {
      log.e(
        "Max retries reached. All sources failed for track ${_currentTrack?.title}",
      );
      _showErrorSnackbar("Gagal memutar video. Semua sumber gagal.");
      return;
    }

    _retryCount++;
    _currentUrlIndex++;

    if (_currentTrack != null &&
        _currentUrlIndex < _currentTrack!.links.length) {
      log.i(
        "Retrying with next source at index $_currentUrlIndex (attempt $_retryCount/$_maxRetries)",
      );

      // Add delay before retry
      await Future.delayed(_retryDelay);

      try {
        await openMediaStream(
          _currentTrack!,
          isLiveStream: _isLiveStream,
          useUrlOnIndex: _currentUrlIndex,
        );
      } catch (e) {
        log.e("Error during retry: $e");
        _handlePlayerException(); // Recursive retry
      }
    } else {
      log.e("No more sources available for track ${_currentTrack?.title}");
      _showErrorSnackbar("Tidak ada sumber video yang tersedia.");
    }
  }

  void _onPlayerEvent(BetterPlayerEvent event) {
    final log = ref.read(loggerProvider);
    log.i("BetterPlayer event: ${event.betterPlayerEventType}");

    if (event.betterPlayerEventType == BetterPlayerEventType.exception) {
      log.e("Player exception: ${event.parameters}");
      _handlePlayerException();
    } else if (event.betterPlayerEventType ==
        BetterPlayerEventType.initialized) {
      log.i("Player initialized successfully");
      _retryCount = 0; // Reset retry count on successful initialization
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

    final BetterPlayerSubtitlesConfiguration subtitlesConfiguration =
        BetterPlayerSubtitlesConfiguration(
          fontSize: 22.0,
          fontColor: Colors.white,
          outlineColor: Colors.black,
          backgroundColor: Colors.black.withAlpha(100),
          // fontFamily:
          // "Roboto", // Pastikan font ini ada di pubspec.yaml Anda
          alignment: Alignment.bottomCenter,
        );

    return BetterPlayerConfiguration(
      autoPlay: true,
      aspectRatio: 16 / 9,
      fit: BoxFit.contain,
      controlsConfiguration: BetterPlayerControlsConfiguration(
        overflowMenuCustomItems: customMenuItems,
        showControls: true,
        enablePlayPause: !isLiveStream,
        enableProgressBar: !isLiveStream,
        enableSkips: !isLiveStream,
        enablePip: false,
        enableFullscreen: true,
        showControlsOnInitialize: false,
        loadingWidget: FProgress.circularIcon(),
      ),
      subtitlesConfiguration: subtitlesConfiguration,
      eventListener: _onPlayerEvent,
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
    _retryCount = 0; // Reset retry count for new track

    try {
      _currentTrack = track;
      _isLiveStream = isLiveStream;
      _currentUrlIndex = useUrlOnIndex;

      // Validate URL before proceeding
      if (!track.links[useUrlOnIndex].isValidUrl()) {
        throw Exception("Invalid URL: ${track.links[useUrlOnIndex]}");
      }

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

      final dataSource = await _prepareDataSource(
        track,
        isLiveStream: isLiveStream,
        useUrlOnIndex: useUrlOnIndex,
      );

      log.i("[BetterPlayerNotifier] Setting up data source for ${track.title}");
      await state!.setupDataSource(dataSource);
    } catch (e, stackTrace) {
      log.e("Error in openMediaStream: $e");
      log.e("Stack trace: $stackTrace");

      // Try next URL if available
      if (_currentTrack != null &&
          _currentUrlIndex + 1 < _currentTrack!.links.length) {
        log.i("Trying next URL due to error");
        _currentUrlIndex++;
        await openMediaStream(
          _currentTrack!,
          isLiveStream: isLiveStream,
          useUrlOnIndex: _currentUrlIndex,
        );
      } else {
        _showErrorSnackbar("Gagal memuat video: ${e.toString()}");
      }
    } finally {
      _isChangingDataSource = false;
    }
  }

  Future<void> loadSubtitle(BetterPlayerSubtitlesSource subtitlesSource) async {
    try {
      if (state != null) {
        await state!.setupSubtitleSource(subtitlesSource);
      }
    } catch (e) {
      final log = ref.read(loggerProvider);
      log.e("Error loading subtitle: $e");
    }
  }

  Future<BetterPlayerDataSource> _prepareDataSource(
    Track track, {
    bool isLiveStream = false,
    int useUrlOnIndex = 0,
  }) async {
    final Logger log = ref.read(loggerProvider);
    final String videoUrl = track.links[useUrlOnIndex];

    log.i("[BetterPlayerNotifier] --- openMediaStream called ---");
    log.i("[BetterPlayerNotifier] Track URL: ${track.links[useUrlOnIndex]}");
    log.i("[BetterPlayerNotifier] Current state is null: ${state == null}");
    log.i(track.links[useUrlOnIndex]);

    // Validate URL first
    if (!videoUrl.isValidUrl()) {
      throw Exception("Invalid URL format: $videoUrl");
    }

    // Map<String, String>? clearKeyHex;
    String? licenseUrl;
    String? clearKey; // gunakan ini untuk di clearKey
    BetterPlayerVideoFormat? videoFormat;

    try {
      final uri = Uri.parse(videoUrl);
      final path = uri.path;

      final extOnUrl = path.split('.').last;
      log.i("extOnUrl: $extOnUrl");

      if (path.isEmpty || path == "/" || !path.contains('.')) {
        log.w(
          "URL has no file extension, trying to detect format from content",
        );
        videoFormat = await _detectVideoFormatFromUrl(videoUrl, log);
      } else {
        final extOnUrl = path.split('.').last.toLowerCase();
        log.i("extOnUrl: $extOnUrl");

        if (extOnUrl.contains("mpd")) {
          videoFormat = BetterPlayerVideoFormat.dash;
        } else if (extOnUrl.contains("m3u8")) {
          videoFormat = BetterPlayerVideoFormat.hls;
        } else if ([
          "mkv",
          "mp4",
          "webm",
          "avi",
          "mov",
          "flv",
        ].contains(extOnUrl)) {
          videoFormat = BetterPlayerVideoFormat.other;
        } else {
          log.w(
            "Unknown file extension: $extOnUrl, trying to detect format from content",
          );
          videoFormat = await _detectVideoFormatFromUrl(videoUrl, log);
        }
      }
    } catch (e) {
      log.e("Error parsing URL: $e");
      throw Exception("Failed to parse URL: $videoUrl");
    }

    BetterPlayerDrmType? drmType;
    BetterPlayerDrmConfiguration? drmConfiguration;
    // Map<String, String>? httpHeaders;
    try {
      final httpHeaders = HttpHeadersFromTrack.build(track);
      // log.d("httpHeaders from HttpHeadersFromTrack: $allHeaders");

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
          log.i("licenseKey: $licenseKey");

          if (drmType == BetterPlayerDrmType.clearKey) {
            // CEK APAKAH VALUE LICENSEKEY BERSIFAT URL ATAU BUKAN, JIKA IYA LAKUKAN REQUEST UNTUK AMBIL KEY
            if (licenseKey != null) {
              if (licenseKey.trim().isNotEmpty) {
                // IMPLEMENTASI CLEAR KEY

                final clearKeyData = await ClearKeyLicenseKeyExtractor.extract(
                  licenseKey,
                  headers: httpHeaders,
                );
                log.i("clearKeyData: $clearKeyData");

                if (clearKeyData.isNotEmpty) {
                  // Extract keyId and key from the response

                  clearKey = jsonEncode(clearKeyData);
                } else {
                  log.e("Failed to extract clearKey data from: $licenseKey");
                }
              }
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

      if (drmType != null) {
        drmConfiguration = BetterPlayerDrmConfiguration(
          drmType: drmType,
          clearKey: clearKey,
          licenseUrl: drmType == BetterPlayerDrmType.widevine
              ? licenseUrl
              : null,
          headers: drmType == BetterPlayerDrmType.widevine ? httpHeaders : null,
        );
      }

      log.i("httpHeaders:final $httpHeaders");

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
    } catch (e, stackTrace) {
      log.e("Error in _prepareDataSource: $e");
      log.e("Stack trace: $stackTrace");
      throw Exception("Failed to prepare data source: $e");
    }
  }

  Future<void> retryCurrentTrack() async {
    if (_currentTrack != null) {
      _retryCount = 0;
      _currentUrlIndex = 0;
      await openMediaStream(
        _currentTrack!,
        isLiveStream: _isLiveStream,
        useUrlOnIndex: 0,
      );
    }
  }

  // Method to detect video format from URL content
  Future<BetterPlayerVideoFormat?> _detectVideoFormatFromUrl(
    String url,
    Logger log,
  ) async {
    try {
      log.i("Attempting to detect video format from URL: $url");

      // Try to make a HEAD request to get content type
      final client = HttpClient();
      client.connectionTimeout = const Duration(seconds: 10);

      try {
        final request = await client.headUrl(Uri.parse(url));
        final response = await request.close();

        final contentType = response.headers.contentType?.mimeType
            .toLowerCase();
        log.i("Content-Type from HEAD request: $contentType");

        if (contentType != null) {
          if (contentType.contains('application/dash+xml') ||
              contentType.contains('dash')) {
            return BetterPlayerVideoFormat.dash;
          } else if (contentType.contains('application/vnd.apple.mpegurl') ||
              contentType.contains('application/x-mpegurl') ||
              contentType.contains('hls')) {
            return BetterPlayerVideoFormat.hls;
          } else if (contentType.contains('video/')) {
            return BetterPlayerVideoFormat.other;
          }
        }
      } catch (e) {
        log.w("HEAD request failed: $e");
      }

      // If HEAD request fails, try GET request with limited data
      try {
        final request = await client.getUrl(Uri.parse(url));
        request.headers.set('Range', 'bytes=0-1023'); // Only get first 1KB
        final response = await request.close();

        if (response.statusCode == 206 || response.statusCode == 200) {
          final contentType = response.headers.contentType?.mimeType
              .toLowerCase();
          log.i("Content-Type from GET request: $contentType");

          if (contentType != null) {
            if (contentType.contains('application/dash+xml') ||
                contentType.contains('dash')) {
              return BetterPlayerVideoFormat.dash;
            } else if (contentType.contains('application/vnd.apple.mpegurl') ||
                contentType.contains('application/x-mpegurl') ||
                contentType.contains('hls')) {
              return BetterPlayerVideoFormat.hls;
            } else if (contentType.contains('video/')) {
              return BetterPlayerVideoFormat.other;
            }
          }

          // Try to detect from content
          final data = await response.take(1024).toList();
          final content = String.fromCharCodes(data.expand((x) => x));

          if (content.contains('#EXTM3U') || content.contains('#EXTINF')) {
            log.i("Detected HLS format from content");
            return BetterPlayerVideoFormat.hls;
          } else if (content.contains('<MPD') || content.contains('</MPD>')) {
            log.i("Detected DASH format from content");
            return BetterPlayerVideoFormat.dash;
          }
        }
      } catch (e) {
        log.w("GET request failed: $e");
      }

      client.close();
    } catch (e) {
      log.e("Error detecting video format: $e");
    }

    return null;
  }
}
