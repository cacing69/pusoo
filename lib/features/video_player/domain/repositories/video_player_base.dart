import 'package:flutter/material.dart';
import 'package:pusoo/features/video_player/domain/entities/video_player_event.dart';

abstract class VideoPlayerControllerBase {
  Future<void> play();
  Future<void> pause();
  Future<void> stop();
  Future<void> seek(Duration position);
  Future<Duration?> get position;
  Future<Duration?> get duration;
  Stream<VideoPlayerEvent> get events;
  Widget buildView();
}
