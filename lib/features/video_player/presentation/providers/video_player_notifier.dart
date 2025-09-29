// import 'package:pusoo/features/video_player/domain/entities/video_player_type.dart';
// import 'package:pusoo/features/video_player/domain/repositories/video_player_base.dart';
// import 'package:riverpod_annotation/riverpod_annotation.dart';

// part 'video_player_notifier.g.dart';

// @riverpod
// class PlayerNotifier extends _$PlayerNotifier {
//   VideoPlayerControllerBase? build() {
//     ref.onDispose(() {
//       state?.dispose();
//     });
//     return null;
//   }

//   Future<void> open(String url, VideoPlayerType type) async {
//     // bikin adapter dari factory
//     final controller = PlayerFactory.create(type: type, url: url);
//     state = controller;
//   }
// }
