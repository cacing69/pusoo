// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_videos_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MovieVideosResponse _$MovieVideosResponseFromJson(Map<String, dynamic> json) =>
    _MovieVideosResponse(
      id: (json['id'] as num?)?.toInt() ?? 0,
      results:
          (json['results'] as List<dynamic>?)
              ?.map((e) => MovieVideo.fromJson(e as Map<String, dynamic>))
              .toList() ??
          null,
    );

Map<String, dynamic> _$MovieVideosResponseToJson(
  _MovieVideosResponse instance,
) => <String, dynamic>{'id': instance.id, 'results': instance.results};
