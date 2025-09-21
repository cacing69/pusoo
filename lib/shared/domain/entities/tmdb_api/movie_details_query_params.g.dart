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

part of 'movie_details_query_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MovieDetailsQueryParams _$MovieDetailsQueryParamsFromJson(
  Map<String, dynamic> json,
) => _MovieDetailsQueryParams(
  language: json['language'] as String? ?? "en-US",
  appendToResponse: json['append_to_response'] as String? ?? null,
);

Map<String, dynamic> _$MovieDetailsQueryParamsToJson(
  _MovieDetailsQueryParams instance,
) => <String, dynamic>{
  'language': instance.language,
  'append_to_response': instance.appendToResponse,
};
