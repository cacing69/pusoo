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
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'movie_tracks_filter_notifier.g.dart';

@Riverpod(keepAlive: true)
class MovieTracksFilterNotifier extends _$MovieTracksFilterNotifier {
  @override
  TrackFilterQuery build() {
    return TrackFilterQuery(isLiveTv: true, limit: 20);
  }

  void changeTitle(String? query) {
    state = state.copyWith(title: query);
  }

  void changeGroupTitle(String? query) {
    state = state.copyWith(groupTitle: query);
  }

  void reset() {
    state = TrackFilterQuery(isLiveTv: true, limit: 20);
  }
}
