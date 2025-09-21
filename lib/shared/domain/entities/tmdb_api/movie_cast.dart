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

part 'movie_cast.g.dart';
part 'movie_cast.freezed.dart';

@freezed
abstract class MovieCast with _$MovieCast {
  const factory MovieCast({
    @Default(true) bool adult,
    @Default(0) int gender,
    @Default(0) int id,
    @Default(null)
    @JsonKey(name: "known_for_department")
    String? knownForDepartment,
    @Default(null) String? name,
    @JsonKey(name: "original_name") String? originalName,
    @Default(0) double popularity,
    @JsonKey(name: "profile_path") String? profilePath,
    @Default(0) @JsonKey(name: "cast_id") int castId,
    @Default(null) String? character,
    @JsonKey(name: "credit_id") String? creditId,
    @Default(0) int order,
  }) = _MovieCast;

  factory MovieCast.fromJson(Map<String, dynamic> json) =>
      _$MovieCastFromJson(json);
}
