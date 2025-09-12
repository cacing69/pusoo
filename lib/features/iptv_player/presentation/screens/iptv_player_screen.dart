import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:forui/forui.dart';
import 'package:go_router/go_router.dart';
import 'package:video_player/video_player.dart';

// https://github.com/iptv-org/iptv/blob/master/streams/id.m3u

class IPTVPlayerScreen extends StatefulWidget {
  final String url;
  final String title;
  const IPTVPlayerScreen({super.key, required this.url, required this.title});

  @override
  State<IPTVPlayerScreen> createState() => _IPTVPlayerScreenState();
}

class _IPTVPlayerScreenState extends State<IPTVPlayerScreen> {
  late VideoPlayerController _videoPlayerController;
  ChewieController? _chewieController;

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
        VideoPlayerController.networkUrl(Uri.parse(widget.url))
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
          ? const Center(child: FProgress.circularIcon())
          : Column(
              children: [
                AspectRatio(
                  aspectRatio: _videoPlayerController.value.aspectRatio,
                  child: Chewie(controller: _chewieController!),
                ),
                // Konten lain di bawah video
                Expanded(child: Center(child: Text('Konten lain di sini'))),
              ],
            ),
    );
  }
}
