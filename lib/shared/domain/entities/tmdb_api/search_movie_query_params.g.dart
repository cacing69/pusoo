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

part of 'search_movie_query_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SearchMovieQueryParams _$SearchMovieQueryParamsFromJson(
  Map<String, dynamic> json,
) => _SearchMovieQueryParams(
  query: json['query'] as String? ?? "",
  language: json['language'] as String? ?? "en-US",
  page: (json['page'] as num?)?.toInt() ?? 1,
  region: json['region'] as String? ?? null,
  year: json['year'] as String? ?? null,
  includeAdult: json['include_adult'] as bool? ?? false,
  primaryReleaseYear: json['primary_release_year'] as String? ?? null,
);

Map<String, dynamic> _$SearchMovieQueryParamsToJson(
  _SearchMovieQueryParams instance,
) => <String, dynamic>{
  'query': instance.query,
  'language': instance.language,
  'page': instance.page,
  'region': instance.region,
  'year': instance.year,
  'include_adult': instance.includeAdult,
  'primary_release_year': instance.primaryReleaseYear,
};
