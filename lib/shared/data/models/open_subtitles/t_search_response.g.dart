// GENERATED CODE - DO NOT MODIFY BY HAND

part of 't_search_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TSeaerchResponse<T> _$TSeaerchResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) => TSeaerchResponse<T>(
  totalPages: (json['total_pages'] as num?)?.toInt(),
  totalCount: (json['total_count'] as num?)?.toInt(),
  page: (json['page'] as num?)?.toInt(),
  data: _$nullableGenericFromJson(json['data'], fromJsonT),
  perPage: (json['per_page'] as num?)?.toInt(),
);

Map<String, dynamic> _$TSeaerchResponseToJson<T>(
  TSeaerchResponse<T> instance,
  Object? Function(T value) toJsonT,
) => <String, dynamic>{
  'page': instance.page,
  'data': _$nullableGenericToJson(instance.data, toJsonT),
  'total_pages': instance.totalPages,
  'total_count': instance.totalCount,
  'per_page': instance.perPage,
};

T? _$nullableGenericFromJson<T>(
  Object? input,
  T Function(Object? json) fromJson,
) => input == null ? null : fromJson(input);

Object? _$nullableGenericToJson<T>(
  T? input,
  Object? Function(T value) toJson,
) => input == null ? null : toJson(input);
