import 'package:pusoo/features/subtitle/presentation/providers/subtitle_providers.dart';
import 'package:pusoo/shared/domain/entities/open_subtitles/search_subtitle_query_params.dart';
import 'package:pusoo/shared/domain/entities/open_subtitles/subtitle.dart';
import 'package:pusoo/shared/domain/entities/open_subtitles/t_open_subtitle_search_response.dart';
import 'package:pusoo/shared/presentation/providers/logger_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'search_subtitle_notifier.g.dart';

@Riverpod(keepAlive: true)
class SearchSubtitleNotifier extends _$SearchSubtitleNotifier {
  @override
  AsyncValue<TOpenSubtitleSearchResponse<List<Subtitle>>?> build() {
    return AsyncValue.data(TOpenSubtitleSearchResponse(data: []));
  }

  Future<void> perform(SearchSubtitleQueryParams? params) async {
    final log = ref.read(loggerProvider);
    state = AsyncValue.loading();

    final result = await ref.read(searchSubtitleUsecaseProvider).call(params!);

    result.fold(
      (failure) {
        log.e("SearchSubtitleNotifier error: $failure");
        state = AsyncValue.error(failure, StackTrace.current);
      },
      (data) {
        log.i("SearchSubtitleNotifier success: ${data.data?.length} subtitles");
        state = AsyncValue.data(data);
      },
    );
  }
}
