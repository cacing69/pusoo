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
