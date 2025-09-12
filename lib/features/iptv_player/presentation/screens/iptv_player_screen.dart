import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:forui/forui.dart';
import 'package:go_router/go_router.dart';
import 'package:pusoo/shared/data/datasources/drift_database.dart';
import 'package:video_player/video_player.dart';

class IPTVPlayerScreen extends StatefulWidget {
  final ChannelData channel;
  const IPTVPlayerScreen({super.key, required this.channel});

  @override
  State<IPTVPlayerScreen> createState() => _IPTVPlayerScreenState();
}

class _IPTVPlayerScreenState extends State<IPTVPlayerScreen> {
  late VideoPlayerController _videoPlayerController;
  ChewieController? _chewieController;

  bool showAds = true;

  @override
  void initState() {
    super.initState();

    final List urls = (jsonDecode(widget.channel.streamUrl) as List<dynamic>);

    debugPrint("urls.toString(): $urls");

    _videoPlayerController =
        VideoPlayerController.networkUrl(Uri.parse(urls.first))
          ..initialize().then((_) {
            setState(() {}); // refresh setelah video siap
            _videoPlayerController.play();
          });

    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      autoPlay: true,
      looping: false,
      allowFullScreen: true,
      allowPlaybackSpeedChanging: false,
      aspectRatio: 16 / 9,
      fullScreenByDefault: false,
    );
  }

  @override
  void dispose() {
    _chewieController?.pause();
    _chewieController?.dispose();
    _videoPlayerController.pause();
    _videoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FScaffold(
      header: FHeader.nested(
        title: Text("Pusoo IPTV"),
        prefixes: [
          FHeaderAction.back(
            onPress: () {
              context.pop();
            },
          ),
        ],
      ),
      // appBar: AppBar(title: const Text('Chewie IPTV Player')),
      child: !_videoPlayerController.value.isInitialized
          ? Column(
              children: [
                AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Center(child: FProgress.circularIcon()),
                ),
                FDivider(),
                // Konten lain di bawah video
                Expanded(child: buildDescription(widget.channel)),
              ],
            )
          : Column(
              children: [
                AspectRatio(
                  aspectRatio: _videoPlayerController.value.aspectRatio,
                  child: Chewie(controller: _chewieController!),
                ),
                FDivider(),
                Expanded(child: buildDescription(widget.channel)),
              ],
            ),
    );
  }

  Widget buildDescription(ChannelData channel) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 10,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 10,
          children: [
            SizedBox(
              width: 45,
              height: 45,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  color: context.theme.colors.foreground,
                ),
                clipBehavior: Clip.antiAlias,
                child: CachedNetworkImage(imageUrl: channel.logo ?? ""),
              ),
            ),
            Expanded(
              child: Column(
                spacing: 5,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    channel.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    softWrap: false,
                  ),
                  Text(
                    channel.tvgId ?? channel.name,
                    style: context.theme.typography.xs.copyWith(
                      color: context.theme.colors.disable(
                        context.theme.colors.foreground,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Expanded(
          child: Center(
            child: Text(
              "No Information",
              style: context.theme.typography.base.copyWith(
                color: context.theme.colors.disable(
                  context.theme.colors.foreground,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
