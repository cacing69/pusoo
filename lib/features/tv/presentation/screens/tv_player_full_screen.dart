import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:forui/forui.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:media_kit_video/media_kit_video.dart';
import 'package:pusoo/shared/data/datasources/local/drift_database.dart';
import 'package:pusoo/shared/presentation/providers/video_playback_notifier.dart';

class TvPlayerFullScreen extends ConsumerStatefulWidget {
  final ChannelDriftData channel;
  const TvPlayerFullScreen({super.key, required this.channel});

  @override
  ConsumerState<TvPlayerFullScreen> createState() => _TvPlayerFullScreenState();
}

class _TvPlayerFullScreenState extends ConsumerState<TvPlayerFullScreen> {
  // State untuk mengontrol visibilitas overlay yang dikelola oleh Riverpod
  // Tidak perlu lagi variabel lokal di sini.
  // bool _isOverlayVisible = true;

  @override
  void initState() {
    super.initState();
    // Atur mode layar dan orientasi saat masuk ke layar ini.
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
  }

  @override
  void dispose() {
    // Kembalikan ke mode normal saat keluar dari layar.
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: SystemUiOverlay.values,
    );
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    super.dispose();
  }

  // Metode untuk mengganti visibilitas overlay.
  // Gunakan Riverpod untuk manajemen state.
  void _toggleOverlayVisibility() {
    ref.read(isOverlayVisibleProvider.notifier).update((state) => !state);
  }

  @override
  Widget build(BuildContext context) {
    // Watch provider untuk mendapatkan state terbaru dan terpusat.
    final player = ref.watch(videoPlayerProvider);
    final controller = ref.watch(videoControllerProvider);
    final isBuffering = ref.watch(isBufferingProvider);
    final isOverlayVisible = ref.watch(isOverlayVisibleProvider);

    return FScaffold(
      // GestureDetector untuk mendeteksi tap pada layar
      child: GestureDetector(
        onTap: _toggleOverlayVisibility,
        child: Stack(
          children: [
            // Video Player dari media_kit.
            // Tidak perlu SizedBox.expand karena Video sudah mengelola ukurannya.
            Video(controller: controller),

            // Loading indicator saat buffering
            if (isBuffering) const Center(child: FProgress.circularIcon()),

            // Custom Overlay Menu
            AnimatedOpacity(
              opacity: isOverlayVisible ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 300),
              child: Stack(
                children: [
                  // Latar belakang gelap semi-transparan
                  Container(color: Colors.black54),
                  // Tombol Kembali
                  Positioned(
                    top: 16.0,
                    left: 16.0,
                    child: FButton.icon(
                      onPress: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(Icons.arrow_back),
                    ),
                  ),
                  // Tombol Play/Pause di tengah
                  Center(
                    // PENGGUNAAN PlayerBuilder: Ikon tombol akan otomatis
                    // diperbarui saat status pemutaran berubah.
                    child: StreamBuilder(
                      // player: player,
                      stream: player.stream.playing,
                      builder: (context, playing) {
                        return FButton.icon(
                          onPress: () {
                            player.playOrPause();
                          },
                          child: Icon(
                            playing.data == true ? FIcons.pause : FIcons.play,
                            size: 48,
                          ),
                        );
                      },
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
