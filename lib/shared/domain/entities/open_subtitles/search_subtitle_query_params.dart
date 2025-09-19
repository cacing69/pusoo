import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_subtitle_query_params.g.dart';
part 'search_subtitle_query_params.freezed.dart';

@freezed
abstract class SearchSubtitleQueryParams with _$SearchSubtitleQueryParams {
  const factory SearchSubtitleQueryParams({
    @JsonKey(name: "ai_translated") String? aiTranslated,
    @JsonKey(name: "episode_number") int? episodeNumber,
    @JsonKey(name: "foreign_parts_only") String? foreignPartsOnly,
    @JsonKey(name: "hearing_impaired") String? hearingImpaired,
    @JsonKey(name: "id") int? id,
    @JsonKey(name: "imdb_id") int? imdbId,
    String? languages,
    @JsonKey(name: "machine_translated") String? machineTranslated,
    String? moviehash,
    @JsonKey(name: "movie_hash_match") String? movieHashMatch,
    @JsonKey(name: "order_by") String? orderBy,
    @JsonKey(name: "order_direction") String? orderDirection,
    int? page,
    @JsonKey(name: "parent_feature_id") int? parentFeatureId,
    @JsonKey(name: "parent_imdb_id") int? parentImdbId,
    @JsonKey(name: "parent_tmdb_id") int? parentTmdbId,
    String? query,
    @JsonKey(name: "season_number") int? seasonNumber,
    @JsonKey(name: "tmdb_id") int? tmdbId,
    @JsonKey(name: "trusted_sources") String? trustedSources,
    String? type,
    @JsonKey(name: "uploader_id") int? uploaderId,
    int? year,
    @JsonKey(name: "User-Agent") String? userAgent,
  }) = _SearchSubtitleQueryParams;

  factory SearchSubtitleQueryParams.fromJson(Map<String, dynamic> json) =>
      _$SearchSubtitleQueryParamsFromJson(json);
}
