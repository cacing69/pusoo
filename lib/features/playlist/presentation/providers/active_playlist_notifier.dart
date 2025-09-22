/*
 * Pusoo - IPTV Player
 * Copyright (C) 2025 Ibnul Mutaki <ibnuul@gmail.com>
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
 * See the GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program. If not, see <https://www.gnu.org/licenses/>.
 */


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
