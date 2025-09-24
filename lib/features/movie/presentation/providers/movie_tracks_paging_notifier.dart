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
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:pusoo/features/track/presentation/providers/track_notifier.dart';
import 'package:pusoo/features/tv/presentation/providers/tv_tracks_filter_notifier.dart';
import 'package:pusoo/features/track/domain/models/track.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'movie_tracks_paging_notifier.g.dart';

@riverpod
class MovieTracksPagingNotifier extends _$MovieTracksPagingNotifier {
  @override
  PagingController<int, Track> build() {
    final controller = PagingController<int, Track>(
      getNextPageKey: (state) {
        debugPrint(
          '[PagingMovieTracksController] getNextPageKey called. Current state: ${state.toString()}',
        );

        if (state.pages == null || state.pages!.isEmpty) {
          debugPrint(
            '[PagingMovieTracksController] getNextPageKey: No pages yet, returning 0 (first page key).',
          );
          return 0;
        }

        if (!state.hasNextPage) {
          debugPrint(
            '[PagingMovieTracksController] getNextPageKey: hasNextPage is false, returning null.',
          );
          return null;
        }

        final lastFetchedPage = state.pages!.last;

        if (lastFetchedPage.length < 20) {
          debugPrint(
            '[PagingMovieTracksController] getNextPageKey: Last page had ${lastFetchedPage.length} items (<20), returning null.',
          );
          return null;
        }

        final nextPageKey = lastFetchedPage.last.id;
        debugPrint(
          '[PagingMovieTracksController] getNextPageController] getNextPageKey: Returning next page key: $nextPageKey',
        );
        return nextPageKey;
      },
      fetchPage: (pageKey) async {
        final filterState = ref.read(tvTracksFilterProvider);

        try {
          await ref
              .read(tracksProvider.notifier)
              .perform(filterState.copyWith(cursor: pageKey));

          return ref.read(tracksProvider).value ?? [];
        } catch (e) {
          rethrow;
        }
      },
    );

    ref.onDispose(() {
      controller.dispose();
    });

    return controller;
  }

  void refresh() {
    state.refresh();
  }
}
