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
import 'package:pusoo/shared/domain/entities/open_subtitles/search_subtitle_query_params.dart';
import 'package:pusoo/shared/domain/entities/open_subtitles/subtitle.dart';
import 'package:pusoo/shared/domain/entities/open_subtitles/t_open_subtitle_search_response.dart';
import 'package:pusoo/shared/domain/repositories/open_subtitles/subtitle_repository.dart';

class SearchSubtitleUsecase
    implements
        UseCase<
          TOpenSubtitleSearchResponse<List<Subtitle>>,
          SearchSubtitleQueryParams
        > {
  final SubtitleRepository repository;
  final Logger logger;

  SearchSubtitleUsecase(this.repository, this.logger);

  @override
  Future<Either<Failure, TOpenSubtitleSearchResponse<List<Subtitle>>>> call(
    SearchSubtitleQueryParams params,
  ) async {
    try {
      return await repository.search(params);
    } catch (e) {
      return Left(UsecaseFailure(message: e.toString()));
    }
  }
}
