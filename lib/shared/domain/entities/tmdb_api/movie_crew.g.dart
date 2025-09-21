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


// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_crew.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MovieCrew _$MovieCrewFromJson(Map<String, dynamic> json) => _MovieCrew(
  adult: json['adult'] as bool? ?? true,
  gender: (json['gender'] as num?)?.toInt() ?? 0,
  id: (json['id'] as num?)?.toInt() ?? 0,
  knownForDepartment: json['known_for_department'] as String? ?? null,
  name: json['name'] as String? ?? null,
  originalName: json['original_name'] as String?,
  popularity: (json['popularity'] as num?)?.toDouble() ?? 0,
  profilePath: json['profile_path'] as String?,
  creditId: json['credit_id'] as String?,
  department: json['department'] as String? ?? null,
  job: json['job'] as String? ?? null,
);

Map<String, dynamic> _$MovieCrewToJson(_MovieCrew instance) =>
    <String, dynamic>{
      'adult': instance.adult,
      'gender': instance.gender,
      'id': instance.id,
      'known_for_department': instance.knownForDepartment,
      'name': instance.name,
      'original_name': instance.originalName,
      'popularity': instance.popularity,
      'profile_path': instance.profilePath,
      'credit_id': instance.creditId,
      'department': instance.department,
      'job': instance.job,
    };
