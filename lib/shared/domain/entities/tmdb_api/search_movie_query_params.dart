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

part 'search_movie_query_params.g.dart';
part 'search_movie_query_params.freezed.dart';

@freezed
abstract class SearchMovieQueryParams with _$SearchMovieQueryParams {
  const factory SearchMovieQueryParams({
    @Default("") String query,
    @Default("en-US") String language,
    @Default(1) int page,
    @Default(null) String? region,
    @Default(null) String? year,
    @Default(false) @JsonKey(name: 'include_adult') bool includeAdult,
    @Default(null)
    @JsonKey(name: 'primary_release_year')
    String? primaryReleaseYear,
  }) = _SearchMovieQueryParams;

  factory SearchMovieQueryParams.fromJson(Map<String, dynamic> json) =>
      _$SearchMovieQueryParamsFromJson(json);
}
