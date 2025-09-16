import 'package:better_player_plus/better_player_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:forui/forui.dart';
import 'package:gap/gap.dart';
import 'package:pusoo/core/utils/helpers.dart';
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
    WidgetsBinding.instance.addPostFrameCallback((_) {
      //   // ignore: avoid_print
      //   print("[TVPlayerScreen] addPostFrameCallback running...");
      //   final controller = ref.read(betterPlayerProvider);
      //   final currentUrl = controller?.betterPlayerDataSource?.url;
      //   final newUrl = widget.track.links.first;

      //   // ignore: avoid_print
      //   print("[TVPlayerScreen] Controller is null: ${controller == null}");
      //   // ignore: avoid_print
      //   print("[TVPlayerScreen] Current URL: $currentUrl");
      //   // ignore: avoid_print
      //   print("[TVPlayerScreen] New URL: $newUrl");
      //   // ignore: avoid_print
      //   print("[TVPlayerScreen] URLs are different: ${currentUrl != newUrl}");

      //   if (controller == null || currentUrl != newUrl) {
      //     // ignore: avoid_print
      //     print("[TVPlayerScreen] Condition MET. Calling openMediaStream.");
      ref
          .read(betterPlayerProvider.notifier)
          .openMediaStream(widget.track, isLiveStream: true);
      //   } else {
      //     // ignore: avoid_print
      //     print("[TVPlayerScreen] Condition NOT MET. Skipping openMediaStream.");
      //   }
    });
  }

  bool isFullScreen = false;

  @override
  Widget build(BuildContext context) {
    final betterPlayerController = ref.watch(betterPlayerProvider);

    return FScaffold(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: AspectRatio(
              aspectRatio: 16 / 9,
              child: betterPlayerController != null
                  ? BetterPlayer(controller: betterPlayerController)
                  : Center(
                      child: FProgress.circularIcon(
                        style: (e) =>
                            e.copyWith(color: context.theme.colors.destructive),
                      ),
                    ),
            ),
          ),
          // Gap(10),
          Text("Source"),
          Gap(5),
          Center(
            child: Wrap(
              children: [
                ...widget.track.links.asMap().entries.map((entry) {
                  int index = entry.key;
                  String link = entry.value;

                  return Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: SizedBox(
                      width: 50,
                      height: 50,
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
          ),
          Gap(10),
          SafeArea(
            top: false,
            child: FButton(
              style: FButtonStyle.outline(),
              onPress: () {
                betterPlayerController?.toggleFullScreen();
                // context.pushNamed(
                //   RouteName.tvPlayerFull.name,
                //   extra: widget.track,
                // );

                // setState(() {
                //   isFullScreen = false;
                // });
              },
              prefix: const Icon(FIcons.fullscreen),
              child: Text("Fullscreen"),
            ),
          ),
          // Gap(10),
          // Text(widget.track.title),
          // Text(
          //   betterPlayerController != null
          //       ? betterPlayerController.videoPlayerController == null
          //             ? "vid:null"
          //             : "vid:not_null"
          //       : "null",
          // ),
          // FDivider(),
          // Expanded(
          //   child: SingleChildScrollView(
          //     child: Column(
          //       crossAxisAlignment: CrossAxisAlignment.start,
          //       children: [
          //         // Text(urlActive!),
          //         // FDivider(),
          //         // Text(widget.track.toString()),
          //         JsonView.map(
          //           widget.track.toJson(),
          //           theme: const JsonViewTheme(
          //             viewType: JsonViewType.collapsible,
          //           ),
          //         ),
          //         // FDivider(),
          //         // Text(debugHttpHeaders.toString()),
          //       ],
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
