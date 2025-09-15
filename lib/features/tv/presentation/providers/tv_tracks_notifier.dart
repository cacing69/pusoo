import 'package:pusoo/features/tv/domain/models/get_tv_tracks_params.dart';
import 'package:pusoo/features/tv/presentation/providers/tv_providers.dart';
import 'package:pusoo/shared/data/models/track.dart';
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

  Future<void> perform(GetTvTracksParams? params) async {
    // Return null sebagai state awal.
    // Provider ini akan di-dispose secara otomatis berkat @riverpod.
    // Kita tidak perlu lagi menulis logika onDispose.
    state = AsyncValue.loading();

    final result = await ref.read(getTvTracksUsecaseProvider).call(params);

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
