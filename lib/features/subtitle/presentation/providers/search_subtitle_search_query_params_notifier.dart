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
}
