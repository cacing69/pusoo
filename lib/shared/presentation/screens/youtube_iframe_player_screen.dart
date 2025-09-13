import 'package:flutter/material.dart';
import 'package:forui/forui.dart';
import 'package:forui/widgets/scaffold.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class YoutubeIframePlayerScreen extends StatefulWidget {
  final String videoId;
  final String? title;
  const YoutubeIframePlayerScreen({
    super.key,
    required this.videoId,
    this.title,
  });

  @override
  State<YoutubeIframePlayerScreen> createState() =>
      _YoutubeIframePlayerScreenState();
}

class _YoutubeIframePlayerScreenState extends State<YoutubeIframePlayerScreen> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();

    _controller = YoutubePlayerController.fromVideoId(
      videoId: widget.videoId,
      autoPlay: true,
      params: const YoutubePlayerParams(
        showFullscreenButton: true,
        showControls: true,
      ),
    );
  }

  @override
  void dispose() {
    _controller.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FScaffold(
      header: FHeader.nested(
        title: Text("Trailer"),
        prefixes: [
          FHeaderAction.back(
            onPress: () {
              context.pop(false);
            },
          ),
        ],
      ),
      child: YoutubePlayerScaffold(
        aspectRatio: 16 / 9,
        builder: (context, player) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [player, Gap(5), Text(widget.title!)],
          );
        },
        controller: _controller,
      ),
    );
  }
}
