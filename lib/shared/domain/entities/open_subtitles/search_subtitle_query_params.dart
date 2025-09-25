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

part 'search_subtitle_query_params.g.dart';
part 'search_subtitle_query_params.freezed.dart';

@freezed
abstract class SearchSubtitleQueryParams with _$SearchSubtitleQueryParams {
  const factory SearchSubtitleQueryParams({
    @JsonKey(name: "ai_translated", includeIfNull: false) String? aiTranslated,
    @JsonKey(name: "episode_number", includeIfNull: false) int? episodeNumber,
    @JsonKey(name: "foreign_parts_only", includeIfNull: false)
    String? foreignPartsOnly,
    @JsonKey(name: "hearing_impaired", includeIfNull: false)
    String? hearingImpaired,
    @JsonKey(name: "id", includeIfNull: false) int? id,
    @JsonKey(name: "imdb_id", includeIfNull: false) int? imdbId,
    @JsonKey(includeIfNull: false) String? languages,
    @JsonKey(name: "machine_translated", includeIfNull: false)
    String? machineTranslated,
    @JsonKey(includeIfNull: false) String? moviehash,
    @JsonKey(name: "movie_hash_match", includeIfNull: false)
    String? movieHashMatch,
    @JsonKey(name: "order_by", includeIfNull: false) String? orderBy,
    @JsonKey(name: "order_direction", includeIfNull: false)
    String? orderDirection,
    @Default(1) int page,
    @JsonKey(name: "parent_feature_id", includeIfNull: false)
    int? parentFeatureId,
    @JsonKey(name: "parent_imdb_id", includeIfNull: false) int? parentImdbId,
    @JsonKey(name: "parent_tmdb_id", includeIfNull: false) int? parentTmdbId,
    @JsonKey(includeIfNull: false) String? query,
    @JsonKey(name: "season_number", includeIfNull: false) int? seasonNumber,
    @JsonKey(name: "tmdb_id", includeIfNull: false) int? tmdbId,
    @JsonKey(name: "trusted_sources", includeIfNull: false)
    String? trustedSources,
    @JsonKey(includeIfNull: false) String? type,
    @JsonKey(name: "uploader_id", includeIfNull: false) int? uploaderId,
    @JsonKey(includeIfNull: false) int? year,
  }) = _SearchSubtitleQueryParams;

  factory SearchSubtitleQueryParams.fromJson(Map<String, dynamic> json) =>
      _$SearchSubtitleQueryParamsFromJson(json);
}
