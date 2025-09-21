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


import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pusoo/shared/domain/entities/tmdb_api/movie_cast.dart';
import 'package:pusoo/shared/domain/entities/tmdb_api/movie_crew.dart';

part 'movie_credits_response.g.dart';
part 'movie_credits_response.freezed.dart';

@freezed
abstract class MovieCreditsResponse with _$MovieCreditsResponse {
  const factory MovieCreditsResponse({
    @Default(0) int? id,
    @Default(null) List<MovieCast>? casts,
    @Default(null) List<MovieCrew>? crew,
  }) = _MovieCreditsResponse;

  factory MovieCreditsResponse.fromJson(Map<String, dynamic> json) =>
      _$MovieCreditsResponseFromJson(json);
}
