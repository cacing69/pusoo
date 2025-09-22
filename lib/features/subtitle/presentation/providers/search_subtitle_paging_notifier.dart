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


import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:pusoo/features/subtitle/presentation/providers/search_subtitle_notifier.dart';
import 'package:pusoo/features/subtitle/presentation/providers/search_subtitle_search_query_params_notifier.dart';
import 'package:pusoo/features/subtitle/presentation/providers/subtitle_providers.dart';
import 'package:pusoo/shared/domain/entities/open_subtitles/subtitle.dart';
import 'package:pusoo/shared/presentation/providers/logger_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'search_subtitle_paging_notifier.g.dart';

@riverpod
class SearchSubtitlePagingNotifier extends _$SearchSubtitlePagingNotifier {
  String? _lastError;

  @override
  PagingController<int, Subtitle> build() {
    final log = ref.read(loggerProvider);

    final controller = PagingController<int, Subtitle>(
      getNextPageKey: (state) {
        // If last page is empty, no more pages
        if (state.lastPageIsEmpty) {
          return null;
        }
        
        // Check if last page has full capacity (50 items)
        if (state.pages?.isNotEmpty == true) {
          final lastPage = state.pages!.last;
          final perPage = ref.read(searchSubtitleProvider).value?.perPage ?? 50;
          
          log.i("Pagination check - Last page items: ${lastPage.length}, Per page: $perPage");
          
          // If last page has less than perPage items, no more pages
          if (lastPage.length < perPage) {
            log.i("No more pages - last page has ${lastPage.length} items (less than $perPage)");
            return null;
          }
          
          log.i("More pages available - last page has ${lastPage.length} items (equal to $perPage)");
        }
        
        return state.nextIntPageKey;
      },
      fetchPage: (pageKey) async {
        log.i("fetchPage called with pageKey: $pageKey");
        
        // Use watch instead of read to get the latest state
        final queryState = ref.watch(searchSubtitleQueryParamsProvider);

        // Jika tidak ada query sama sekali, hentikan request
        if (queryState.query == null) {
          log.i("No query provided, stopping request");
          log.i("Current query state: ${queryState.toJson()}");
          return [];
        }
        
        // Jika query kosong tapi ada imdbId, lanjutkan dengan imdbId
        if (queryState.query!.isEmpty && queryState.imdbId != null) {
          log.i("Query is empty but imdbId provided: ${queryState.imdbId}");
          log.i("Current query state: ${queryState.toJson()}");
        } else if (queryState.query!.isEmpty && queryState.imdbId == null) {
          log.i("Query is empty and no imdbId, returning empty list");
          log.i("Current query state: ${queryState.toJson()}");
          return [];
        }

        log.i("Query state: ${queryState.toJson()}");

        try {
          // Call the usecase directly to get the response
          final result = await ref.read(searchSubtitleUsecaseProvider).call(
            queryState.copyWith(
              page: pageKey, 
              query: queryState.query
            ),
          );
          
          return result.fold(
            (failure) {
              _lastError = failure.message;
              log.e("SearchSubtitleUsecase failed: $failure");
              throw Exception(failure.message);
            },
            (response) {
              _lastError = null; // Clear error on success
              final data = response.data ?? [];
              log.i("Received ${data.length} subtitles for page $pageKey");
              log.i("Response totalCount: ${response.totalCount ?? 'unknown'}");
              log.i("Response totalPages: ${response.totalPages ?? 'unknown'}");
              log.i("Response perPage: ${response.perPage ?? 'unknown'}");
              return data;
            },
          );
        } catch (e) {
          _lastError = e.toString();
          log.e("Error fetching subtitle page: $e");
          rethrow;
        }
      },
    );

    ref.onDispose(() {
      controller.dispose();
    });

    // PagingController should automatically load first page when used in UI

    return controller;
  }

  String? get lastError => _lastError;
}
