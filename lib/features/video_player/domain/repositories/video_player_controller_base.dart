import 'package:flutter/material.dart';
import 'package:pusoo/features/track/domain/models/track.dart';
import 'package:pusoo/features/video_player/domain/entities/video_player_event.dart';

abstract class VideoPlayerControllerBase {
  // open stream
  Future<void> open(Track track);

  // controll playback
  Future<void> play();
  Future<void> pause();
  Future<void> stop();
  Future<void> seek(Duration position);

  // information
  Future<Duration?> get position;
  Future<Duration?> get duration;

  // event
  Stream<VideoPlayerEvent> get events;

  // widget player
  Widget buildView();

  // cleanup
  void dispose();
}
