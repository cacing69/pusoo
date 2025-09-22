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


// import 'package:pusoo/features/source/data/datasource/source_drift_datasource_impl.dart';
// import 'package:pusoo/features/playlist/data/repository_impl/playlist_drift_repository_impl.dart';
// import 'package:pusoo/features/playlist/domain/usecases/get_active_playlist_usecase.dart';
// import 'package:pusoo/shared/presentation/providers/logger_provider.dart';
// import 'package:riverpod_annotation/riverpod_annotation.dart';

// part 'playlist_providers.g.dart';

// @riverpod
// PlaylistDriftDatasourceImpl playlistDriftDatasource(Ref ref) {
//   return PlaylistDriftDatasourceImpl(ref.read(loggerProvider));
// }

// @riverpod
// PlaylistDriftRepositoryImpl playlistDriftRepository(Ref ref) {
//   return PlaylistDriftRepositoryImpl(ref.read(playlistDriftDatasourceProvider));
// }

// // USE CASE
// @riverpod
// GetActivePlaylistUsecase getActivePlaylistUsecase(Ref ref) {
//   return GetActivePlaylistUsecase(
//     ref.read(playlistDriftRepositoryProvider),
//     ref.read(loggerProvider),
//   );
// }
