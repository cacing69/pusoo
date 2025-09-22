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

part of 'movie_video.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MovieVideo _$MovieVideoFromJson(Map<String, dynamic> json) => _MovieVideo(
  iso6391: json['iso_639_1'] as String?,
  iso31661: json['iso_3166_1'] as String?,
  name: json['name'] as String? ?? null,
  key: json['key'] as String? ?? null,
  site: json['site'] as String? ?? null,
  size: (json['size'] as num?)?.toInt() ?? null,
  type: json['type'] as String? ?? null,
  oficial: json['oficial'] as bool? ?? false,
  publishedAt: json['published_at'] as String?,
);

Map<String, dynamic> _$MovieVideoToJson(_MovieVideo instance) =>
    <String, dynamic>{
      'iso_639_1': instance.iso6391,
      'iso_3166_1': instance.iso31661,
      'name': instance.name,
      'key': instance.key,
      'site': instance.site,
      'size': instance.size,
      'type': instance.type,
      'oficial': instance.oficial,
      'published_at': instance.publishedAt,
    };
