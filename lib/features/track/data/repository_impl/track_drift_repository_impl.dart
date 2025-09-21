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
import 'package:pusoo/features/track/data/datasources/local/track_datasource.dart';
import 'package:pusoo/features/track/domain/repostiory/track_repository.dart';
import 'package:pusoo/features/track/domain/models/track_filter_query.dart';
import 'package:pusoo/features/track/domain/models/track.dart';

class TrackDriftRepositoryImpl implements TrackRepository {
  final TrackDatasource _datasource;

  TrackDriftRepositoryImpl(this._datasource);

  @override
  Future<Either<Failure, List<Track>>> get(TrackFilterQuery? params) async {
    try {
      final result = await _datasource.get(params);
      return Right(result);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<String>>> getGroupTitle(
    TrackFilterQuery? params,
  ) async {
    try {
      final result = await _datasource.getGroupTitle(params);
      return Right(result);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, int>> count(TrackFilterQuery? params) async {
    try {
      final result = await _datasource.count(params);
      return Right(result);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }
}
