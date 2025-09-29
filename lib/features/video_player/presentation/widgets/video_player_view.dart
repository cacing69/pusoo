import 'package:flutter/widgets.dart';
import 'package:pusoo/features/track/domain/models/track.dart';
import 'package:pusoo/features/video_player/domain/repositories/video_player_controller_base.dart';

class VideoPlayerView extends StatelessWidget {
  final Track track;
  final VideoPlayerControllerBase controller;

  const VideoPlayerView({
    super.key,
    required this.track,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return controller.buildView();
  }
}
