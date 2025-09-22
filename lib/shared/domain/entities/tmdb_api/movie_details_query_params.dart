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

part 'movie_details_query_params.g.dart';
part 'movie_details_query_params.freezed.dart';

@freezed
abstract class MovieDetailsQueryParams with _$MovieDetailsQueryParams {
  const factory MovieDetailsQueryParams({
    @Default("en-US") String? language,
    @Default(null)
    @JsonKey(name: "append_to_response")
    String? appendToResponse,
  }) = _MovieDetailsQueryParams;

  factory MovieDetailsQueryParams.fromJson(Map<String, dynamic> json) =>
      _$MovieDetailsQueryParamsFromJson(json);
}
