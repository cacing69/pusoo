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
import 'package:pusoo/features/track/domain/models/track.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'serie_tracks_notifier.g.dart';

@Riverpod(keepAlive: true)
class SerieTracksNotifier extends _$SerieTracksNotifier {
  @override
  AsyncValue<List<Track>?> build() {
    return const AsyncValue.loading();
  }

  Future<void> perform(TrackFilterQuery? params) async {
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
