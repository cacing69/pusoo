import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:forui/forui.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:media_kit_video/media_kit_video.dart';
import 'package:pusoo/router.dart';
import 'package:pusoo/shared/data/datasources/local/drift_database.dart';
import 'package:pusoo/shared/presentation/providers/video_playback_notifier.dart';

class TvPlayerScreen extends ConsumerStatefulWidget {
  final ChannelDriftData channel;
  const TvPlayerScreen({super.key, required this.channel});

  @override
  ConsumerState<TvPlayerScreen> createState() => _TvPlayerScreenState();
}

class _TvPlayerScreenState extends ConsumerState<TvPlayerScreen> {
  @override
  void initState() {
    super.initState();
    openMediaStream(ref, widget.channel);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    final isPotrait = orientation == Orientation.portrait;

    // Watch provider untuk mendapatkan state terbaru
    final isBuffering = ref.watch(isBufferingProvider);
    final controller = ref.watch(videoControllerProvider);

    return FScaffold(
      header: isPotrait
          ? FHeader.nested(
              title: Text("Live TV"),
              prefixes: [
                FHeaderAction.back(
                  onPress: () {
                    context.pop();
                  },
                ),
              ],
            )
          : const SizedBox.shrink(), // Header disembunyikan di mode landscape
      child: isPotrait
          ? _buildPortraitLayout(context, isBuffering, controller)
          : _buildLandscapeLayout(context, isBuffering, controller),
    );
  }

  Widget _buildPortraitLayout(
    BuildContext context,
    bool isBuffering,
    VideoController controller,
  ) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: MediaQuery.of(context).size.width * 9.0 / 16.0,
          child: _buildVideoPlayer(isBuffering, controller),
        ),
        const FDivider(),
        FButton(
          style: FButtonStyle.outline(),
          onPress: () {
            context.pushNamed(
              RouteName.tvPlayerFull.name,
              extra: widget.channel,
            );
          },
          prefix: const Icon(FIcons.fullscreen),
          child: const Text("Fullscreen"),
        ),
        const Gap(15),
        Expanded(child: _buildDescription()),
      ],
    );
  }

  // Ubah method buildLandscapeLayout untuk menerima state dari provider
  Widget _buildLandscapeLayout(
    BuildContext context,
    bool isBuffering,
    VideoController controller,
  ) {
    return Row(
      children: [
        Expanded(flex: 2, child: _buildVideoPlayer(isBuffering, controller)),
        Expanded(
          flex: 1,
          child: Column(
            children: [
              Gap(10),
              FButton(
                style: FButtonStyle.outline(),
                onPress: () {
                  context.pushNamed(
                    RouteName.tvPlayerFull.name,
                    extra: widget.channel,
                  );
                },
                prefix: const Icon(FIcons.fullscreen),
                child: const Text("Fullscreen"),
              ),
              Gap(5),
              _buildDescription(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildVideoPlayer(bool isBuffering, VideoController controller) {
    return Stack(
      alignment: Alignment.center,
      children: [
        isBuffering
            ? const Center(child: FProgress.circularIcon())
            : Video(controller: controller, controls: null),
      ],
    );
  }

  Widget _buildDescription() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SizedBox(
                width: 45,
                height: 45,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(5)),
                    color: context.theme.colors.disable(
                      context.theme.colors.foreground,
                    ),
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: Padding(
                    padding: const EdgeInsets.all(1.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(4),
                        ),
                        color: context.theme.colors.disable(
                          context.theme.colors.foreground,
                        ),
                      ),
                      clipBehavior: Clip.antiAlias,
                      child: CachedNetworkImage(
                        imageUrl: widget.channel.logo ?? "",
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
                ),
              ),
              const Gap(10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.channel.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      softWrap: false,
                    ),
                    const Gap(5),
                    Text(
                      widget.channel.tvgId ?? widget.channel.name,
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
          const Gap(10),
          Center(
            child: Text(
              "No Information",
              style: context.theme.typography.base.copyWith(
                color: context.theme.colors.disable(
                  context.theme.colors.foreground,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
