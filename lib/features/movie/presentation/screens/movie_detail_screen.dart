import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:forui/forui.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
// import 'package:media_kit/media_kit.dart';
// import 'package:media_kit_video/media_kit_video.dart';
import 'package:pusoo/shared/data/datasources/drift_database.dart';

class MovieDetailScreen extends StatefulWidget {
  final ChannelData channel;
  const MovieDetailScreen({super.key, required this.channel});

  @override
  State<MovieDetailScreen> createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {
  // Create a [Player] to control playback.
  // late Player _player;

  // // Create a [VideoController] to handle video output from [Player].
  // late VideoController controller;

  // bool _isLoading = true;

  // bool _isBuffering = true;

  // late VideoPlayerController _videoPlayerController;
  // ChewieController? _chewieController;

  // late VlcPlayerController _vlcController;
  // bool _showControls = false;
  // bool _isPaused = false;

  // bool showAds = true;

  @override
  void initState() {
    super.initState();

    // _player = Player();

    // _player.stream.buffering.listen((isPlaying) {
    //   if (isPlaying && _isBuffering) {
    //     setState(() {
    //       _isBuffering = false;
    //     });
    //   }
    // });

    final List urls = (jsonDecode(widget.channel.streamUrl) as List<dynamic>);
    debugPrint("urls.toString(): $urls");

    // _player.open(Media(urls.first));

    // controller = VideoController(_player);

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

  void loadTmdb() {}

  @override
  void dispose() {
    // _chewieController?.pause();
    // _chewieController?.dispose();
    // _videoPlayerController.pause();
    // _videoPlayerController.dispose();

    // _vlcController.stop();
    // _vlcController.dispose();
    // controller.;
    // _player.dispose();
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
        title: Text("Movie Detail"),
        prefixes: [
          FHeaderAction.back(
            onPress: () {
              context.pop(false);
            },
          ),
        ],
      ),
      child: ListView(
        children: [
          // Header dengan poster dan nama
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Poster
              ClipRRect(
                borderRadius: BorderRadius.circular(2),
                child: Image.network(
                  widget.channel.logo!,
                  width: 100,
                  height: 150,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 16),
              // Judul dan rating
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.channel.name,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          FButton(
            style: FButtonStyle.outline(),
            prefix: Icon(FIcons.play),
            onPress: () {},
            child: Text("Watch Now"),
          ),
          Gap(10),
          // Tab navigasi (About, Seasons, Cast, ...)
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: const [
          //     Text('About', style: TextStyle(color: Colors.white)),
          //     Text('Seasons', style: TextStyle(color: Colors.grey)),
          //     Text('Cast', style: TextStyle(color: Colors.grey)),
          //     Text('Comments', style: TextStyle(color: Colors.grey)),
          //   ],
          // ),
          FTabs(
            children: [
              FTabEntry(
                label: const Text('About'),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Synopsis"),
                    Gap(5),
                    Text(
                      'A thriller set two hundred years in the future following the case of a missing young woman who brings a hardened detective and a rogue ship\'s captain together ...',
                      style: TextStyle(color: Colors.grey[300]),
                    ),
                    Gap(10),
                    Text("Genres"),
                    Gap(5),
                    Wrap(
                      spacing: 3,
                      runSpacing: 3,
                      children: [
                        FBadge(child: const Text('New')),
                        FBadge(child: const Text('New')),
                        FBadge(child: const Text('New')),
                        FBadge(child: const Text('New')),
                        FBadge(child: const Text('New')),
                        FBadge(child: const Text('New')),
                        FBadge(child: const Text('New')),
                        FBadge(child: const Text('New')),
                        FBadge(child: const Text('New')),
                        FBadge(child: const Text('New')),
                        FBadge(child: const Text('New')),
                        FBadge(child: const Text('New')),
                        FBadge(child: const Text('New')),
                        FBadge(child: const Text('New')),
                        FBadge(child: const Text('New')),
                        FBadge(child: const Text('New')),
                        FBadge(child: const Text('New')),
                        FBadge(child: const Text('New')),
                        FBadge(child: const Text('New')),
                        FBadge(child: const Text('New')),
                        FBadge(child: const Text('New')),
                        FBadge(child: const Text('New')),
                        FBadge(child: const Text('New')),
                        FBadge(child: const Text('New')),
                        FBadge(child: const Text('New')),
                        FBadge(child: const Text('New')),
                        FBadge(child: const Text('New')),
                        FBadge(child: const Text('New')),
                      ],
                    ),
                    Gap(10),
                    Text("Networks"),
                    Gap(5),
                    Wrap(
                      spacing: 3,
                      runSpacing: 3,
                      children: [
                        FBadge(child: const Text('New')),
                        FBadge(child: const Text('New')),
                        FBadge(child: const Text('New')),
                        FBadge(child: const Text('New')),
                        FBadge(child: const Text('New')),
                        FBadge(child: const Text('New')),
                        FBadge(child: const Text('New')),
                        FBadge(child: const Text('New')),
                        FBadge(child: const Text('New')),
                        FBadge(child: const Text('New')),
                        FBadge(child: const Text('New')),
                        FBadge(child: const Text('New')),
                        FBadge(child: const Text('New')),
                        FBadge(child: const Text('New')),
                        FBadge(child: const Text('New')),
                        FBadge(child: const Text('New')),
                        FBadge(child: const Text('New')),
                        FBadge(child: const Text('New')),
                        FBadge(child: const Text('New')),
                        FBadge(child: const Text('New')),
                        FBadge(child: const Text('New')),
                        FBadge(child: const Text('New')),
                        FBadge(child: const Text('New')),
                        FBadge(child: const Text('New')),
                        FBadge(child: const Text('New')),
                        FBadge(child: const Text('New')),
                        FBadge(child: const Text('New')),
                        FBadge(child: const Text('New')),
                      ],
                    ),
                    Placeholder(),
                    Placeholder(),
                    Placeholder(),
                    Placeholder(),
                    Placeholder(),
                    Placeholder(),
                    Placeholder(),
                    Placeholder(),
                    Placeholder(),
                    Placeholder(),
                  ],
                ),
              ),
              FTabEntry(
                label: const Text('Trailer'),
                child: FCard(
                  title: const Text('Password'),
                  subtitle: const Text(
                    'Change your password here. After saving, you will be logged out.',
                  ),
                  child: Column(
                    children: [
                      const FTextField(label: Text('Current password')),
                      const SizedBox(height: 10),
                      const FTextField(label: Text('New password')),
                      const SizedBox(height: 16),
                      FButton(onPress: () {}, child: const Text('Save')),
                    ],
                  ),
                ),
              ),
              FTabEntry(
                label: const Text('Cast'),
                child: FCard(
                  title: const Text('Cast'),
                  subtitle: const Text(
                    'Cast your password here. After saving, you will be logged out.',
                  ),
                  child: Column(
                    children: [
                      const FTextField(label: Text('Current password')),
                      const SizedBox(height: 10),
                      const FTextField(label: Text('New password')),
                      const SizedBox(height: 16),
                      FButton(onPress: () {}, child: const Text('Save')),
                    ],
                  ),
                ),
              ),
            ],
          ),
          // const SizedBox(height: 16),
          // // Deskripsi
          // Text(
          //   'A thriller set two hundred years in the future following the case of a missing young woman who brings a hardened detective and a rogue ship\'s captain together ...',
          //   style: TextStyle(color: Colors.grey[300]),
          // ),
          // const SizedBox(height: 16),
          // Genres
          // Wrap(
          //   spacing: 8,
          //   children: [
          //     Chip(label: Text('Drama')),
          //     Chip(label: Text('Mystery')),
          //     Chip(label: Text('Sci-Fi & Fantasy')),
          //   ],
          // ),
          // const SizedBox(height: 16),
          // Networks
          // Wrap(
          //   spacing: 8,
          //   children: [
          //     Chip(label: Text('Syfy')),
          //     Chip(label: Text('Amazon')),
          //   ],
          // ),
          // const SizedBox(height: 24),
          // Last episode
          // Column(
          //   crossAxisAlignment: CrossAxisAlignment.start,
          //   children: [
          //     Text(
          //       'Last episode',
          //       style: TextStyle(
          //         color: Colors.white,
          //         fontWeight: FontWeight.bold,
          //       ),
          //     ),
          //     const SizedBox(height: 8),
          //     // ListTile(
          //     //   contentPadding: EdgeInsets.zero,
          //     //   leading: Image.network(
          //     //     'https://s.studiobinder.com/wp-content/uploads/2017/12/Movie-Poster-Template-Dark-with-Image.jpg?x81279',
          //     //     width: 100,
          //     //     fit: BoxFit.cover,
          //     //   ),
          //     //   title: Text('Tribes', style: TextStyle(color: Colors.white)),
          //     //   subtitle: Text(
          //     //     'S05E06 • 6 Jan 2021',
          //     //     style: TextStyle(color: Colors.grey[400]),
          //     //   ),
          //     //   trailing: Icon(Icons.arrow_forward_ios, color: Colors.grey),
          //     // ),
          //   ],
          // ),
        ],
      ),
    );
  }
}
