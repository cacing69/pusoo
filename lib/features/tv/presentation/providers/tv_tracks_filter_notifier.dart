import 'package:pusoo/features/track/domain/models/track_filter_query.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'tv_tracks_filter_notifier.g.dart';

@Riverpod(keepAlive: true)
class TvTracksFilterNotifier extends _$TvTracksFilterNotifier {
  // Metode build ini akan dipanggil pertama kali oleh Riverpod
  @override
  TrackFilterQuery build() {
    return TrackFilterQuery(limit: 20);
  }

  void changeTitle(String? query) {
    state = state.copyWith(title: query);
  }

  void changeGroupTitle(String? query) {
    state = state.copyWith(groupTitle: query);
  }

  void reset() {
    state = TrackFilterQuery(limit: 20);
  }
}
