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

part 'movie_crew.g.dart';
part 'movie_crew.freezed.dart';

@freezed
abstract class MovieCrew with _$MovieCrew {
  const factory MovieCrew({
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
    @JsonKey(name: "credit_id") String? creditId,
    @Default(null) String? department,
    @Default(null) String? job,
  }) = _MovieCrew;

  factory MovieCrew.fromJson(Map<String, dynamic> json) =>
      _$MovieCrewFromJson(json);
}
