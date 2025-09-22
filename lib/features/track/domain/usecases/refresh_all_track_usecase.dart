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


import 'package:dartz/dartz.dart';
import 'package:pusoo/core/errors/failure.dart';
import 'package:pusoo/core/utils/usecase.dart';
import 'package:pusoo/features/track/domain/models/track_filter_query.dart';
import 'package:pusoo/features/tv/presentation/providers/tv_track_count_notifier.dart';
import 'package:pusoo/features/tv/presentation/providers/tv_track_group_titles_notifier.dart';
import 'package:pusoo/features/tv/presentation/providers/tv_tracks_filter_notifier.dart';
import 'package:pusoo/features/tv/presentation/providers/tv_tracks_paging_notifier.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

class RefreshAllTrackUsecase implements UseCase<void, NoParams> {
  final Ref ref;

  RefreshAllTrackUsecase(this.ref);

  @override
  Future<Either<Failure, void>> call(NoParams? params) async {
    // REFRESH HOME

    // TV
    ref
        .read(tvTrackGroupTitlesProvider.notifier)
        .perform(TrackFilterQuery(isLiveTv: true));

    ref
        .read(tvTrackCountProvider.notifier)
        .perform(TrackFilterQuery(isLiveTv: true));

    ref.read(tvTracksFilterProvider.notifier).reset();
    ref.read(tvTracksPagingProvider).refresh();

    // MOVIE

    // SERIES

    return Right(null);
  }
}
