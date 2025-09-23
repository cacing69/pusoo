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
import 'package:pusoo/features/source/domain/entities/source.dart';
import 'package:pusoo/features/source/domain/repository/source_repository.dart';

class GetActiveSourceUsecase implements UseCase<Source, NoParams> {
  final SourceRepository _repository;
  final Logger _log;

  GetActiveSourceUsecase(this._repository, this._log);

  @override
  Future<Either<Failure, Source>> call(NoParams? params) async {
    _log.i("GetActiveSourceUsecase:_repository.getTvTracks");
    _log.i(params);

    final result = await _repository.getActive();

    result.fold(
      (failure) {
        // Skenario 1: Operasi GAGAL
        _log.e("GetActiveSourceUsecase: Failed with error: ${failure.message}");
      },
      (tracks) {
        // Skenario 2: Operasi SUKSES
        _log.i("GetActiveSourceUsecase: Successfully fetched");
      },
    );

    return result;
  }
}
