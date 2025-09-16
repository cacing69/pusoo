import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_debouncer/flutter_debouncer.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:forui/forui.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:pusoo/features/tv/domain/models/get_tv_tracks_params.dart';
import 'package:pusoo/features/tv/presentation/providers/tv_tracks_notifier.dart';
import 'package:pusoo/features/tv/presentation/providers/tv_tracks_paging_notifier.dart';
import 'package:pusoo/features/tv/presentation/providers/tv_tracks_search_notifier.dart';
import 'package:pusoo/router.dart';
import 'package:pusoo/shared/data/models/track.dart';
// import 'package:pusoo/shared/presentation/providers/better_player_notifier.dart';

class TvScreen extends StatefulHookConsumerWidget {
  const TvScreen({super.key});

  @override
  ConsumerState<TvScreen> createState() => _TvScreenState();
}

// final pagingTvTracksControllerProvider =
//     Provider.autoDispose<PagingController<int, Track>>((ref) {
//       ref.keepAlive(); // ini akan mencegah dispose otomatis

//       final controller = PagingController<int, Track>(
//         getNextPageKey: (state) {
//           if (state.lastPageIsEmpty) {
//             return 0;
//           }

//           final lastItem = state.items?.last;

//           return lastItem?.id ?? 0;
//         },
//         fetchPage: (cursor) async {
//           final searchState = ref.read(tvTracksSearchProvider);

//           final stopFetch =
//               cursor != 0 &&
//               (ref.read(tvTracksProvider).value ?? []).length < 20;

//           // harus berhenti fetch page
//           if (stopFetch) {
//             return [];
//           } else {
//             await ref
//                 .read(tvTracksProvider.notifier)
//                 .perform(
//                   GetTvTracksParams(
//                     limit: 20,
//                     cursor: cursor,
//                     title: searchState,
//                   ),
//                 );

//             return ref.read(tvTracksProvider).value!;
//           }
//           // return [];
//         },
//       );

//       ref.onDispose(controller.dispose);

//       return controller;
//     });

class _TvScreenState extends ConsumerState<TvScreen>
    with TickerProviderStateMixin {
  final Debouncer _debouncer = Debouncer();
  final Duration _debounceDuration = const Duration(milliseconds: 500);

  @override
  void initState() {
    super.initState();
  }

  String countTracks = "0";

  @override
  Widget build(BuildContext context) {
    final searchController = useTextEditingController();

    MediaQuery.of(context).orientation == Orientation.portrait;

    return FScaffold(
      resizeToAvoidBottomInset: false,
      header: FHeader(
        title: const Text('Live TV'),
        suffixes: [
          FHeaderAction(
            icon: Icon(FIcons.menu, size: 25),
            onPress: () async {
              showFSheet(
                context: context,
                side: FLayout.ltr,
                useRootNavigator: true,
                useSafeArea: false,
                mainAxisMaxRatio: null,
                constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width * 0.8,
                  maxHeight: double.infinity,
                ),
                barrierDismissible: true,
                draggable: true,
                builder: (context) => FScaffold(
                  child: SafeArea(
                    child: Column(
                      spacing: 5,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Gap(10),
                            Text(
                              "Category",
                              style: context.theme.typography.base.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        FDivider(
                          style: (style) => style.copyWith(
                            padding: EdgeInsets.symmetric(vertical: 5),
                          ),
                        ),
                        Expanded(
                          child: SingleChildScrollView(
                            child: Column(spacing: 0, children: [

                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
          FHeaderAction(
            icon: Icon(FIcons.refreshCw, size: 25),
            onPress: () async {
              setState(() {
                // channels = [];
              });
              // loadM3U();
            },
          ),
        ],
      ),
      child: Column(
        spacing: 0,
        children: [
          FTile(
            prefix: SizedBox(
              width: 20,
              height: 20,
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.green[800],
                ),
              ),
            ),
            title: Text("IPTV-ORG COUNTRY"),
            // subtitle: Text("Active playlist"),
            subtitle: Text("$countTracks channel"),
            suffix: Icon(FIcons.chevronRight),
            onPress: () async {
              showFDialog(
                context: context,
                builder: (context, style, animation) => FDialog(
                  animation: animation,
                  direction: Axis.horizontal,
                  title: const Text('Change playlist'),
                  body: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FDivider(
                        style: (style) => style.copyWith(
                          padding: EdgeInsets.symmetric(vertical: 5),
                        ),
                      ),
                      FItemGroup(
                        children: [
                          FItem(
                            prefix: Icon(FIcons.circleDashed),
                            title: Text("IPTV-ORG ID"),
                            suffix: Icon(FIcons.check),
                            onPress: () async {
                              if (context.mounted) {
                                context.pop();
                              }
                            },
                          ),
                          FItem(
                            prefix: Icon(FIcons.circleDashed),
                            title: Text("IPTV-ORG MY"),
                            onPress: () async {
                              // loadPlaylist();

                              if (context.mounted) {
                                context.pop();
                              }
                            },
                          ),
                          FItem(
                            prefix: Icon(FIcons.circleDashed),
                            title: Text("IPTV-ORG PE"),
                            onPress: () async {
                              if (context.mounted) {
                                context.pop();
                              }
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                  actions: [
                    FButton(
                      style: FButtonStyle.outline(),
                      onPress: () => context.pop(),
                      child: const Text('Close'),
                    ),
                  ],
                ),
              );
            },
          ),
          Gap(5),
          FTextField(
            controller: searchController,
            hint: "Find something to watch...",
            label: Text("Search"),
            clearable: (e) => e.text.isNotEmpty,
            onChange: (String value) {
              _debouncer.debounce(
                duration: _debounceDuration,
                onDebounce: () async {
                  ref.read(tvTracksSearchProvider.notifier).changeSearch(value);
                  ref.read(tvTracksPagingProvider).refresh();
                },
              );
            },
          ),
          Gap(10),
          Expanded(
            child: RefreshIndicator(
              child: PagingListener(
                controller: ref.watch(tvTracksPagingProvider),
                builder: (context, state, fetchNextPage) => PagedGridView(
                  padding: EdgeInsets.zero,
                  state: state,
                  fetchNextPage: fetchNextPage,
                  builderDelegate: PagedChildBuilderDelegate(
                    itemBuilder: (context, Track item, index) => GestureDetector(
                      onTap: () {
                        // debugPrint(series[index].toString());
                        // ref
                        //     .read(betterPlayerProvider.notifier)
                        //     .openMediaStream(
                        //       tracks[index],
                        //       isLiveStream: true,
                        //     );

                        context.pushNamed(RouteName.tvPlayer.name, extra: item);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(
                            color: context.theme.colors.border,
                            width: 1,
                          ),
                          color: context.theme.colors.disable(
                            context.theme.colors.foreground,
                          ),
                        ),
                        clipBehavior: Clip.antiAlias,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(4),
                          child: Stack(
                            children: [
                              SizedBox(
                                width: double.infinity,
                                height: 120, // tinggi tetap
                                child: item.tvgLogo.isNotEmpty
                                    ? Padding(
                                        padding: const EdgeInsets.all(1.0),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                              4,
                                            ),
                                          ),
                                          clipBehavior: Clip.antiAlias,
                                          child: CachedNetworkImage(
                                            imageUrl: item.tvgLogo,
                                            placeholder: (_, __) =>
                                                const Center(
                                                  child:
                                                      FProgress.circularIcon(),
                                                ),
                                            errorWidget: (_, __, ___) => Center(
                                              child: Icon(
                                                FIcons.imageOff,
                                                color: context
                                                    .theme
                                                    .colors
                                                    .background
                                                    .withAlpha(200),
                                                size: 40,
                                              ),
                                            ),
                                            fit: BoxFit.fitWidth,
                                          ),
                                        ),
                                      )
                                    : Center(
                                        child: Icon(
                                          FIcons.imageOff,
                                          size: 40,
                                          color: context.theme.colors.background
                                              .withAlpha(200),
                                        ),
                                      ),
                              ),
                              Positioned(
                                left: 0,
                                right: 0,
                                bottom: 0,
                                child: Container(
                                  padding: const EdgeInsets.all(6),
                                  color: context.theme.colors.background
                                      .withAlpha(125),
                                  child: Text(
                                    item.title,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      color: context.theme.colors.foreground,
                                      fontSize:
                                          context.theme.typography.xs.fontSize,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    firstPageProgressIndicatorBuilder: (context) =>
                        FProgress.circularIcon(),
                    newPageProgressIndicatorBuilder: (context) =>
                        FProgress.circularIcon(),
                  ),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 5,
                    childAspectRatio: 1,
                  ),
                ),
              ),
              onRefresh: () async {
                ref.read(tvTracksPagingProvider).refresh();
              },
            ),
          ),
        ],
      ),
    );
  }
}
