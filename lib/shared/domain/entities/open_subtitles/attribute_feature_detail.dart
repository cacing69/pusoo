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


import 'package:freezed_annotation/freezed_annotation.dart';

part 'attribute_feature_detail.g.dart';
part 'attribute_feature_detail.freezed.dart';

@freezed
abstract class AttributeFeatureDetail with _$AttributeFeatureDetail {
  const factory AttributeFeatureDetail({
    @JsonKey(name: "feature_id") int? featureId,
    @JsonKey(name: "feature_type") String? featureType,
    int? year,
    String? title,
    @JsonKey(name: "movie_name") String? movieName,
    @JsonKey(name: "imdb_id") int? imdbId,
    @JsonKey(name: "tmdb_id") int? tmdbId,
    @JsonKey(name: "season_number") int? seasonNumber,
    @JsonKey(name: "episode_number") int? episodeNumber,
    @JsonKey(name: "parent_imdb_id") int? parentImdbId,
    @JsonKey(name: "parent_title") String? parentTitle,
    @JsonKey(name: "parent_tmdb_id") int? parentTmdbId,
    @JsonKey(name: "parent_feature_id") int? parentFeatureId,
  }) = _AttributeFeatureDetail;

  factory AttributeFeatureDetail.fromJson(Map<String, dynamic> json) =>
      _$AttributeFeatureDetailFromJson(json);
}
