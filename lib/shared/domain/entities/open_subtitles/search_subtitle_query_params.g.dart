// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_subtitle_query_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SearchSubtitleQueryParams _$SearchSubtitleQueryParamsFromJson(
  Map<String, dynamic> json,
) => _SearchSubtitleQueryParams(
  aiTranslated: json['ai_translated'] as String?,
  episodeNumber: (json['episode_number'] as num?)?.toInt(),
  foreignPartsOnly: json['foreign_parts_only'] as String?,
  hearingImpaired: json['hearing_impaired'] as String?,
  id: (json['id'] as num?)?.toInt(),
  imdbId: (json['imdb_id'] as num?)?.toInt(),
  languages: json['languages'] as String?,
  machineTranslated: json['machine_translated'] as String?,
  moviehash: json['moviehash'] as String?,
  movieHashMatch: json['movie_hash_match'] as String?,
  orderBy: json['order_by'] as String?,
  orderDirection: json['order_direction'] as String?,
  page: (json['page'] as num?)?.toInt() ?? 1,
  parentFeatureId: (json['parent_feature_id'] as num?)?.toInt(),
  parentImdbId: (json['parent_imdb_id'] as num?)?.toInt(),
  parentTmdbId: (json['parent_tmdb_id'] as num?)?.toInt(),
  query: json['query'] as String?,
  seasonNumber: (json['season_number'] as num?)?.toInt(),
  tmdbId: (json['tmdb_id'] as num?)?.toInt(),
  trustedSources: json['trusted_sources'] as String?,
  type: json['type'] as String?,
  uploaderId: (json['uploader_id'] as num?)?.toInt(),
  year: (json['year'] as num?)?.toInt(),
  userAgent: json['User-Agent'] as String? ?? "Pusoo v1.0.0",
);

Map<String, dynamic> _$SearchSubtitleQueryParamsToJson(
  _SearchSubtitleQueryParams instance,
) => <String, dynamic>{
  'ai_translated': instance.aiTranslated,
  'episode_number': instance.episodeNumber,
  'foreign_parts_only': instance.foreignPartsOnly,
  'hearing_impaired': instance.hearingImpaired,
  'id': instance.id,
  'imdb_id': instance.imdbId,
  'languages': instance.languages,
  'machine_translated': instance.machineTranslated,
  'moviehash': instance.moviehash,
  'movie_hash_match': instance.movieHashMatch,
  'order_by': instance.orderBy,
  'order_direction': instance.orderDirection,
  'page': instance.page,
  'parent_feature_id': instance.parentFeatureId,
  'parent_imdb_id': instance.parentImdbId,
  'parent_tmdb_id': instance.parentTmdbId,
  'query': instance.query,
  'season_number': instance.seasonNumber,
  'tmdb_id': instance.tmdbId,
  'trusted_sources': instance.trustedSources,
  'type': instance.type,
  'uploader_id': instance.uploaderId,
  'year': instance.year,
  'User-Agent': instance.userAgent,
};
