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


import 'package:pusoo/features/track/data/datasources/local/track_drift_datasource_impl.dart';
import 'package:pusoo/features/track/data/repository_impl/track_drift_repository_impl.dart';
import 'package:pusoo/features/track/domain/usecases/count_track_usecase.dart';
import 'package:pusoo/features/track/domain/usecases/get_group_titles_track_usecase.dart';
import 'package:pusoo/features/track/domain/usecases/get_tracks_usecase.dart';
import 'package:pusoo/features/track/domain/usecases/refresh_all_track_usecase.dart';
import 'package:pusoo/shared/presentation/providers/logger_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'track_providers.g.dart';

@riverpod
TrackDriftDatasourceImpl trackDriftDatasource(Ref ref) {
  return TrackDriftDatasourceImpl(ref.read(loggerProvider));
}

@riverpod
TrackDriftRepositoryImpl trackDriftRepository(Ref ref) {
  return TrackDriftRepositoryImpl(ref.read(trackDriftDatasourceProvider));
}

// USE CASE
@riverpod
GetTracksUsecase getTracksUsecase(Ref ref) {
  return GetTracksUsecase(
    ref.read(trackDriftRepositoryProvider),
    ref.read(loggerProvider),
  );
}

@riverpod
GetGroupTitlesTrackUsecase getGroupTitlesTrackUsecase(Ref ref) {
  return GetGroupTitlesTrackUsecase(
    ref.read(trackDriftRepositoryProvider),
    ref.read(loggerProvider),
  );
}

@riverpod
CountTrackUsecase countTrackUsecase(Ref ref) {
  return CountTrackUsecase(
    ref.read(trackDriftRepositoryProvider),
    ref.read(loggerProvider),
  );
}

@riverpod
RefreshAllTrackUsecase refreshAllTrackUsecase(Ref ref) {
  return RefreshAllTrackUsecase(ref);
}
