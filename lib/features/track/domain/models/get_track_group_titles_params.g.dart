// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_track_group_titles_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GetTrackGroupTitlesParams _$GetTrackGroupTitlesParamsFromJson(
  Map<String, dynamic> json,
) => _GetTrackGroupTitlesParams(
  playlistIds: (json['playlistIds'] as List<dynamic>?)
      ?.map((e) => (e as num).toInt())
      .toList(),
  isMovie: json['isMovie'] as bool?,
  isLiveTv: json['isLiveTv'] as bool?,
  isTvSerie: json['isTvSerie'] as bool?,
);

Map<String, dynamic> _$GetTrackGroupTitlesParamsToJson(
  _GetTrackGroupTitlesParams instance,
) => <String, dynamic>{
  'playlistIds': instance.playlistIds,
  'isMovie': instance.isMovie,
  'isLiveTv': instance.isLiveTv,
  'isTvSerie': instance.isTvSerie,
};
