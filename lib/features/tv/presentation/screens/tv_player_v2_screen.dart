import 'dart:convert';
import 'package:better_player_plus/better_player_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:forui/forui.dart';
import 'package:pusoo/shared/data/datasources/local/drift_database.dart';

class TvPlayerV2Screen extends StatefulWidget {
  final ChannelDriftData channel;
  const TvPlayerV2Screen({super.key, required this.channel});

  @override
  State<TvPlayerV2Screen> createState() => _TvPlayerV2ScreenState();
}

class _TvPlayerV2ScreenState extends State<TvPlayerV2Screen> {
  late BetterPlayerController _betterPlayerController;

  @override
  void dispose() {
    _betterPlayerController.dispose();
    super.dispose();
  }

  // Helper function to convert hex string to Base64 URL-safe string
  String? urlActive;
  dynamic debugHttpHeaders;

  @override
  void initState() {
    super.initState();

    debugPrint(widget.channel.toString());

    final List urls = jsonDecode(widget.channel.streamUrl) as List<dynamic>;

    // Basic player configuration
    BetterPlayerConfiguration betterPlayerConfiguration =
        const BetterPlayerConfiguration(
          autoPlay: true,
          aspectRatio: 16 / 9,
          controlsConfiguration: BetterPlayerControlsConfiguration(
            showControls: true,
          ),
        );

    // 1. Siapkan data dari M3U
    final String videoUrl = urls.first;

    setState(() {
      urlActive = videoUrl;
    });

    Map<String, String>? clearKeyHex;
    String? licenseUrl;

    BetterPlayerVideoFormat? videoFormat;

    final String extensionOnUrl = videoUrl.split(".").last;

    if (extensionOnUrl == "mpd") {
      videoFormat = BetterPlayerVideoFormat.dash;
    } else if (extensionOnUrl == "m3u8") {
      videoFormat = BetterPlayerVideoFormat.hls;
    }

    BetterPlayerDrmType? drmType;

    // bool useClearKey = false;
    // bool useWidevine = false;

    final kodipropDecode = jsonDecode("${widget.channel.kodiprop}");

    if (kodipropDecode.runtimeType == List) {
      final bool hasLicenseType = kodipropDecode.any(
        (element) =>
            (element as String).contains("inputstream.adaptive.license_type"),
      );

      if (hasLicenseType) {
        for (var kdProp in kodipropDecode) {
          final List splitProps = kdProp.split("=");

          if (splitProps[0].toString().toLowerCase() ==
              "inputstream.adaptive.license_type") {
            if (splitProps[1].toString().toLowerCase() == "clearkey") {
              drmType = BetterPlayerDrmType.clearKey;
            } else if (splitProps[1].toString().toLowerCase() ==
                "com.widevine.alpha") {
              drmType = BetterPlayerDrmType.widevine;
            }
            break;
          }
        }
      }

      final bool hasLicenseKey = (kodipropDecode).any(
        (element) =>
            (element as String).contains("inputstream.adaptive.license_key"),
      );

      if (hasLicenseKey) {
        for (var kdProp in kodipropDecode) {
          final List splitProps = kdProp.split("=");

          if (splitProps[0].toString().toLowerCase() ==
              "inputstream.adaptive.license_key") {
            if (drmType == BetterPlayerDrmType.widevine) {
              licenseUrl = kdProp.toString().replaceAll(
                "inputstream.adaptive.license_key=",
                "",
              );
            } else if (drmType == BetterPlayerDrmType.clearKey) {
              final licenseKey = "${splitProps[1]}".split(":");

              clearKeyHex = {licenseKey[0]: licenseKey[1]};
            }
            break;
          }
        }
      }

      final bool hasManifestType = (kodipropDecode).any(
        (element) =>
            (element as String).contains("inputstream.adaptive.manifest_type"),
      );

      if (hasManifestType) {
        for (var kdProp in kodipropDecode) {
          final List splitProps = kdProp.split("=");
          if (splitProps[0].toString().toLowerCase() ==
              "inputstream.adaptive.manifest_type") {
            if (splitProps[1].toString().toLowerCase() == "dash") {
              videoFormat = BetterPlayerVideoFormat.dash;
            } else {
              if (splitProps[1].toString().toLowerCase() == "hls") {
                videoFormat = BetterPlayerVideoFormat.hls;
              }
            }
            break;
          }
        }
      }

      // clearKeyHex = {
      //   "a7e68d7c2667465f976361eb0d6bd0c1": "32a856d04efbf93cee7b2c97643d7998",
      // };
    }

    // Handling HTTP Header

    Map<String, String>? httpHeaders;

    final extvlcoptDecode = jsonDecode("${widget.channel.extvlcopt}");
    if (extvlcoptDecode.runtimeType == List) {
      httpHeaders = {};

      List<String> userAgents = [];

      for (var extvlcopt in extvlcoptDecode) {
        final List splitExtvlcopt = extvlcopt.split("=");

        if (splitExtvlcopt[0].toString().toLowerCase() == "http-user-agent") {
          userAgents.add(splitExtvlcopt[1]);
        } else if (splitExtvlcopt[0].toString().toLowerCase() ==
            "http-referrer") {
          httpHeaders["Referrer"] = splitExtvlcopt[1];
        }
      }

      httpHeaders["User-Agent"] = userAgents.last;
    }

    // // Get the video URL from the provided m3u8 info
    // String videoUrl =
    //     "https://d2tjypxxy769fn.cloudfront.net/out/v1/0fd7b7d368bc44bc9b4dece20acc3e33/index.mpd";

    // IMPORTANT: ClearKey DRM Configuration
    // The key ID and key must be converted from hex to a base64 URL-safe format.
    // final String keyIdHex = "78477d2156944b7cb35762a47973aa9c";
    // final String keyHex = "31805b3c0d03080f9ed33411258e5baf";

    // Create the DRM configuration using BetterPlayerClearKeyUtils.generateKey
    // Pass the Base64 URL-safe strings

    debugPrint("licenseUrl:$licenseUrl");
    // debugPrint("clearKeyHex:$clearKeyHex");
    debugPrint("drmType:$drmType");
    debugPrint("videoFormat:$videoFormat");
    debugPrint("httpHeaders:$httpHeaders");

    setState(() {
      debugHttpHeaders = httpHeaders;
    });

    BetterPlayerDrmConfiguration? drmConfiguration;

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

    // Create the data source with the DRM configuration and headers
    // CHANGE BetterPlayerDataSourceType.network to .networkDASH
    BetterPlayerDataSource betterPlayerDataSource = BetterPlayerDataSource(
      BetterPlayerDataSourceType.network,
      videoUrl,
      videoFormat: videoFormat,
      headers: httpHeaders, // Masukkan headers di sini
      liveStream: true,
      drmConfiguration: drmConfiguration,
    );

    // Initialize the controller and set the data source
    _betterPlayerController = BetterPlayerController(betterPlayerConfiguration);

    _betterPlayerController.setupDataSource(betterPlayerDataSource);
  }

  @override
  Widget build(BuildContext context) {
    return FScaffold(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SafeArea(
            child: AspectRatio(
              aspectRatio: 16 / 9,
              child: BetterPlayer(controller: _betterPlayerController),
            ),
          ),
          Text(widget.channel.name),
          FDivider(),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text(urlActive!),
                  FDivider(),
                  Text(widget.channel.toString()),
                  FDivider(),
                  Text(debugHttpHeaders.toString()),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
