// GENERATED CODE - DO NOT MODIFY BY HAND

part of 't_tmdb_search_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TTMDBSearchResponse<T> _$TTMDBSearchResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) => TTMDBSearchResponse<T>(
  totalPages: (json['total_pages'] as num?)?.toInt(),
  totalResults: (json['total_results'] as num?)?.toInt(),
  page: (json['page'] as num?)?.toInt(),
  results: _$nullableGenericFromJson(json['results'], fromJsonT),
);

Map<String, dynamic> _$TTMDBSearchResponseToJson<T>(
  TTMDBSearchResponse<T> instance,
  Object? Function(T value) toJsonT,
) => <String, dynamic>{
  'page': instance.page,
  'results': _$nullableGenericToJson(instance.results, toJsonT),
  'total_pages': instance.totalPages,
  'total_results': instance.totalResults,
};

T? _$nullableGenericFromJson<T>(
  Object? input,
  T Function(Object? json) fromJson,
) => input == null ? null : fromJson(input);

Object? _$nullableGenericToJson<T>(
  T? input,
  Object? Function(T value) toJson,
) => input == null ? null : toJson(input);
