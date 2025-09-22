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
import 'package:pusoo/shared/domain/entities/tmdb_api/movie_credits_query_params.dart';
import 'package:pusoo/shared/domain/entities/tmdb_api/movie_credits_response.dart';
import 'package:pusoo/shared/domain/entities/tmdb_api/movie_details_query_params.dart';
import 'package:pusoo/shared/domain/entities/tmdb_api/movie_details_response.dart';
import 'package:pusoo/shared/domain/entities/tmdb_api/movie_videos_query_params.dart';
import 'package:pusoo/shared/domain/entities/tmdb_api/movie_videos_response.dart';

abstract class MoviesRepository {
  Future<Either<Failure, MovieDetailsResponse>> details(
    String movieId,
    MovieDetailsQueryParams queryParams,
  );

  Future<Either<Failure, MovieCreditsResponse>> credits(
    String movieId,
    MovieCreditsQueryParams queryParams,
  );

  Future<Either<Failure, MovieVideosResponse>> videos(
    String movieId,
    MovieVideosQueryParams queryParams,
  );
}
