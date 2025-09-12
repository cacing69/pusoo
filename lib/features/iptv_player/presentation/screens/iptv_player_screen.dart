import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
// import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_vlc_player/flutter_vlc_player.dart';
import 'package:forui/forui.dart';
import 'package:go_router/go_router.dart';
import 'package:media_kit/media_kit.dart';
import 'package:media_kit_video/media_kit_video.dart';
// import 'package:pusoo/router.dart';
import 'package:pusoo/shared/data/datasources/drift_database.dart';
// import 'package:video_player/video_player.dart';

class IPTVPlayerScreen extends StatefulWidget {
  final ChannelData channel;
  const IPTVPlayerScreen({super.key, required this.channel});

  @override
  State<IPTVPlayerScreen> createState() => _IPTVPlayerScreenState();
}

class _IPTVPlayerScreenState extends State<IPTVPlayerScreen> {
  // Create a [Player] to control playback.
  late Player _player;

  // Create a [VideoController] to handle video output from [Player].
  late VideoController controller;

  // bool _isLoading = true;

  bool _isBuffering = true;

  // late VideoPlayerController _videoPlayerController;
  // ChewieController? _chewieController;

  // late VlcPlayerController _vlcController;
  // bool _showControls = false;
  // bool _isPaused = false;

  // bool showAds = true;

  @override
  void initState() {
    super.initState();

    _player = Player();

    _player.stream.buffering.listen((isPlaying) {
      if (isPlaying && _isBuffering) {
        setState(() {
          _isBuffering = false;
        });
      }
    });

    final List urls = (jsonDecode(widget.channel.streamUrl) as List<dynamic>);
    debugPrint("urls.toString(): $urls");

    _player.open(Media(urls.first));

    controller = VideoController(_player);

    // _vlcController = VlcPlayerController.network(
    //   urls.first,
    //   hwAcc: HwAcc.full, // hardware acceleration
    //   autoPlay: true, // otomatis mulai
    //   options: VlcPlayerOptions(
    //     // http: VlcHttpOptions([
    //     //   // User-Agent modern, mirip browser / ExoPlayer
    //     //   'user-agent=Mozilla/5.0 (Linux; Android 13; Pixel 7 Pro) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Mobile Safari/537.36',
    //     // ]),
    //     extras: [
    //       '--http-user-agent=Mozilla/5.0 (Linux; Android 13; Pixel 7 Pro) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Mobile Safari/537.36',
    //       '--network-caching=2000', // 2 detik buffer
    //       '--file-caching=2000',
    //       '--drop-late-frames',
    //       '--skip-frames', // skip frame jika decoding lambat
    //       '--avcodec-hw=any', // paksa hardware decoding jika tersedia
    //       '--no-sub-autodetect-file', // matikan deteksi subtitle otomatis
    //       '--no-stats', // matikan statistik untuk performa
    //       '--http-continuous',
    //     ],
    //   ), // caching untuk streaming HLS
    // );

    // _videoPlayerController =
    //     VideoPlayerController.networkUrl(Uri.parse(urls.first))
    //       ..initialize().then((_) {
    //         setState(() {}); // refresh setelah video siap
    //         _videoPlayerController.play();
    //       });

    // _chewieController = ChewieController(
    //   videoPlayerController: _videoPlayerController,
    //   autoPlay: true,
    //   looping: false,
    //   allowFullScreen: true,
    //   allowPlaybackSpeedChanging: false,
    //   aspectRatio: 16 / 9,
    //   fullScreenByDefault: false,
    // );
  }

  @override
  void dispose() {
    // _chewieController?.pause();
    // _chewieController?.dispose();
    // _videoPlayerController.pause();
    // _videoPlayerController.dispose();

    // _vlcController.stop();
    // _vlcController.dispose();
    // controller.;
    _player.dispose();
    super.dispose();
  }

  // void _toggleControls() {
  //   setState(() {
  //     _showControls = !_showControls;
  //   });
  // }

  // void _toggleFullscreen() {
  //   context.pushNamed(RouteName.iptvPlayerFull.name, extra: widget.channel);
  // }

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
      child: Column(
        children: [
          // AspectRatio(
          //   aspectRatio: _videoPlayerController.value.aspectRatio,
          //   child: Chewie(controller: _chewieController!),
          // ),
          Stack(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.width * 9.0 / 16.0,
                // Use [Video] widget to display video output.
                child: _isBuffering
                    ? Center(child: FProgress.circularIcon())
                    : Video(
                        controller: controller,
                        // controls: CupertinoVideoControls,
                      ),
              ),
              // VlcPlayer(
              //   controller: _vlcController,
              //   aspectRatio: 16 / 9,
              //   placeholder: Center(child: FProgress.circularIcon()),
              // ),

              // Positioned.fill(
              //   child: GestureDetector(
              //     behavior: HitTestBehavior
              //         .opaque, // pastikan seluruh area bisa di-tap
              //     onTap: _toggleControls,
              //     child: Container(), // transparan tapi menangkap gesture
              //   ),
              // ),
              // if (_showControls)
              //   Positioned(
              //     bottom: 0,
              //     left: 0,
              //     right: 0,
              //     child: Container(
              //       padding: const EdgeInsets.symmetric(horizontal: 0),
              //       color: Colors.black38,
              //       child: Row(
              //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //         children: [
              //           IconButton(
              //             icon: Icon(
              //               _isPaused ? FIcons.play : FIcons.pause,
              //               color: Colors.white,
              //             ),
              //             onPressed: () {
              //               if (_isPaused) {
              //                 _vlcController.play();
              //               } else {
              //                 _vlcController.pause();
              //               }

              //               setState(() {
              //                 _isPaused = !_isPaused;
              //               });
              //             },
              //           ),
              //           // IconButton(
              //           //   icon: const Icon(Icons.pause, color: Colors.white),
              //           //   onPressed: () => _vlcController.pause(),
              //           // ),
              //           IconButton(
              //             icon: const Icon(
              //               FIcons.fullscreen,
              //               color: Colors.white,
              //             ),
              //             onPressed: _toggleFullscreen,
              //           ),
              //         ],
              //       ),
              //     ),
              //   ),
            ],
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
                  color: context.theme.colors.disable(
                    context.theme.colors.foreground,
                  ),
                ),
                clipBehavior: Clip.antiAlias,
                child: Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: CachedNetworkImage(
                    imageUrl: channel.logo ?? "",
                    fit: BoxFit.cover,
                  ),
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
