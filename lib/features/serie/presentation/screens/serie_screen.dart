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

import 'package:flutter/material.dart';
import 'package:flutter_debouncer/flutter_debouncer.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:forui/forui.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:intl/intl.dart';
import 'package:pusoo/features/serie/presentation/providers/serie_track_count_notifier.dart';
import 'package:pusoo/features/serie/presentation/providers/serie_track_group_titles_notifier.dart';
import 'package:pusoo/features/serie/presentation/providers/serie_tracks_filter_notifier.dart';
import 'package:pusoo/features/serie/presentation/providers/serie_tracks_notifier.dart';
import 'package:pusoo/features/serie/presentation/providers/serie_tracks_paging_notifier.dart';
import 'package:pusoo/features/track/domain/models/track_filter_query.dart';
import 'package:pusoo/features/track/presentation/widgets/paged_track_view.dart';

class SerieScreen extends StatefulHookConsumerWidget {
  const SerieScreen({super.key});

  @override
  ConsumerState<SerieScreen> createState() => _SerieScreenState();
}

class _SerieScreenState extends ConsumerState<SerieScreen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref
          .read(serieTrackGroupTitlesProvider.notifier)
          .perform(TrackFilterQuery(isTvSerie: true));

      ref
          .read(serieTrackCountProvider.notifier)
          .perform(TrackFilterQuery(isTvSerie: true));
    });
  }

  final Debouncer _debouncer = Debouncer();
  final Duration _debounceDuration = const Duration(milliseconds: 500);

  bool listViewMode = true;

  @override
  Widget build(BuildContext context) {
    final isPotrait =
        MediaQuery.of(context).orientation == Orientation.portrait;

    final searchController = useTextEditingController();

    final asyncGroupTitles = ref.watch(serieTrackGroupTitlesProvider);

    return FScaffold(
      childPad: false,
      resizeToAvoidBottomInset: false,
      header: FHeader(
        title: Row(
          children: [
            const Text('TV Series'),
            Gap(10),
            !isPotrait
                ? Expanded(child: _buildSearch(searchController))
                : SizedBox.shrink(),
          ],
        ),
        suffixes: [
          FHeaderAction(
            icon: Icon(listViewMode ? FIcons.grid2x2 : FIcons.rows3),
            onPress: () async {
              setState(() {
                listViewMode = !listViewMode;
              });
            },
          ),
          FHeaderAction(
            icon: Icon(FIcons.menu),
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
                                      title: Text("All TV Series"),
                                      suffix: Icon(FIcons.chevronRight),
                                      onPress: () {
                                        ref
                                            .read(
                                              serieTracksFilterProvider
                                                  .notifier,
                                            )
                                            .changeGroupTitle(null);
                                        ref
                                            .read(serieTracksPagingProvider)
                                            .refresh();

                                        context.pop();
                                      },
                                    ),
                                    ...data!.map(
                                      (e) => FItem(
                                        prefix: Icon(FIcons.tag),
                                        title: Text(
                                          e.trim().isEmpty
                                              ? "Unknown"
                                              : e.trim(),
                                        ),
                                        suffix: Icon(FIcons.chevronRight),
                                        onPress: () {
                                          ref
                                              .read(
                                                serieTracksFilterProvider
                                                    .notifier,
                                              )
                                              .changeGroupTitle(e);
                                          ref
                                              .read(serieTracksPagingProvider)
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
        spacing: 10,
        children: [
          isPotrait ? _buildSearch(searchController) : SizedBox.shrink(),
          Expanded(
            child: RefreshIndicator(
              child: PagingListener(
                controller: ref.watch(serieTracksPagingProvider),
                builder: (BuildContext context, state, fetchNextPage) =>
                    PagedTrackView(
                      pagingState: state,
                      fetchNextPage: fetchNextPage,
                      isListView: listViewMode,
                      contentType: TrackContentType.serie,
                    ),
              ),
              onRefresh: () async {
                ref.read(serieTracksFilterProvider.notifier).reset();
                ref.read(serieTracksPagingProvider).refresh();
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearch(TextEditingController controller) {
    final asyncCountTrack = ref.watch(serieTracksProvider);

    return FTextField(
      controller: controller,
      hint: asyncCountTrack.hasValue
          ? "Find a channel - ${NumberFormat.decimalPattern().format(asyncCountTrack.value)} available"
          : "Find a channel...",
      clearable: (e) => e.text.isNotEmpty,
      onChange: (String value) {
        _debouncer.debounce(
          duration: _debounceDuration,
          onDebounce: () async {
            ref.read(serieTracksFilterProvider.notifier).changeTitle(value);
            ref.read(serieTracksPagingProvider).refresh();
          },
        );
      },
    );
  }
}
