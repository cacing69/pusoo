import 'package:better_player_plus/better_player_plus.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:forui/forui.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:pusoo/core/utils/helpers.dart';
import 'package:pusoo/features/tv/presentation/providers/tv_track_group_titles_notifier.dart';
import 'package:pusoo/shared/data/models/track.dart';
import 'package:pusoo/shared/presentation/providers/better_player_notifier.dart';

class TVPlayerScreen extends ConsumerStatefulWidget {
  final Track track;
  const TVPlayerScreen({super.key, required this.track});

  @override
  ConsumerState<TVPlayerScreen> createState() => _TVPlayerScreenState();
}

class _TVPlayerScreenState extends ConsumerState<TVPlayerScreen> {
  // late BetterPlayerController _betterPlayerController;

  // @override
  // void dispose() {
  //   // _betterPlayerController.dispose();
  //   super.dispose();
  // }

  // Helper function to convert hex string to Base64 URL-safe string
  String? urlActive;
  // dynamic debugHttpHeaders;

  @override
  void initState() {
    super.initState();
    // ignore: avoid_print
    // print("[TVPlayerScreen] --- initState called ---");
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   //   // ignore: avoid_print
    //   //   print("[TVPlayerScreen] addPostFrameCallback running...");
    //   //   final controller = ref.read(betterPlayerProvider);
    //   //   final currentUrl = controller?.betterPlayerDataSource?.url;
    //   //   final newUrl = widget.track.links.first;

    //   //   // ignore: avoid_print
    //   //   print("[TVPlayerScreen] Controller is null: ${controller == null}");
    //   //   // ignore: avoid_print
    //   //   print("[TVPlayerScreen] Current URL: $currentUrl");
    //   //   // ignore: avoid_print
    //   //   print("[TVPlayerScreen] New URL: $newUrl");
    //   //   // ignore: avoid_print
    //   //   print("[TVPlayerScreen] URLs are different: ${currentUrl != newUrl}");

    //   //   if (controller == null || currentUrl != newUrl) {
    //   //     // ignore: avoid_print
    //   //     print("[TVPlayerScreen] Condition MET. Calling openMediaStream.");
    //   ref
    //       .read(betterPlayerProvider.notifier)
    //       .openMediaStream(widget.track, isLiveStream: true);
    //   //   } else {
    //   //     // ignore: avoid_print
    //   //     print("[TVPlayerScreen] Condition NOT MET. Skipping openMediaStream.");
    //   //   }
    // });
  }

  // bool isFullScreen = false;

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    final isPotrait = orientation == Orientation.portrait;

    final betterPlayerController = ref.watch(betterPlayerProvider);

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
                  Gap(10),
                  Text("Live TV "),
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
          : const SizedBox.shrink(),
      child: isPotrait
          ? _buildPotraitLayout(context, betterPlayerController, widget.track)
          : _buildLandscapeLayout(
              context,
              betterPlayerController,
              widget.track,
            ),

      // Column(
      //   crossAxisAlignment: CrossAxisAlignment.start,
      //   children: [
      //     Expanded(
      //       child: AspectRatio(
      //         aspectRatio: 16 / 9,
      //         child: betterPlayerController != null
      //             ? BetterPlayer(controller: betterPlayerController)
      //             : Center(
      //                 child: FProgress.circularIcon(
      //                   style: (e) =>
      //                       e.copyWith(color: context.theme.colors.destructive),
      //                 ),
      //               ),
      //       ),
      //     ),
      //     // Gap(10),
      //     Text("Source"),
      //     Gap(5),
      //     Center(
      //       child: Wrap(
      //         children: [
      //           ...widget.track.links.asMap().entries.map((entry) {
      //             int index = entry.key;
      //             String link = entry.value;

      //             return Padding(
      //               padding: const EdgeInsets.all(3.0),
      //               child: SizedBox(
      //                 width: 50,
      //                 height: 50,
      //                 child: FButton(
      //                   style: FButtonStyle.outline(),
      //                   child: Text("${index + 1}"),
      //                   onPress: () {
      //                     showFlutterToast(
      //                       message: "Changed to URL #${index + 1}",
      //                       context: context,
      //                     );

      //                     ref
      //                         .read(betterPlayerProvider.notifier)
      //                         .openMediaStream(
      //                           widget.track,
      //                           isLiveStream: true,
      //                           useUrlOnIndex: index,
      //                         );
      //                   },
      //                 ),
      //               ),
      //             );
      //           }),
      //         ],
      //       ),
      //     ),
      //     Gap(10),
      //     SafeArea(
      //       top: false,
      //       child: FButton(
      //         style: FButtonStyle.outline(),
      //         onPress: () {
      //           betterPlayerController?.toggleFullScreen();
      //         },
      //         prefix: const Icon(FIcons.fullscreen),
      //         child: Text("Fullscreen"),
      //       ),
      //     ),
      //   ],
      // ),
    );
  }

  Widget _buildButtonFavoriteAndFullScreen(BetterPlayerController? controller) {
    return SafeArea(
      top: false,
      child: Row(
        children: [
          Expanded(
            child: FButton(
              style: FButtonStyle.outline(),
              onPress: () {
                // controller?.toggleFullScreen();
              },
              prefix: const Icon(FIcons.heart),
              child: Text("Add to favorite"),
            ),
          ),
          Gap(10),
          FButton.icon(
            style: FButtonStyle.outline(),
            onPress: () {
              controller?.toggleFullScreen();
            },
            // prefix: const Icon(FIcons.fullscreen),
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Icon(FIcons.fullscreen),
            ),
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
                          FIcons.tv,
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
            Gap(10),
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
                    track.tvgId.isEmpty ? "@tvg-id:not found" : track.tvgId,
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
      ],
    );
  }

  Widget _buildAvailableUrls(Track track) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Available URL Sources"),
        Gap(5),
        Wrap(
          children: [
            ...widget.track.links.asMap().entries.map((entry) {
              int index = entry.key;

              // String link = entry.value;

              return Padding(
                padding: const EdgeInsets.all(3.0),
                child: SizedBox(
                  width: 40,
                  height: 40,
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
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [Text("No information available")],
      ),
    );
  }

  Widget _buildVideoPlayer(BetterPlayerController? controller) {
    return SizedBox(
      width: double.infinity,
      height: MediaQuery.of(context).size.width * 9.0 / 16.0,
      child: AspectRatio(
        aspectRatio: 16 / 9,
        child: controller == null
            ? Center(child: FProgress.circularIcon())
            : BetterPlayer(controller: controller),
      ),
      // _buildVideoPlayer(isBuffering, controller),
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
        _buildVideoPlayer(controller),
        FDivider(
          style: (style) =>
              style.copyWith(padding: EdgeInsets.symmetric(vertical: 10)),
        ),
        _buildChannelInformation(track),
        Gap(5),
        _buildAvailableUrls(track),
        Gap(5),
        Expanded(child: _buildContentScrollable()),
        Gap(10),
        _buildButtonFavoriteAndFullScreen(controller),
        const Gap(15),
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
        Gap(10),
        Expanded(
          flex: 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap(10),
              _buildChannelInformation(track),
              Gap(5),
              _buildAvailableUrls(track),
              Gap(5),
              Expanded(child: _buildContentScrollable()),
              Gap(5),

              _buildButtonFavoriteAndFullScreen(controller),
            ],
          ),
        ),
      ],
    );
  }
}
