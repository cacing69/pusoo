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

part of 'track.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Track _$TrackFromJson(Map<String, dynamic> json) => _Track(
  id: (json['id'] as num?)?.toInt() ?? 0,
  title: json['title'] as String? ?? "",
  contentType: json['contentType'] as String? ?? "unknown",
  links:
      (json['links'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
  groupTitle: json['groupTitle'] as String? ?? "",
  imdbId: json['imdbId'] as String? ?? "",
  tvgId: json['tvgId'] as String? ?? "",
  tvgName: json['tvgName'] as String? ?? "",
  desc: json['desc'] as String? ?? "",
  tvgLogo: json['tvgLogo'] as String? ?? "",
  source: json['source'] == null
      ? null
      : Source.fromJson(json['source'] as Map<String, dynamic>),
  duration: (json['duration'] as num?)?.toInt() ?? 0,
  isNsfw: json['isNsfw'] as bool? ?? false,
  extXMedias:
      (json['extXMedias'] as List<dynamic>?)
          ?.map((e) => ExtXMedia.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  isMovie: json['isMovie'] as bool? ?? false,
  isLiveTv: json['isLiveTv'] as bool? ?? false,
  isTvSerie: json['isTvSerie'] as bool? ?? false,
  attributes:
      (json['attributes'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String),
      ) ??
      const {},
  extVlcOpts:
      (json['extVlcOpts'] as List<dynamic>?)
          ?.map((e) => Map<String, String>.from(e as Map))
          .toList() ??
      const [],
  kodiProps:
      (json['kodiProps'] as List<dynamic>?)
          ?.map((e) => Map<String, String>.from(e as Map))
          .toList() ??
      const [],
  httpHeaders:
      (json['httpHeaders'] as List<dynamic>?)
          ?.map((e) => Map<String, String>.from(e as Map))
          .toList() ??
      const [],
);

Map<String, dynamic> _$TrackToJson(_Track instance) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'contentType': instance.contentType,
  'links': instance.links,
  'groupTitle': instance.groupTitle,
  'imdbId': instance.imdbId,
  'tvgId': instance.tvgId,
  'tvgName': instance.tvgName,
  'desc': instance.desc,
  'tvgLogo': instance.tvgLogo,
  'source': instance.source,
  'duration': instance.duration,
  'isNsfw': instance.isNsfw,
  'extXMedias': instance.extXMedias,
  'isMovie': instance.isMovie,
  'isLiveTv': instance.isLiveTv,
  'isTvSerie': instance.isTvSerie,
  'attributes': instance.attributes,
  'extVlcOpts': instance.extVlcOpts,
  'kodiProps': instance.kodiProps,
  'httpHeaders': instance.httpHeaders,
};
