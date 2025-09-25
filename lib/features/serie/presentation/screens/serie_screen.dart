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
import 'package:forui/forui.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:pusoo/features/serie/presentation/providers/serie_track_count_notifier.dart';
import 'package:pusoo/features/serie/presentation/providers/serie_track_group_titles_notifier.dart';
import 'package:pusoo/features/serie/presentation/providers/serie_tracks_filter_notifier.dart';
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
          .perform(TrackFilterQuery(isMovie: true));

      ref
          .read(serieTrackCountProvider.notifier)
          .perform(TrackFilterQuery(isMovie: true));
    });
  }

  bool listViewMode = true;

  @override
  Widget build(BuildContext context) {
    final isPotrait =
        MediaQuery.of(context).orientation == Orientation.portrait;

    return FScaffold(
      childPad: false,
      resizeToAvoidBottomInset: false,
      header: FHeader(
        title: Row(
          children: [
            const Text('TV Series'),
            Gap(10),
            !isPotrait
                ? Expanded(
                    child: FTextField(hint: "Find something to watch..."),
                  )
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
        ],
      ),
      child: Column(
        spacing: 10,
        children: [
          isPotrait
              ? FTextField(hint: "Find something to watch...")
              : SizedBox.shrink(),
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
}
