// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'm3u_track.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_M3UTrack _$M3UTrackFromJson(Map<String, dynamic> json) => _M3UTrack(
  title: json['title'] as String? ?? "",
  links:
      (json['links'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
  duration: json['duration'] as String? ?? "",
  attributes:
      (json['attributes'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String),
      ) ??
      const {},
  extVlcOpt:
      (json['extVlcOpt'] as List<dynamic>?)
          ?.map((e) => Map<String, String>.from(e as Map))
          .toList() ??
      const [],
  kodiProp:
      (json['kodiProp'] as List<dynamic>?)
          ?.map((e) => Map<String, String>.from(e as Map))
          .toList() ??
      const [],
  httpHeaders:
      (json['httpHeaders'] as List<dynamic>?)
          ?.map((e) => Map<String, String>.from(e as Map))
          .toList() ??
      const [],
);

Map<String, dynamic> _$M3UTrackToJson(_M3UTrack instance) => <String, dynamic>{
  'title': instance.title,
  'links': instance.links,
  'duration': instance.duration,
  'attributes': instance.attributes,
  'extVlcOpt': instance.extVlcOpt,
  'kodiProp': instance.kodiProp,
  'httpHeaders': instance.httpHeaders,
};
