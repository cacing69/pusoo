import 'package:pusoo/features/video_player/data/adapters/better_player_adapter.dart';
import 'package:pusoo/features/video_player/domain/entities/video_player_type.dart';
import 'package:pusoo/features/video_player/domain/repositories/video_player_controller_base.dart';

class VideoPlayerFactory {
  /// Factory utama, dipanggil dari Notifier
  static VideoPlayerControllerBase create({
    required VideoPlayerType type,
    required dynamic controller,
    required String url,
  }) {
    switch (type) {
      case VideoPlayerType.youtube:
      // return YoutubeIframeAdapter(url);

      case VideoPlayerType.mediaKit:
      // return MediaKitAdapter(url);

      case VideoPlayerType.betterPlayer:
        // default:
        return BetterPlayerAdapter(controller);
    }
  }

  /// (Opsional) Auto-detect type berdasarkan URL / ekstensi
  // static VideoPlayerType detectType(String url) {
  //   final lower = url.toLowerCase();

  //   if (lower.contains("youtube.com") || lower.contains("youtu.be")) {
  //     return VideoPlayerType.youtube;
  //   } else if (lower.endsWith(".m3u8")) {
  //     return VideoPlayerType.betterPlayer; // cocok untuk HLS stream
  //   } else if (lower.endsWith(".mp4") || lower.endsWith(".mkv")) {
  //     return VideoPlayerType.mediaKit; // lebih fleksibel untuk file
  //   }

  //   // fallback
  //   return VideoPlayerType.betterPlayer;
  // }
}
