import 'package:json_annotation/json_annotation.dart';

part 't_search_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class TSeaerchResponse<T> {
  final int? page;
  final T? data;

  @JsonKey(name: 'total_pages')
  final int? totalPages;

  @JsonKey(name: 'total_count')
  final int? totalCount;

  @JsonKey(name: 'per_page')
  final int? perPage;

  TSeaerchResponse({
    this.totalPages,
    this.totalCount,
    this.page,
    this.data,
    this.perPage,
  });

  factory TSeaerchResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) {
    return _$TSeaerchResponseFromJson(json, fromJsonT);
  }

  Map<String, dynamic> toJson(Object? Function(T value) toJsonT) =>
      _$TSeaerchResponseToJson(this, toJsonT);

  TSeaerchResponse<T> copyWith({
    int? page,
    T? data,
    int? totalPages,
    int? totalCount,
    int? perPage,
  }) {
    return TSeaerchResponse<T>(
      page: page ?? this.page,
      totalPages: totalPages ?? this.totalPages,
      totalCount: totalCount ?? this.totalCount,
      perPage: perPage ?? this.perPage,
      data: data ?? this.data,
    );
  }
}
