import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'tv_tracks_search_notifier.g.dart';

@Riverpod(keepAlive: true)
class TvTracksSearchNotifier extends _$TvTracksSearchNotifier {
  // Metode build ini akan dipanggil pertama kali oleh Riverpod
  @override
  String? build() {
    return null;
  }

  void changeSearch(String? query) {
    state = query;
  }
}
