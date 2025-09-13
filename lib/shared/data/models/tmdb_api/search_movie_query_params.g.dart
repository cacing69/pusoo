// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_movie_query_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SearchMovieQueryParams _$SearchMovieQueryParamsFromJson(
  Map<String, dynamic> json,
) => _SearchMovieQueryParams(
  query: json['query'] as String? ?? "",
  language: json['language'] as String? ?? "en-US",
  page: (json['page'] as num?)?.toInt() ?? 1,
  region: json['region'] as String? ?? null,
  year: json['year'] as String? ?? null,
  includeAdult: json['include_adult'] as bool? ?? false,
  primaryReleaseYear: json['primary_release_year'] as String? ?? null,
);

Map<String, dynamic> _$SearchMovieQueryParamsToJson(
  _SearchMovieQueryParams instance,
) => <String, dynamic>{
  'query': instance.query,
  'language': instance.language,
  'page': instance.page,
  'region': instance.region,
  'year': instance.year,
  'include_adult': instance.includeAdult,
  'primary_release_year': instance.primaryReleaseYear,
};
