// file: lib/shared/providers/video_player_provider.dart

import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:media_kit/media_kit.dart';
import 'package:media_kit_video/media_kit_video.dart';
import 'package:pusoo/shared/data/datasources/local/drift_database.dart';

// Provider yang menyimpan instance Player
final videoPlayerProvider = StateProvider.autoDispose<Player>((ref) {
  final player = Player();
  ref.onDispose(() {
    player.dispose(); // Pastikan player di-dispose saat tidak lagi digunakan
  });
  return player;
});

// Provider untuk VideoController
final videoControllerProvider = StateProvider.autoDispose<VideoController>((
  ref,
) {
  final player = ref.watch(videoPlayerProvider);
  return VideoController(player);
});

// Notifier untuk mengelola state pemutaran
class PlaybackNotifier extends StateNotifier<bool> {
  PlaybackNotifier() : super(true); // State awal: buffering

  void setBuffering(bool isBuffering) {
    state = isBuffering;
  }
}

final isBufferingProvider = StateNotifierProvider<PlaybackNotifier, bool>((
  ref,
) {
  return PlaybackNotifier();
});

// Fungsi untuk membuka media stream
void openMediaStream(WidgetRef ref, ChannelDriftData channel) {
  final player = ref.read(videoPlayerProvider);
  final List urls = jsonDecode(channel.streamUrl) as List<dynamic>;

  Map<String, String> customHttpHeaders = {};

  List<String> userAgents = <String>[];

  if ("${channel.extvlcopt}" != "[]") {
    final extvlcopt = jsonDecode("${channel.extvlcopt}");

    if (extvlcopt.runtimeType == List) {
      for (var row in extvlcopt) {
        final split = row.split("=");

        if (split[0].toString().toLowerCase() == "http-user-agent") {
          userAgents.add(split[1]);
        } else {
          customHttpHeaders[split[0].toString().replaceAll("http-", "")] =
              split[1];
        }
      }

      if (userAgents.isNotEmpty) {
        customHttpHeaders["user-agent"] = userAgents.join(" ");
      }
    }
  }

  debugPrint(customHttpHeaders.toString());

  player.open(Media(urls.first, httpHeaders: customHttpHeaders));

  // Mendengarkan state buffering
  player.stream.buffering.listen((isBuffering) {
    ref.read(isBufferingProvider.notifier).setBuffering(isBuffering);
  });
}

final isOverlayVisibleProvider = StateProvider<bool>((ref) => true);
