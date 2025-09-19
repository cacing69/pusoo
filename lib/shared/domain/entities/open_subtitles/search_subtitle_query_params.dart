import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_subtitle_query_params.g.dart';
part 'search_subtitle_query_params.freezed.dart';

@freezed
abstract class SearchSubtitleQueryParams with _$SearchSubtitleQueryParams {
  const factory SearchSubtitleQueryParams({
    @JsonKey(name: "ai_translated", includeIfNull: false) String? aiTranslated,
    @JsonKey(name: "episode_number", includeIfNull: false) int? episodeNumber,
    @JsonKey(name: "foreign_parts_only", includeIfNull: false) String? foreignPartsOnly,
    @JsonKey(name: "hearing_impaired", includeIfNull: false) String? hearingImpaired,
    @JsonKey(name: "id", includeIfNull: false) int? id,
    @JsonKey(name: "imdb_id", includeIfNull: false) int? imdbId,
    @JsonKey(includeIfNull: false) String? languages,
    @JsonKey(name: "machine_translated", includeIfNull: false) String? machineTranslated,
    @JsonKey(includeIfNull: false) String? moviehash,
    @JsonKey(name: "movie_hash_match", includeIfNull: false) String? movieHashMatch,
    @JsonKey(name: "order_by", includeIfNull: false) String? orderBy,
    @JsonKey(name: "order_direction", includeIfNull: false) String? orderDirection,
    @Default(1) int page,
    @JsonKey(name: "parent_feature_id", includeIfNull: false) int? parentFeatureId,
    @JsonKey(name: "parent_imdb_id", includeIfNull: false) int? parentImdbId,
    @JsonKey(name: "parent_tmdb_id", includeIfNull: false) int? parentTmdbId,
    @JsonKey(includeIfNull: false) String? query,
    @JsonKey(name: "season_number", includeIfNull: false) int? seasonNumber,
    @JsonKey(name: "tmdb_id", includeIfNull: false) int? tmdbId,
    @JsonKey(name: "trusted_sources", includeIfNull: false) String? trustedSources,
    @JsonKey(includeIfNull: false) String? type,
    @JsonKey(name: "uploader_id", includeIfNull: false) int? uploaderId,
    @JsonKey(includeIfNull: false) int? year,
    @JsonKey(name: "User-Agent") @Default("Pusoo v1.0.0") String userAgent,
  }) = _SearchSubtitleQueryParams;

  factory SearchSubtitleQueryParams.fromJson(Map<String, dynamic> json) =>
      _$SearchSubtitleQueryParamsFromJson(json);
}
