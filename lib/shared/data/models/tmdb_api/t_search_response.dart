import 'package:json_annotation/json_annotation.dart';

part 't_search_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class TSeaerchResponse<T> {
  final int? page;
  final T? results;

  @JsonKey(name: 'total_pages')
  final int? totalPages;

  @JsonKey(name: 'total_results')
  final int? totalResults;

  TSeaerchResponse({
    this.totalPages,
    this.totalResults,
    this.page,
    this.results,
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
    T? results,
    int? totalPages,
    int? totalResults,
  }) {
    return TSeaerchResponse<T>(
      page: page ?? this.page,
      totalPages: totalPages ?? this.totalPages,
      totalResults: totalResults ?? this.totalResults,
      results: results ?? this.results,
    );
  }
}
