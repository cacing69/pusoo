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


import 'package:json_annotation/json_annotation.dart';

part 't_open_subtitle_search_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class TOpenSubtitleSearchResponse<T> {
  final int? page;
  final T? data;

  @JsonKey(name: 'total_pages')
  final int? totalPages;

  @JsonKey(name: 'total_count')
  final int? totalCount;

  @JsonKey(name: 'per_page')
  final int? perPage;

  TOpenSubtitleSearchResponse({
    this.totalPages,
    this.totalCount,
    this.page,
    this.data,
    this.perPage,
  });

  factory TOpenSubtitleSearchResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) {
    return _$TOpenSubtitleSearchResponseFromJson(json, fromJsonT);
  }

  Map<String, dynamic> toJson(Object? Function(T value) toJsonT) =>
      _$TOpenSubtitleSearchResponseToJson(this, toJsonT);

  TOpenSubtitleSearchResponse<T> copyWith({
    int? page,
    T? data,
    int? totalPages,
    int? totalCount,
    int? perPage,
  }) {
    return TOpenSubtitleSearchResponse<T>(
      page: page ?? this.page,
      totalPages: totalPages ?? this.totalPages,
      totalCount: totalCount ?? this.totalCount,
      perPage: perPage ?? this.perPage,
      data: data ?? this.data,
    );
  }
}
