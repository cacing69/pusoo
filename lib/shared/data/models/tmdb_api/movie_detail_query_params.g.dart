// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_detail_query_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MovieDetailQueryParams _$MovieDetailQueryParamsFromJson(
  Map<String, dynamic> json,
) => _MovieDetailQueryParams(
  language: json['language'] as String? ?? "en-US",
  appendToResponse: json['append_to_response'] as String? ?? null,
);

Map<String, dynamic> _$MovieDetailQueryParamsToJson(
  _MovieDetailQueryParams instance,
) => <String, dynamic>{
  'language': instance.language,
  'append_to_response': instance.appendToResponse,
};
