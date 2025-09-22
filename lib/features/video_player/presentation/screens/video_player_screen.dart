/*
 * Pusoo - IPTV Player
 * Copyright (C) 2025 Ibnul Mutaki <ibnuul@gmail.com>
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
 * See the GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program. If not, see <https://www.gnu.org/licenses/>.
 */


// import 'dart:convert';

// // import 'package:chewie/chewie.dart';
// import 'package:flutter/material.dart';
// // import 'package:flutter_vlc_player/flutter_vlc_player.dart';
// import 'package:forui/forui.dart';
// import 'package:media_kit/media_kit.dart';
// import 'package:media_kit_video/media_kit_video.dart';
// // import 'package:pusoo/router.dart';
// import 'package:pusoo/shared/data/datasources/local/drift_database.dart';
// // import 'package:video_player/video_player.dart';

// class VideoPlayerScreen extends StatefulWidget {
//   final ChannelDriftData channel;
//   const VideoPlayerScreen({super.key, required this.channel});

//   @override
//   State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
// }

// class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
//   // Create a [Player] to control playback.
//   late Player _player;

//   // Create a [VideoController] to handle video output from [Player].
//   late VideoController controller;

//   // bool _isLoading = true;

//   bool _isBuffering = true;

//   // late VideoPlayerController _videoPlayerController;
//   // ChewieController? _chewieController;

//   // late VlcPlayerController _vlcController;
//   // bool _showControls = false;
//   // bool _isPaused = false;

//   // bool showAds = true;

//   @override
//   void initState() {
//     super.initState();

//     _player = Player();

//     _player.stream.buffering.listen((isPlaying) {
//       if (isPlaying && _isBuffering) {
//         setState(() {
//           _isBuffering = false;
//         });
//       }
//     });

//     final List urls = (jsonDecode(widget.channel.streamUrl) as List<dynamic>);
//     debugPrint("urls.toString(): $urls");

//     _player.open(Media(urls.first));

//     controller = VideoController(_player);

//     // _vlcController = VlcPlayerController.network(
//     //   urls.first,
//     //   hwAcc: HwAcc.full, // hardware acceleration
//     //   autoPlay: true, // otomatis mulai
//     //   options: VlcPlayerOptions(
//     //     // http: VlcHttpOptions([
//     //     //   // User-Agent modern, mirip browser / ExoPlayer
//     //     //   'user-agent=Mozilla/5.0 (Linux; Android 13; Pixel 7 Pro) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Mobile Safari/537.36',
//     //     // ]),
//     //     extras: [
//     //       '--http-user-agent=Mozilla/5.0 (Linux; Android 13; Pixel 7 Pro) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Mobile Safari/537.36',
//     //       '--network-caching=2000', // 2 detik buffer
//     //       '--file-caching=2000',
//     //       '--drop-late-frames',
//     //       '--skip-frames', // skip frame jika decoding lambat
//     //       '--avcodec-hw=any', // paksa hardware decoding jika tersedia
//     //       '--no-sub-autodetect-file', // matikan deteksi subtitle otomatis
//     //       '--no-stats', // matikan statistik untuk performa
//     //       '--http-continuous',
//     //     ],
//     //   ), // caching untuk streaming HLS
//     // );

//     // _videoPlayerController =
//     //     VideoPlayerController.networkUrl(Uri.parse(urls.first))
//     //       ..initialize().then((_) {
//     //         setState(() {}); // refresh setelah video siap
//     //         _videoPlayerController.play();
//     //       });

//     // _chewieController = ChewieController(
//     //   videoPlayerController: _videoPlayerController,
//     //   autoPlay: true,
//     //   looping: false,
//     //   allowFullScreen: true,
//     //   allowPlaybackSpeedChanging: false,
//     //   aspectRatio: 16 / 9,
//     //   fullScreenByDefault: false,
//     // );
//   }

//   @override
//   void dispose() {
//     // _chewieController?.pause();
//     // _chewieController?.dispose();
//     // _videoPlayerController.pause();
//     // _videoPlayerController.dispose();

//     // _vlcController.stop();
//     // _vlcController.dispose();
//     // controller.;
//     _player.dispose();
//     super.dispose();
//   }

//   // void _toggleControls() {
//   //   setState(() {
//   //     _showControls = !_showControls;
//   //   });
//   // }

//   // void _toggleFullscreen() {
//   //   context.pushNamed(RouteName.iptvPlayerFull.name, extra: widget.channel);
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return FScaffold(
//       childPad: false,
//       // appBar: AppBar(title: const Text('Chewie IPTV Player')),
//       child: Expanded(
//         child: Center(
//           child: SizedBox(
//             width: MediaQuery.of(context).size.width,
//             height: MediaQuery.of(context).size.width * 9.0 / 16.0,
//             // Use [Video] widget to display video output.
//             child: _isBuffering
//                 ? Center(child: FProgress.circularIcon())
//                 : Video(
//                     controller: controller,
//                     // controls: CupertinoVideoControls,
//                   ),
//           ),
//         ),
//       ),
//     );
//   }
// }
