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
import 'package:pusoo/shared/errors/failure.dart';
import 'package:pusoo/shared/utils/usecase.dart';
import 'package:pusoo/features/track/domain/models/track_filter_query.dart';
import 'package:pusoo/features/track/domain/repostiory/track_repository.dart';
import 'package:pusoo/features/track/domain/models/track.dart';

class GetTracksUsecase implements UseCase<List<Track>, TrackFilterQuery> {
  final TrackRepository _repository;
  final Logger _log;

  GetTracksUsecase(this._repository, this._log);

  @override
  Future<Either<Failure, List<Track>>> call(TrackFilterQuery? params) async {
    _log.i("GetTracksUsecase:_repository.getTvTracks");
    _log.i(params);

    final result = await _repository.get(params);

    result.fold(
      (failure) {
        // Skenario 1: Operasi GAGAL
        // `failure` adalah objek Failure
        _log.e("GetTracksUsecase: Failed with error: ${failure.toString()}");
        // Kamu bisa log properti spesifik dari Failure, misal:
        // _log.e("Error message: ${failure.message}");
      },
      (tracks) {
        // Skenario 2: Operasi SUKSES
        // `tracks` adalah List<Track>
        _log.i(
          "GetTracksUsecase: Successfully fetched ${tracks.length} tracks.",
        );
        // Kamu bisa log data spesifik, misal:
        // _log.d("First track name: ${tracks.first.name}");
      },
    );

    return result;
  }
}
