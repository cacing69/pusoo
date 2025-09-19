import 'package:pusoo/features/subtitle/presentation/providers/subtitle_providers.dart';
import 'package:pusoo/shared/domain/entities/open_subtitles/search_subtitle_query_params.dart';
import 'package:pusoo/shared/domain/entities/open_subtitles/subtitle.dart';
import 'package:pusoo/shared/domain/entities/open_subtitles/t_open_subtitle_search_response.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'search_subtitle_notifier.g.dart';

@Riverpod(keepAlive: true)
class SearchSubtitleNotifier extends _$SearchSubtitleNotifier {
  // Metode build ini akan dipanggil pertama kali oleh Riverpod
  @override
  AsyncValue<TOpenSubtitleSearchResponse<List<Subtitle>>?> build() {
    // perform(GetTvTracksParams(limit: 20));
    return const AsyncValue.loading();
  }

  Future<void> perform(SearchSubtitleQueryParams? params) async {
    // Return null sebagai state awal.
    // Provider ini akan di-dispose secara otomatis berkat @riverpod.
    // Kita tidak perlu lagi menulis logika onDispose.
    state = AsyncValue.loading();

    final result = await ref.read(searcSubtitleUsecaseProvider).call(params!);

    result.fold(
      (failure) {
        state = AsyncValue.error(failure, StackTrace.current);
      },
      (data) {
        state = AsyncValue.data(data);
      },
    );
  }
}
