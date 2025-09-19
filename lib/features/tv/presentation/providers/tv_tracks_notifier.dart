import 'package:pusoo/features/track/domain/models/track_filter_query.dart';
import 'package:pusoo/features/track/presentation/providers/track_providers.dart';
import 'package:pusoo/features/track/domain/models/track.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'tv_tracks_notifier.g.dart';

@Riverpod(keepAlive: true)
class TvTracksNotifier extends _$TvTracksNotifier {
  // Metode build ini akan dipanggil pertama kali oleh Riverpod
  @override
  AsyncValue<List<Track>?> build() {
    // perform(GetTvTracksParams(limit: 20));
    return const AsyncValue.loading();
  }

  Future<void> perform(TrackFilterQuery? params) async {
    // Return null sebagai state awal.
    // Provider ini akan di-dispose secara otomatis berkat @riverpod.
    // Kita tidak perlu lagi menulis logika onDispose.
    state = AsyncValue.loading();

    final result = await ref.read(getTracksUsecaseProvider).call(params);

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
