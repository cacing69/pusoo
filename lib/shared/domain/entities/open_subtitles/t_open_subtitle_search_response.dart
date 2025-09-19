import 'package:json_annotation/json_annotation.dart';

part 't_open_subtitle_search_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class TOpenSubtitleSearchResponse<T> {
  final int? page;
  final T? data;

  @JsonKey(name: 'total_pages')
  final int? totalPages;

  @JsonKey(name: 'total_count')
  final int? totalCount;

  @JsonKey(name: 'per_page')
  final int? perPage;

  TOpenSubtitleSearchResponse({
    this.totalPages,
    this.totalCount,
    this.page,
    this.data,
    this.perPage,
  });

  factory TOpenSubtitleSearchResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) {
    return _$TOpenSubtitleSearchResponseFromJson(json, fromJsonT);
  }

  Map<String, dynamic> toJson(Object? Function(T value) toJsonT) =>
      _$TOpenSubtitleSearchResponseToJson(this, toJsonT);

  TOpenSubtitleSearchResponse<T> copyWith({
    int? page,
    T? data,
    int? totalPages,
    int? totalCount,
    int? perPage,
  }) {
    return TOpenSubtitleSearchResponse<T>(
      page: page ?? this.page,
      totalPages: totalPages ?? this.totalPages,
      totalCount: totalCount ?? this.totalCount,
      perPage: perPage ?? this.perPage,
      data: data ?? this.data,
    );
  }
}
