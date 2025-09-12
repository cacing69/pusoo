import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:forui/forui.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:pusoo/shared/data/datasources/drift_database.dart';
import 'package:video_player/video_player.dart';

// https://github.com/iptv-org/iptv/blob/master/streams/id.m3u

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

    // player.open(
    //   Media(
    //     'https://ott-balancer.tvri.go.id/live/eds/Nasional/hls/Nasional.m3u8',
    //     httpHeaders: {'User-Agent': 'VLC/3.0.0 LibVLC/3.0.0'},
    //   ),
    // );

    // Paksa landscape saat video dimulai
    // SystemChrome.setPreferredOrientations([
    //   DeviceOrientation.landscapeLeft,
    //   DeviceOrientation.landscapeRight,
    // ]);

    // Ganti URL IPTV kamu di sini
    _videoPlayerController =
        VideoPlayerController.networkUrl(
            Uri.parse(
              (jsonDecode(widget.channel.streamUrl) as List<dynamic>).first,
            ),
          )
          ..initialize().then((_) {
            setState(() {}); // refresh setelah video siap
            _videoPlayerController.play();
          });

    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      autoPlay: true,
      looping: false,
      allowFullScreen: true,
      allowPlaybackSpeedChanging: true,
      aspectRatio: 16 / 9,
      fullScreenByDefault: false,
    );
  }

  @override
  void dispose() {
    // _videoPlayerController.dispose();
    // _chewieController?.dispose();
    // _betterPlayerController.dispose();
    // controller.player.dispose();
    // player.dispose();
    _chewieController?.pause();
    _chewieController?.dispose();
    _videoPlayerController.pause();
    _videoPlayerController.dispose();

    // Kembalikan ke portrait setelah keluar
    // SystemChrome.setPreferredOrientations([
    //   DeviceOrientation.portraitUp,
    //   DeviceOrientation.portraitDown,
    // ]);

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // if (!_videoPlayerController.value.isInitialized) {
    //   return const Center(child: FProgress.circularIcon());
    // }

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
                  color: context.theme.colors.foreground,
                  shape: BoxShape.circle,
                  // image: DecorationImage(
                  //   image: CachedNetworkImageProvider(
                  //     channel['tvg-logo'],
                  //     // placeholder: (_, __) =>
                  //     //     const Center(child: FProgress.circularIcon()),
                  //     // errorWidget: (_, __, ___) => Center(
                  //     //   child: Icon(
                  //     //     FIcons.imageOff,
                  //     //     color: context.theme.colors.background.withAlpha(200),
                  //     //     size: 40,
                  //     //   ),
                  //     // ),
                  //     // fit: BoxFit.fitWidth,
                  //   ),
                  // ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: CachedNetworkImage(imageUrl: channel.logo ?? ""),
                ),
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
        SizedBox.shrink(),

        // showAds
        //     ? Expanded(
        //         child: Column(
        //           children: [
        //             Row(
        //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //               children: [
        //                 Text("Ads"),
        //                 FButton.icon(
        //                   onPress: () {
        //                     setState(() {
        //                       showAds = false;
        //                     });
        //                   },
        //                   child: Icon(FIcons.x),
        //                 ),
        //               ],
        //             ),
        //             SizedBox(
        //               height: 200,
        //               width: double.infinity,
        //               child: CachedNetworkImage(
        //                 imageUrl: "https://placehold.co/400x600.png",
        //                 placeholder: (_, __) =>
        //                     const Center(child: FProgress.circularIcon()),
        //                 errorWidget: (_, __, ___) => Center(
        //                   child: Icon(
        //                     FIcons.imageOff,
        //                     color: context.theme.colors.background.withAlpha(
        //                       200,
        //                     ),
        //                     size: 40,
        //                   ),
        //                 ),
        //                 fit: BoxFit.fitHeight,
        //               ),
        //             ),
        //             Gap(10),
        //             SafeArea(
        //               top: false,
        //               child: Align(
        //                 alignment: Alignment.centerRight,
        //                 child: Text(
        //                   "Ads by Lorem Ipsum Inc.",
        //                   style: context.theme.typography.xs,
        //                 ),
        //               ),
        //             ),
        //           ],
        //         ),
        //       )
        //     : SizedBox.shrink(),
      ],
    );
  }
}
