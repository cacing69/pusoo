// File: lib/shared/presentation/widgets/tv_player_full_screen.dart

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:forui/forui.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:better_player_plus/better_player_plus.dart';
import 'package:pusoo/core/utils/helpers.dart';
import 'package:pusoo/shared/data/models/track.dart';
import 'package:pusoo/shared/presentation/providers/better_player_notifier.dart';

class TvPlayerFullScreen extends ConsumerStatefulWidget {
  final Track channel;
  const TvPlayerFullScreen({super.key, required this.channel});

  @override
  ConsumerState<TvPlayerFullScreen> createState() => _TvPlayerFullScreenState();
}

class _TvPlayerFullScreenState extends ConsumerState<TvPlayerFullScreen> {
  // State untuk mengontrol visibilitas overlay secara internal
  bool _isOverlayVisible = true;

  // Instance BetterPlayerController
  // BetterPlayerController? _betterPlayerController;

  @override
  void initState() {
    super.initState();

    // Inisialisasi controller dari provider
    // _betterPlayerController = ref.read(betterPlayerProvider);

    // Atur mode layar dan orientasi saat masuk ke layar ini.
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);

    // Tambahkan listener untuk mendeteksi visibilitas kontrol bawaan
    // ref.read(betterPlayerProvider)?.addEventsListener((event) {
    //   if (event.betterPlayerEventType ==
    //       BetterPlayerEventType.controlsVisible) {
    //     setState(() => _isOverlayVisible = true);
    //   } else if (event.betterPlayerEventType ==
    //       BetterPlayerEventType.controlsHiddenEnd) {
    //     setState(() => _isOverlayVisible = false);
    //   }
    // });
  }

  // @override
  // void dispose() {
  //   // Kembalikan ke mode normal saat keluar dari layar.
  //   SystemChrome.setEnabledSystemUIMode(
  //     SystemUiMode.manual,
  //     overlays: SystemUiOverlay.values,
  //   );
  //   SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  //   super.dispose();
  // }

  // Metode untuk mengganti visibilitas overlay
  void _toggleOverlayVisibility() {
    setState(() {
      _isOverlayVisible = !_isOverlayVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Baca controller dari provider, tapi tidak perlu 'watch'
    // karena kita sudah menginisialisasi di initState
    final betterPlayerController = ref.watch(betterPlayerProvider);

    if (betterPlayerController == null) {
      return const FScaffold(child: Center(child: FProgress.circularIcon()));
    }

    return FScaffold(
      // GestureDetector untuk mendeteksi tap pada layar
      child: GestureDetector(
        onTap: _toggleOverlayVisibility,
        child: Stack(
          children: [
            // Video Player
            Center(
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: BetterPlayer(controller: betterPlayerController),
              ),
            ),

            // Overlay Kustom
            AnimatedOpacity(
              opacity: _isOverlayVisible ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 300),
              child: Stack(
                children: [
                  Container(color: Colors.black54),

                  // Tombol Kembali
                  Positioned(
                    top: 16.0,
                    left: 16.0,
                    child: FButton.icon(
                      onPress: () {
                        SystemChrome.setEnabledSystemUIMode(
                          SystemUiMode.manual,
                          overlays: SystemUiOverlay.values,
                        );
                        SystemChrome.setPreferredOrientations([
                          DeviceOrientation.portraitUp,
                        ]);

                        context.pop();
                      },
                      child: const Icon(Icons.arrow_back),
                    ),
                  ),

                  // Tombol Play/Pause di tengah
                  Center(
                    child: FButton.icon(
                      onPress: () {
                        // betterPlayerController.play();
                        showFlutterToast(
                          message: "Info Tapped!",
                          context: context,
                        );
                      },
                      child: const Icon(FIcons.info, size: 48),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
