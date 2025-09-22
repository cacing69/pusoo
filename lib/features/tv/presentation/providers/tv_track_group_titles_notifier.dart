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


import 'package:pusoo/features/track/domain/models/track_filter_query.dart';
import 'package:pusoo/features/track/presentation/providers/track_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'tv_track_group_titles_notifier.g.dart';

@Riverpod(keepAlive: true)
class TvTrackGroupTitlesNotifier extends _$TvTrackGroupTitlesNotifier {
  // Metode build ini akan dipanggil pertama kali oleh Riverpod
  @override
  AsyncValue<List<String>?> build() {
    // perform(GetTvTracksParams(limit: 20));
    return const AsyncValue.loading();
  }

  Future<void> perform(TrackFilterQuery? params) async {
    // Return null sebagai state awal.
    // Provider ini akan di-dispose secara otomatis berkat @riverpod.
    // Kita tidak perlu lagi menulis logika onDispose.
    state = AsyncValue.loading();

    final result = await ref
        .read(getGroupTitlesTrackUsecaseProvider)
        .call(params);

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
