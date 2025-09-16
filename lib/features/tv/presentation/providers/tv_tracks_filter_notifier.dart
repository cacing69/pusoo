import 'package:pusoo/features/track/domain/models/get_tracks_params.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'tv_tracks_filter_notifier.g.dart';

@Riverpod(keepAlive: true)
class TvTracksFilterNotifier extends _$TvTracksFilterNotifier {
  // Metode build ini akan dipanggil pertama kali oleh Riverpod
  @override
  GetTracksParams build() {
    return GetTracksParams(limit: 20, isLiveTv: true);
  }

  void changeTitle(String? query) {
    state = state.copyWith(title: query);
  }

  void changeGroupTitle(String? query) {
    state = state.copyWith(groupTitle: query);
  }

  void reset() {
    state = GetTracksParams(limit: 20, isLiveTv: true);
  }
}
