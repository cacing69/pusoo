import 'package:better_player_plus/better_player_plus.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:forui/forui.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:pusoo/core/utils/helpers.dart';
import 'package:pusoo/features/track/domain/models/track.dart';
import 'package:pusoo/router.dart';
import 'package:pusoo/shared/presentation/providers/better_player_notifier.dart';

class TVPlayerScreen extends ConsumerStatefulWidget {
  final Track track;
  const TVPlayerScreen({super.key, required this.track});

  ConsumerState<TVPlayerScreen> createState() => _TVPlayerScreenState();
}

class _TVPlayerScreenState extends ConsumerState<TVPlayerScreen>
    with SingleTickerProviderStateMixin {
  final GlobalKey _playerKey = GlobalKey();
  String? urlActive;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref
          .read(betterPlayerProvider.notifier)
          .openMediaStream(widget.track, isLiveStream: true);
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    final isPotrait = orientation == Orientation.portrait;

    final betterPlayerController = ref.watch(betterPlayerProvider);

    // Hapus logika pengecekan orientasi. Selalu gunakan layout potret
    // dan biarkan player yang meng-handle mode lanskap melalui fullscreen.
    return FScaffold(
      header: isPotrait
          ? FHeader.nested(
              title: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 20,
                    height: 20,
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: context.theme.colors.destructive,
                      ),
                    ),
                  ),
                  const Gap(10),
                  const Text("Live TV "),
                ],
              ),
              prefixes: [
                FHeaderAction.back(
                  onPress: () {
                    context.pop();
                  },
                ),
              ],
            )
          : SizedBox.shrink(),
      // SELALU gunakan _buildPotraitLayout untuk menghindari konflik
      child: isPotrait
          ? _buildPotraitLayout(context, betterPlayerController, widget.track)
          : _buildLandscapeLayout(
              context,
              betterPlayerController,
              widget.track,
            ),
    );
  }

  Widget _buildButtonFavoriteSubtitleAndFullscreen(
    BetterPlayerController? controller,
  ) {
    final betterPlayerController = ref.watch(betterPlayerProvider);
    return SafeArea(
      top: false,
      child: Column(
        children: [
          FButton(
            style: FButtonStyle.outline(),
            onPress: () async {
              // String subtitle =
              //     "https://gist.githubusercontent.com/cacing69/bee104dbd333b3fa98dab94c7673f1de/raw/f3eb6671a7c8f6d44080a877b8c6efd04f0332bf/gistfile1.txt";

              // final BetterPlayerSubtitlesSource subtitlesSource =
              //     BetterPlayerSubtitlesSource(
              //       type: BetterPlayerSubtitlesSourceType.network,
              //       urls: [subtitle],
              //     );

              // // betterPlayerController.setupSubtitleSource(subtitlesSource);

              // ref
              //     .read(betterPlayerProvider.notifier)
              //     .loadSubtitle(subtitlesSource);

              // showFlutterToast(message: "Subtitle loaded", context: context);
              if (controller != null) {
                if (controller.isPlaying()!) {
                  controller.pause();
                }
              }

              final reuslt = await context.pushNamed(
                RouteName.subtitleSearch.name,
              );

              if (reuslt == true) {
                if (controller != null) {
                  if (!controller.isPlaying()!) {
                    controller.play();
                  }
                }
              }
            },
            prefix: Icon(FIcons.search),
            child: Text("Search subtitle"),
          ),
          Gap(10),
          Row(
            children: [
              Expanded(
                child: FButton(
                  style: FButtonStyle.outline(),
                  onPress: () {
                    // controller?.toggleFullScreen();
                  },
                  prefix: const Icon(FIcons.heart),
                  child: const Text("Add to favorite"),
                ),
              ),
              const Gap(10),
              FButton.icon(
                style: FButtonStyle.outline(),
                onPress: () {
                  controller?.toggleFullScreen();
                },
                child: const Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Icon(FIcons.fullscreen),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildChannelInformation(Track track) {
    return Column(
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
                      borderRadius: const BorderRadius.all(Radius.circular(4)),
                      color: context.theme.colors.disable(
                        context.theme.colors.foreground,
                      ),
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: CachedNetworkImage(
                      imageUrl: track.tvgLogo,
                      placeholder: (_, __) =>
                          const Center(child: FProgress.circularIcon()),
                      errorWidget: (_, __, ___) => Center(
                        child: Icon(
                          FIcons.tvMinimal,
                          color: context.theme.colors.background.withAlpha(200),
                          size: 20,
                        ),
                      ),
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
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    track.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    softWrap: false,
                  ),
                  const Gap(5),
                  Text(
                    track.tvgId.isEmpty ? "@tvg-id: n/a" : track.tvgId,
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
        Gap(10),
        // FButton(
        //   style: FButtonStyle.outline(),
        //   onPress: () {

        //   },
        //   prefix: Icon(FIcons.captions),
        //   child: Text("Search Subtitle"),
        // ),
      ],
    );
  }

  Widget _buildAvailableUrls(Track track) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Gap(5),
        Text("Available URL Sources"),
        const Gap(5),
        Wrap(
          children: [
            ...widget.track.links.asMap().entries.map((entry) {
              int index = entry.key;

              return Padding(
                padding: const EdgeInsets.all(3.0),
                child: SizedBox(
                  width: 65,
                  child: FButton(
                    style: FButtonStyle.outline(),
                    child: Text("${index + 1}"),
                    onPress: () {
                      showFlutterToast(
                        message: "Changed to URL #${index + 1}",
                        context: context,
                      );

                      ref
                          .read(betterPlayerProvider.notifier)
                          .openMediaStream(
                            widget.track,
                            isLiveStream: true,
                            useUrlOnIndex: index,
                          );
                    },
                  ),
                ),
              );
            }),
          ],
        ),
      ],
    );
  }

  Widget _buildContentScrollable() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [Text("No information available")],
    );
  }

  Widget _buildVideoPlayer(BetterPlayerController? controller) {
    return SizedBox(
      width: double.infinity,
      height: MediaQuery.of(context).size.width * 9.0 / 16.0,
      child: AspectRatio(
        aspectRatio: 16 / 9,
        child: controller == null
            ? const Center(child: FProgress.circularIcon())
            : BetterPlayer(key: _playerKey, controller: controller),
      ),
    );
  }

  Widget _buildPotraitLayout(
    BuildContext context,
    BetterPlayerController? controller,
    Track track,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(flex: 1, child: _buildVideoPlayer(controller)),
        FDivider(
          style: (style) =>
              style.copyWith(padding: const EdgeInsets.symmetric(vertical: 10)),
        ),
        Expanded(
          flex: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildChannelInformation(track),
              const Gap(5),
              _buildAvailableUrls(track),
              const Gap(5),
              Expanded(child: _buildContentScrollable()),
              const Gap(10),
              _buildButtonFavoriteSubtitleAndFullscreen(controller),
              const Gap(15),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildLandscapeLayout(
    BuildContext context,
    BetterPlayerController? controller,
    Track track,
  ) {
    return Row(
      children: [
        Expanded(flex: 2, child: _buildVideoPlayer(controller)),
        const Gap(10),
        Expanded(
          flex: 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Gap(10),
              _buildChannelInformation(track),
              const Gap(5),
              _buildAvailableUrls(track),
              const Gap(5),
              Expanded(child: _buildContentScrollable()),
              const Gap(5),
              _buildButtonFavoriteSubtitleAndFullscreen(controller),
            ],
          ),
        ),
      ],
    );
  }
}
