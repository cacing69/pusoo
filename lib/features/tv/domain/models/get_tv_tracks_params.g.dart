// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_tv_tracks_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GetTvTracksParams _$GetTvTracksParamsFromJson(Map<String, dynamic> json) =>
    _GetTvTracksParams(
      playlistIds: (json['playlistIds'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList(),
      category: json['category'] as String?,
      title: json['title'] as String?,
      limit: (json['limit'] as num?)?.toInt(),
      offset: (json['offset'] as num?)?.toInt(),
      cursor: (json['cursor'] as num?)?.toInt(),
    );

Map<String, dynamic> _$GetTvTracksParamsToJson(_GetTvTracksParams instance) =>
    <String, dynamic>{
      'playlistIds': instance.playlistIds,
      'category': instance.category,
      'title': instance.title,
      'limit': instance.limit,
      'offset': instance.offset,
      'cursor': instance.cursor,
    };
