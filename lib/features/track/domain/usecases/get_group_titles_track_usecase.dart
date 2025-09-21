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
import 'package:logger/logger.dart';
import 'package:pusoo/core/errors/failure.dart';
import 'package:pusoo/core/utils/usecase.dart';
import 'package:pusoo/features/track/domain/models/track_filter_query.dart';
import 'package:pusoo/features/track/domain/repostiory/track_repository.dart';

class GetGroupTitlesTrackUsecase
    implements UseCase<List<String>, TrackFilterQuery> {
  final TrackRepository _repository;
  final Logger _log;

  GetGroupTitlesTrackUsecase(this._repository, this._log);

  @override
  Future<Either<Failure, List<String>>> call(TrackFilterQuery? params) async {
    _log.i(params);

    final result = await _repository.getGroupTitle(params);

    return result;
  }
}
