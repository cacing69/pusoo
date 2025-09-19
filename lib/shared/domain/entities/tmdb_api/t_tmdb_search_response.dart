import 'package:json_annotation/json_annotation.dart';

part 't_tmdb_search_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class TTMDBSearchResponse<T> {
  final int? page;
  final T? results;

  @JsonKey(name: 'total_pages')
  final int? totalPages;

  @JsonKey(name: 'total_results')
  final int? totalResults;

  TTMDBSearchResponse({
    this.totalPages,
    this.totalResults,
    this.page,
    this.results,
  });

  factory TTMDBSearchResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) {
    return _$TTMDBSearchResponseFromJson(json, fromJsonT);
  }

  Map<String, dynamic> toJson(Object? Function(T value) toJsonT) =>
      _$TTMDBSearchResponseToJson(this, toJsonT);

  TTMDBSearchResponse<T> copyWith({
    int? page,
    T? results,
    int? totalPages,
    int? totalResults,
  }) {
    return TTMDBSearchResponse<T>(
      page: page ?? this.page,
      totalPages: totalPages ?? this.totalPages,
      totalResults: totalResults ?? this.totalResults,
      results: results ?? this.results,
    );
  }
}
