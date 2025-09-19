// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attribute_feature_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AttributeFeatureDetail _$AttributeFeatureDetailFromJson(
  Map<String, dynamic> json,
) => _AttributeFeatureDetail(
  featureId: (json['feature_id'] as num?)?.toInt(),
  featureType: json['feature_type'] as String?,
  year: (json['year'] as num?)?.toInt(),
  title: json['title'] as String?,
  movieName: json['movie_name'] as String?,
  imdbId: (json['imdb_id'] as num?)?.toInt(),
  tmdbId: (json['tmdb_id'] as num?)?.toInt(),
  seasonNumber: (json['season_number'] as num?)?.toInt(),
  episodeNumber: (json['episode_number'] as num?)?.toInt(),
  parentImdbId: (json['parent_imdb_id'] as num?)?.toInt(),
  parentTitle: json['parent_title'] as String?,
  parentTmdbId: (json['parent_tmdb_id'] as num?)?.toInt(),
  parentFeatureId: (json['parent_feature_id'] as num?)?.toInt(),
);

Map<String, dynamic> _$AttributeFeatureDetailToJson(
  _AttributeFeatureDetail instance,
) => <String, dynamic>{
  'feature_id': instance.featureId,
  'feature_type': instance.featureType,
  'year': instance.year,
  'title': instance.title,
  'movie_name': instance.movieName,
  'imdb_id': instance.imdbId,
  'tmdb_id': instance.tmdbId,
  'season_number': instance.seasonNumber,
  'episode_number': instance.episodeNumber,
  'parent_imdb_id': instance.parentImdbId,
  'parent_title': instance.parentTitle,
  'parent_tmdb_id': instance.parentTmdbId,
  'parent_feature_id': instance.parentFeatureId,
};
