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
