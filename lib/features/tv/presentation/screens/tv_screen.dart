import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_debouncer/flutter_debouncer.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:forui/forui.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:pusoo/core/utils/theme_app.dart';
import 'package:pusoo/features/track/domain/models/get_track_group_titles_params.dart';
import 'package:pusoo/features/tv/presentation/providers/tv_track_group_titles_notifier.dart';
import 'package:pusoo/features/tv/presentation/providers/tv_tracks_paging_notifier.dart';
import 'package:pusoo/features/tv/presentation/providers/tv_tracks_filter_notifier.dart';
import 'package:pusoo/router.dart';
import 'package:pusoo/shared/data/models/track.dart';
// import 'package:pusoo/shared/presentation/providers/better_player_notifier.dart';

class TvScreen extends StatefulHookConsumerWidget {
  const TvScreen({super.key});

  @override
  ConsumerState<TvScreen> createState() => _TvScreenState();
}

class _TvScreenState extends ConsumerState<TvScreen>
    with TickerProviderStateMixin {
  final Debouncer _debouncer = Debouncer();
  final Duration _debounceDuration = const Duration(milliseconds: 500);

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref
          .read(tvTrackGroupTitlesProvider.notifier)
          .perform(GetTrackGroupTitlesParams(isLiveTv: true));
    });
  }

  String countTracks = "0";

  Widget _buildSearch(TextEditingController controller) {
    return FTextField(
      controller: controller,
      hint: "Find something to watch...",
      clearable: (e) => e.text.isNotEmpty,
      onChange: (String value) {
        _debouncer.debounce(
          duration: _debounceDuration,
          onDebounce: () async {
            ref.read(tvTracksFilterProvider.notifier).changeTitle(value);
            ref.read(tvTracksPagingProvider).refresh();
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final searchController = useTextEditingController();
    final orientation = MediaQuery.of(context).orientation;
    final isPotrait = orientation == Orientation.portrait;

    final asyncGroupTitles = ref.watch(tvTrackGroupTitlesProvider);

    MediaQuery.of(context).orientation == Orientation.portrait;

    return FScaffold(
      childPad: false,
      resizeToAvoidBottomInset: false,
      header: FHeader(
        title: Row(
          children: [
            const Text('TV'),
            Gap(10),
            isPotrait
                ? Expanded(
                    flex: 1,
                    child: SizedBox(
                      height: 30,
                      child: Container(
                        decoration: BoxDecoration(
                          border: BoxBorder.all(
                            color: context.theme.colors.border,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(3),
                          child: Row(
                            children: [
                              Gap(2),
                              SizedBox(
                                width: 18,
                                height: 18,
                                child: Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: context.theme.colors.destructive,
                                  ),
                                ),
                              ),
                              Gap(5),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Lorem Ipsum Dolor Sit AmetLorem Ipsum Dolor Sit AmetLorem Ipsum Dolor Sit Amet",
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      style: TextStyle(
                                        fontSize: context
                                            .theme
                                            .typography
                                            .xs
                                            .fontSize,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Text(
                                      "Lorem Ipsum Dolor Sit AmetLorem Ipsum Dolor Sit AmetLorem Ipsum Dolor Sit Amet",
                                      style: TextStyle(
                                        fontSize: CustomThemeData.fontSize.xs1,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Icon(FIcons.antenna),
                              Gap(3),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                : Flexible(child: _buildSearch(searchController)),
            //   FTile(
            //   prefix: SizedBox(
            //     width: 20,
            //     height: 20,
            //     child: Container(
            //       decoration: BoxDecoration(
            //         shape: BoxShape.circle,
            //         color: Colors.green[800],
            //       ),
            //     ),
            //   ),
            //   title: Text("IPTV-ORG COUNTRY"),
            //   // subtitle: Text("Active playlist"),
            //   subtitle: Text("$countTracks channel"),
            //   suffix: Icon(FIcons.chevronRight),
            //   onPress: () async {
            //     showFDialog(
            //       context: context,
            //       builder: (context, style, animation) => FDialog(
            //         animation: animation,
            //         direction: Axis.horizontal,
            //         title: const Text('Change playlist'),
            //         body: Column(
            //           crossAxisAlignment: CrossAxisAlignment.start,
            //           children: [
            //             FDivider(
            //               style: (style) => style.copyWith(
            //                 padding: EdgeInsets.symmetric(vertical: 5),
            //               ),
            //             ),
            //             FItemGroup(
            //               children: [
            //                 FItem(
            //                   prefix: Icon(FIcons.circleDashed),
            //                   title: Text("IPTV-ORG ID"),
            //                   suffix: Icon(FIcons.check),
            //                   onPress: () async {
            //                     if (context.mounted) {
            //                       context.pop();
            //                     }
            //                   },
            //                 ),
            //                 FItem(
            //                   prefix: Icon(FIcons.circleDashed),
            //                   title: Text("IPTV-ORG MY"),
            //                   onPress: () async {
            //                     // loadPlaylist();

            //                     if (context.mounted) {
            //                       context.pop();
            //                     }
            //                   },
            //                 ),
            //                 FItem(
            //                   prefix: Icon(FIcons.circleDashed),
            //                   title: Text("IPTV-ORG PE"),
            //                   onPress: () async {
            //                     if (context.mounted) {
            //                       context.pop();
            //                     }
            //                   },
            //                 ),
            //               ],
            //             ),
            //           ],
            //         ),
            //         actions: [
            //           FButton(
            //             style: FButtonStyle.outline(),
            //             onPress: () => context.pop(),
            //             child: const Text('Close'),
            //           ),
            //         ],
            //       ),
            //     );
            //   },
            // )
          ],
        ),
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
                            child: asyncGroupTitles.when(
                              data: (data) {
                                return Column(
                                  spacing: 0,
                                  children: [
                                    FItem(
                                      prefix: Icon(FIcons.tags),
                                      title: Text("All Chanels"),
                                      suffix: Icon(FIcons.chevronRight),
                                      onPress: () {
                                        ref
                                            .read(
                                              tvTracksFilterProvider.notifier,
                                            )
                                            .changeGroupTitle(null);
                                        ref
                                            .read(tvTracksPagingProvider)
                                            .refresh();

                                        context.pop();
                                      },
                                    ),
                                    ...data!.map(
                                      (e) => FItem(
                                        prefix: Icon(FIcons.tag),
                                        title: Text(e),
                                        suffix: Icon(FIcons.chevronRight),
                                        onPress: () {
                                          ref
                                              .read(
                                                tvTracksFilterProvider.notifier,
                                              )
                                              .changeGroupTitle(e);
                                          ref
                                              .read(tvTracksPagingProvider)
                                              .refresh();

                                          context.pop();
                                        },
                                      ),
                                    ),
                                  ],
                                );
                              },
                              error: (e, f) => SizedBox.shrink(),
                              loading: () => SizedBox.shrink(),
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
        ],
      ),
      child: Column(
        spacing: 0,
        children: [
          Builder(
            builder: (context) {
              return isPotrait
                  ? Column(children: [_buildSearch(searchController), Gap(10)])
                  : SizedBox.shrink();
            },
          ),
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
                                                FIcons.tv,
                                                color: context
                                                    .theme
                                                    .colors
                                                    .background
                                                    .withAlpha(200),
                                                size: 40,
                                              ),
                                            ),
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                      )
                                    : Center(
                                        child: Icon(
                                          FIcons.tv,
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
                                      fontSize: CustomThemeData.fontSize.xs1,
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
                    crossAxisCount: isPotrait ? 4 : 8,
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
