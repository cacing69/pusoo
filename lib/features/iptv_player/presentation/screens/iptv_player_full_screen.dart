import 'dart:convert';

// import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vlc_player/flutter_vlc_player.dart';
import 'package:forui/forui.dart';
import 'package:pusoo/shared/data/datasources/drift_database.dart';
// import 'package:video_player/video_player.dart';

class IPTVPlayerFullScreen extends StatefulWidget {
  final ChannelData channel;
  const IPTVPlayerFullScreen({super.key, required this.channel});

  @override
  State<IPTVPlayerFullScreen> createState() => _IPTVPlayerFullScreenState();
}

class _IPTVPlayerFullScreenState extends State<IPTVPlayerFullScreen> {
  // late VideoPlayerController _videoPlayerController;
  // ChewieController? _chewieController;

  late VlcPlayerController _vlcController;
  bool _showControls = false;
  bool _isPaused = false;

  // bool showAds = true;

  @override
  void initState() {
    super.initState();

    // SystemChrome.setPreferredOrientations([
    //   DeviceOrientation.landscapeLeft,
    //   DeviceOrientation.landscapeRight,
    // ]);

    // Sembunyikan status bar dan navigation bar
    // SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

    final List urls = (jsonDecode(widget.channel.streamUrl) as List<dynamic>);

    debugPrint("urls.toString(): $urls");

    _vlcController = VlcPlayerController.network(
      urls.first,
      hwAcc: HwAcc.full, // hardware acceleration
      autoPlay: true, // otomatis mulai
      options: VlcPlayerOptions(
        extras: [
          '--network-caching=2000', // 2 detik buffer
          '--file-caching=2000',
          '--drop-late-frames',
          '--skip-frames', // skip frame jika decoding lambat
          '--avcodec-hw=any', // paksa hardware decoding jika tersedia
          '--no-sub-autodetect-file', // matikan deteksi subtitle otomatis
          '--no-stats', // matikan statistik untuk performa
        ],
      ), // caching untuk streaming HLS
    );

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

    // SystemChrome.setPreferredOrientations([
    //   DeviceOrientation.portraitUp,
    //   DeviceOrientation.portraitDown,
    // ]);

    _vlcController.stop();
    _vlcController.dispose();
    super.dispose();
  }

  void _toggleControls() {
    setState(() {
      _showControls = !_showControls;
    });
  }

  void _toggleFullscreen() {
    // _vlcController.
  }

  @override
  Widget build(BuildContext context) {
    return FScaffold(
      childPad: false,
      // appBar: AppBar(title: const Text('Chewie IPTV Player')),
      child: Expanded(
        child: Center(
          child: Stack(
            children: [
              VlcPlayer(
                controller: _vlcController,
                aspectRatio: 16 / 9,
                placeholder: Center(child: FProgress.circularIcon()),
              ),
              Positioned.fill(
                child: GestureDetector(
                  behavior: HitTestBehavior
                      .opaque, // pastikan seluruh area bisa di-tap
                  onTap: _toggleControls,
                  child: Container(), // transparan tapi menangkap gesture
                ),
              ),
              if (_showControls)
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 0),
                    color: Colors.black38,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          icon: Icon(
                            _isPaused ? FIcons.play : FIcons.pause,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            if (_isPaused) {
                              _vlcController.play();
                            } else {
                              _vlcController.pause();
                            }

                            setState(() {
                              _isPaused = !_isPaused;
                            });
                          },
                        ),
                        // IconButton(
                        //   icon: const Icon(Icons.pause, color: Colors.white),
                        //   onPressed: () => _vlcController.pause(),
                        // ),
                        IconButton(
                          icon: const Icon(
                            FIcons.fullscreen,
                            color: Colors.white,
                          ),
                          onPressed: _toggleFullscreen,
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
