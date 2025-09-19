import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:pusoo/features/subtitle/presentation/providers/search_subtitle_notifier.dart';
import 'package:pusoo/features/subtitle/presentation/providers/search_subtitle_search_query_params_notifier.dart';
import 'package:pusoo/shared/domain/entities/open_subtitles/subtitle.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'search_subtitle_paging_notifier.g.dart';

@riverpod
class SearchSubtitlePagingNotifier extends _$SearchSubtitlePagingNotifier {
  @override
  PagingController<int, Subtitle> build() {
    final controller = PagingController<int, Subtitle>(
      getNextPageKey: (state) {
        return state.lastPageIsEmpty ? null : state.nextIntPageKey;
      },
      fetchPage: (pageKey) async {
        final queryState = ref.read(searchSubtitleQueryParamsProvider);

        try {
          await ref
              .read(searchSubtitleProvider.notifier)
              .perform(queryState.copyWith(page: pageKey));

          return ref.read(searchSubtitleProvider).value?.data ?? [];
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
