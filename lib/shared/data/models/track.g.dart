// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'track.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Track _$TrackFromJson(Map<String, dynamic> json) => _Track(
  id: (json['id'] as num?)?.toInt() ?? 0,
  title: json['title'] as String? ?? "",
  contentType:
      $enumDecodeNullable(_$ContentTypeEnumMap, json['contentType']) ??
      ContentType.unknown,
  links:
      (json['links'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
  groupTitle: json['groupTitle'] as String? ?? "",
  imdbId: json['imdbId'] as String? ?? "",
  tvgId: json['tvgId'] as String? ?? "",
  tvgName: json['tvgName'] as String? ?? "",
  tvgLogo: json['tvgLogo'] as String? ?? "",
  duration: (json['duration'] as num?)?.toInt() ?? 0,
  isNsfw: json['isNsfw'] as bool? ?? false,
  isVod: json['isVod'] as bool? ?? false,
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
  'contentType': _$ContentTypeEnumMap[instance.contentType]!,
  'links': instance.links,
  'groupTitle': instance.groupTitle,
  'imdbId': instance.imdbId,
  'tvgId': instance.tvgId,
  'tvgName': instance.tvgName,
  'tvgLogo': instance.tvgLogo,
  'duration': instance.duration,
  'isNsfw': instance.isNsfw,
  'isVod': instance.isVod,
  'isLiveTv': instance.isLiveTv,
  'isTvSerie': instance.isTvSerie,
  'attributes': instance.attributes,
  'extVlcOpts': instance.extVlcOpts,
  'kodiProps': instance.kodiProps,
  'httpHeaders': instance.httpHeaders,
};

const _$ContentTypeEnumMap = {
  ContentType.unknown: 'unknown',
  ContentType.live: 'live',
  ContentType.vod: 'vod',
  ContentType.series: 'series',
  ContentType.audio: 'audio',
};
