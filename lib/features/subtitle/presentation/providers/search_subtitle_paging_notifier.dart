import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:pusoo/features/subtitle/presentation/providers/search_subtitle_notifier.dart';
import 'package:pusoo/features/subtitle/presentation/providers/search_subtitle_search_query_params_notifier.dart';
import 'package:pusoo/shared/domain/entities/open_subtitles/subtitle.dart';
import 'package:pusoo/shared/presentation/providers/logger_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'search_subtitle_paging_notifier.g.dart';

@riverpod
class SearchSubtitlePagingNotifier extends _$SearchSubtitlePagingNotifier {
  @override
  PagingController<int, Subtitle> build() {
    final log = ref.read(loggerProvider);

    final controller = PagingController<int, Subtitle>(
      getNextPageKey: (state) {
        return state.lastPageIsEmpty ? null : state.nextIntPageKey;
      },
      fetchPage: (pageKey) async {
        log.i("fetchPage called with pageKey: $pageKey");
        
        // Use watch instead of read to get the latest state
        final queryState = ref.watch(searchSubtitleQueryParamsProvider);

        if (queryState.query?.isEmpty ?? true) {
          log.i("Query is empty, returning empty list");
          log.i("Current query state: ${queryState.toJson()}");
          return [];
        }

        log.i("Query state: ${queryState.toJson()}");

        try {
          await ref
              .read(searchSubtitleProvider.notifier)
              .perform(
                queryState.copyWith(page: pageKey, query: queryState.query),
              );

          ref
              .read(searchSubtitleQueryParamsProvider.notifier)
              .updatePage(pageKey);

          final data = ref.read(searchSubtitleProvider).value?.data ?? [];
          log.i("Received ${data.length} subtitles");
          return data;
        } catch (e) {
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
}
