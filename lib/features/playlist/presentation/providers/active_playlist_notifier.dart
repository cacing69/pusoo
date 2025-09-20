// import 'package:pusoo/core/utils/usecase.dart';
// import 'package:pusoo/features/playlist/domain/models/playlist.dart';
// import 'package:pusoo/features/playlist/presentation/providers/playlist_providers.dart';
// import 'package:riverpod_annotation/riverpod_annotation.dart';

// part 'active_playlist_notifier.g.dart';

// @Riverpod(keepAlive: true)
// class ActivePlaylistNotifier extends _$ActivePlaylistNotifier {
//   // Metode build ini akan dipanggil pertama kali oleh Riverpod
//   @override
//   AsyncValue<Playlist?> build() {
//     return const AsyncValue.loading();
//   }

//   Future<void> perform() async {
//     state = AsyncValue.loading();

//     final result = await ref
//         .read(getActivePlaylistUsecaseProvider)
//         .call(NoParams());

//     result.fold(
//       (failure) {
//         state = AsyncValue.error(failure, StackTrace.current);
//       },
//       (data) {
//         state = AsyncValue.data(data);
//       },
//     );
//   }
// }
