import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:forui/forui.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:media_kit/media_kit.dart';
import 'package:media_kit_video/media_kit_video.dart';
import 'package:pusoo/shared/data/datasources/local/drift_database.dart';
import 'package:pusoo/shared/presentation/providers/video_playback_notifier.dart';

class VideoPlayerFullScreen extends ConsumerStatefulWidget {
  final ChannelData channel;
  const VideoPlayerFullScreen({super.key, required this.channel});

  @override
  ConsumerState<VideoPlayerFullScreen> createState() =>
      _VideoPlayerFullScreenState();
}

class _VideoPlayerFullScreenState extends ConsumerState<VideoPlayerFullScreen> {
  // State lokal untuk melacak apakah slider sedang diseret oleh pengguna
  bool _isDragging = false;
  // State lokal untuk menyimpan nilai slider sementara saat di-drag
  double _dragValue = 0.0;

  @override
  void initState() {
    super.initState();

    openMediaStream(ref, widget.channel);

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
  void _toggleOverlayVisibility() {
    ref.read(isOverlayVisibleProvider.notifier).update((state) => !state);
  }

  // Metode pembantu untuk memformat durasi menjadi string HH:mm:ss
  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    // Selalu kembalikan format HH:mm:ss untuk mencegah layout bergeser
    return [hours, minutes, seconds].join(':');
  }

  // subs example :
  final String subtitle =
      "https://gist.githubusercontent.com/matibzurovski/d690d5c14acbaa399e7f0829f9d6888e/raw/63578ca30e7430be1fa4942d4d8dd599f78151c7/example.srt";

  // Metode untuk memuat subtitle saat tombol diklik
  void _loadSubtitle() {
    final player = ref.read(videoPlayerProvider);
    // Muat subtitle menggunakan player.setSubtitle
    player.setSubtitleTrack(SubtitleTrack.uri(subtitle));
  }

  @override
  Widget build(BuildContext context) {
    // Watch provider untuk mendapatkan state terbaru dan terpusat.
    final player = ref.watch(videoPlayerProvider);
    final controller = ref.watch(videoControllerProvider);
    final isBuffering = ref.watch(isBufferingProvider);
    final isOverlayVisible = ref.watch(isOverlayVisibleProvider);

    final currentSubtitleTrack = player.state.track.subtitle;

    debugPrint(
      'Subtitle yang sedang digunakan: ${currentSubtitleTrack.title.toString()}',
    );

    return FScaffold(
      // GestureDetector untuk mendeteksi tap pada layar
      child: Material(
        child: GestureDetector(
          onTap: _toggleOverlayVisibility,
          child: Stack(
            children: [
              // Video Player dari media_kit.
              Video(
                controller: controller,
                subtitleViewConfiguration: const SubtitleViewConfiguration(
                  style: TextStyle(
                    height: 1.4,
                    fontSize: 45.0,
                    letterSpacing: 0.0,
                    wordSpacing: 0.0,
                    color: Color(0xffffffff),
                    fontWeight: FontWeight.normal,
                    backgroundColor: Color(0xaa000000),
                  ),
                  textAlign: TextAlign.center,
                  padding: EdgeInsets.all(24.0),
                ),
              ),

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
                      child: Row(
                        children: [
                          FButton.icon(
                            onPress: () {
                              Navigator.pop(context);
                            },
                            child: const Icon(Icons.arrow_back),
                          ),
                          Gap(10),
                          Text(
                            widget.channel.name,
                            style: context.theme.typography.xl,
                          ),
                        ],
                      ),
                    ),

                    // Tombol Play/Pause di tengah
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        spacing: 20,
                        children: [
                          FButton.icon(
                            onPress: () {},
                            child: const Icon(FIcons.settings),
                          ),
                          StreamBuilder(
                            stream: player.stream.playing,
                            builder: (context, playing) {
                              return FButton.icon(
                                onPress: () {
                                  player.playOrPause();
                                },
                                child: Icon(
                                  playing.data == true
                                      ? FIcons.pause
                                      : FIcons.play,
                                  size: 48,
                                ),
                              );
                            },
                          ),
                          FButton.icon(
                            onPress: _loadSubtitle,
                            child: const Icon(FIcons.captions),
                          ),
                        ],
                      ),
                    ),

                    // Kontrol Playback (Slider dan Waktu)
                    Positioned(
                      bottom: 16.0,
                      left: 16.0,
                      right: 16.0,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // Slider dan Waktu
                          StreamBuilder(
                            stream: player.stream.position,
                            builder: (context, positionSnapshot) {
                              final position =
                                  positionSnapshot.data ?? Duration.zero;
                              final duration = player.state.duration;

                              // Tentukan nilai slider yang akan ditampilkan
                              final double sliderValue = _isDragging
                                  ? _dragValue
                                  : position.inSeconds.toDouble();

                              final double safeMax =
                                  duration.inSeconds.toDouble() > 0
                                  ? duration.inSeconds.toDouble()
                                  : 1.0;

                              // Pastikan nilai slider berada dalam batas durasi
                              final safeSliderValue = sliderValue.clamp(
                                0.0,
                                safeMax,
                              );

                              return Row(
                                children: [
                                  // Menggunakan SizedBox untuk membuat lebar tetap
                                  SizedBox(
                                    width:
                                        75, // Lebar yang cukup untuk menampung '00:00:00'
                                    child: Text(
                                      // Tampilkan nilai _dragValue saat menggeser, jika tidak, gunakan posisi video
                                      _formatDuration(
                                        _isDragging
                                            ? Duration(
                                                seconds: safeSliderValue
                                                    .toInt(),
                                              )
                                            : position,
                                      ),
                                      style: context.theme.typography.sm
                                          .copyWith(color: Colors.white),
                                    ),
                                  ),
                                  const Gap(8),
                                  Expanded(
                                    child: SliderTheme(
                                      data: const SliderThemeData(
                                        showValueIndicator:
                                            ShowValueIndicator.always,
                                        valueIndicatorColor: Colors.white24,
                                        valueIndicatorShape:
                                            PaddleSliderValueIndicatorShape(),
                                      ),
                                      child: Slider(
                                        value: safeSliderValue,
                                        min: 0.0,
                                        max: safeMax,
                                        // Label slider menunjukkan waktu yang sedang diseret
                                        label: _formatDuration(
                                          Duration(
                                            seconds: safeSliderValue.toInt(),
                                          ),
                                        ),
                                        onChanged: (value) {
                                          // Saat pengguna menggeser, update state lokal
                                          setState(() {
                                            _isDragging = true;
                                            _dragValue = value;
                                          });
                                        },
                                        onChangeEnd: (value) {
                                          // Saat pengguna selesai menggeser, lakukan seek
                                          player.seek(
                                            Duration(seconds: value.toInt()),
                                          );
                                          // Setelah seek selesai, matikan mode dragging
                                          setState(() {
                                            _isDragging = false;
                                            _dragValue =
                                                value; // Sinkronkan nilai drag
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                  const Gap(8),
                                  Text(
                                    _formatDuration(duration),
                                    style: context.theme.typography.sm.copyWith(
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
