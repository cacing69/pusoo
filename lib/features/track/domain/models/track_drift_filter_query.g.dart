// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'track_drift_filter_query.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TrackDriftFilterQuery _$TrackDriftFilterQueryFromJson(
  Map<String, dynamic> json,
) => _TrackDriftFilterQuery(
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

Map<String, dynamic> _$TrackDriftFilterQueryToJson(
  _TrackDriftFilterQuery instance,
) => <String, dynamic>{
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
