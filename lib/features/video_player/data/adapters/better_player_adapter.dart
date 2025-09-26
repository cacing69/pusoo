import 'dart:async';
import 'package:better_player_plus/better_player_plus.dart';
import 'package:flutter/material.dart';
import 'package:pusoo/features/track/domain/models/track.dart';
import 'package:pusoo/features/video_player/domain/entities/video_player_event.dart';
import 'package:pusoo/features/video_player/domain/repositories/video_player_controller_base.dart';

class BetterPlayerAdapter implements VideoPlayerControllerBase {
  final BetterPlayerController _controller;
  final StreamController<VideoPlayerEvent> _eventController =
      StreamController.broadcast();

  BetterPlayerAdapter(this._controller) {
    // Forward BetterPlayer events ke stream internal
    _controller.addEventsListener((event) {
      switch (event.betterPlayerEventType) {
        case BetterPlayerEventType.play:
          _eventController.add(VideoPlayerEvent.play);
          break;
        case BetterPlayerEventType.pause:
          _eventController.add(VideoPlayerEvent.pause);
          break;
        case BetterPlayerEventType.finished:
          _eventController.add(VideoPlayerEvent.ended);
          break;
        default:
          _eventController.add(VideoPlayerEvent.idle);
      }
    });
  }

  @override
  Future<void> play() => _controller.play();

  @override
  Future<void> pause() => _controller.pause();

  @override
  Future<void> stop() async {
    await _controller.pause();
    await _controller.seekTo(const Duration(seconds: 0));
  }

  @override
  Future<void> seek(Duration position) => _controller.seekTo(position);

  @override
  Future<Duration?> get position async =>
      _controller.videoPlayerController?.position;

  @override
  Future<Duration?> get duration async =>
      _controller.videoPlayerController?.value.duration;

  @override
  Stream<VideoPlayerEvent> get events => _eventController.stream;

  @override
  Widget buildView() => BetterPlayer(controller: _controller);

  @override
  void dispose() {
    _eventController.close();
    _controller.dispose();
  }

  @override
  Future<void> open(Track track) {
    // TODO: implement open
    throw UnimplementedError();
  }
}
