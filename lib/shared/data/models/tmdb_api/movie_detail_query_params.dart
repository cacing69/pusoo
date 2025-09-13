import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie_detail_query_params.g.dart';
part 'movie_detail_query_params.freezed.dart';

@freezed
abstract class MovieDetailQueryParams with _$MovieDetailQueryParams {
  const factory MovieDetailQueryParams({
    @Default("en-US") String? language,
    @Default(null)
    @JsonKey(name: "append_to_response")
    String? appendToResponse,
  }) = _MovieDetailQueryParams;

  factory MovieDetailQueryParams.fromJson(Map<String, dynamic> json) =>
      _$MovieDetailQueryParamsFromJson(json);
}
