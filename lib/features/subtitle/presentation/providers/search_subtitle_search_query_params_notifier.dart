import 'package:pusoo/shared/domain/entities/open_subtitles/search_subtitle_query_params.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'search_subtitle_search_query_params_notifier.g.dart';

@riverpod
class SearchSubtitleQueryParamsNotifier
    extends _$SearchSubtitleQueryParamsNotifier {
  @override
  SearchSubtitleQueryParams build() {
    return SearchSubtitleQueryParams();
  }

  void updateQuery(String query) {
    state = state.copyWith(query: query);
  }

  void updateLanguage(String language) {
    state = state.copyWith(languages: language);
  }

  void updatePage(int page) {
    state = state.copyWith(page: page);
  }
}
