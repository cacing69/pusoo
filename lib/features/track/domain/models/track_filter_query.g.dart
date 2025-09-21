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

part of 'track_filter_query.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TrackFilterQuery _$TrackFilterQueryFromJson(Map<String, dynamic> json) =>
    _TrackFilterQuery(
      playlistIds: (json['playlistIds'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList(),
      groupTitle: json['groupTitle'] as String?,
      title: json['title'] as String?,
      titleOrGroupTitle: json['titleOrGroupTitle'] as String?,
      limit: (json['limit'] as num?)?.toInt(),
      offset: (json['offset'] as num?)?.toInt(),
      cursor: (json['cursor'] as num?)?.toInt(),
      isMovie: json['isMovie'] as bool?,
      isLiveTv: json['isLiveTv'] as bool?,
      isTvSerie: json['isTvSerie'] as bool?,
    );

Map<String, dynamic> _$TrackFilterQueryToJson(_TrackFilterQuery instance) =>
    <String, dynamic>{
      'playlistIds': instance.playlistIds,
      'groupTitle': instance.groupTitle,
      'title': instance.title,
      'titleOrGroupTitle': instance.titleOrGroupTitle,
      'limit': instance.limit,
      'offset': instance.offset,
      'cursor': instance.cursor,
      'isMovie': instance.isMovie,
      'isLiveTv': instance.isLiveTv,
      'isTvSerie': instance.isTvSerie,
    };
