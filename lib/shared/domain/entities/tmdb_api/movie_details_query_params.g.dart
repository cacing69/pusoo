// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_details_query_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MovieDetailsQueryParams _$MovieDetailsQueryParamsFromJson(
  Map<String, dynamic> json,
) => _MovieDetailsQueryParams(
  language: json['language'] as String? ?? "en-US",
  appendToResponse: json['append_to_response'] as String? ?? null,
);

Map<String, dynamic> _$MovieDetailsQueryParamsToJson(
  _MovieDetailsQueryParams instance,
) => <String, dynamic>{
  'language': instance.language,
  'append_to_response': instance.appendToResponse,
};
