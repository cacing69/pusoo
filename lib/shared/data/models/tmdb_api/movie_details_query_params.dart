import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie_details_query_params.g.dart';
part 'movie_details_query_params.freezed.dart';

@freezed
abstract class MovieDetailsQueryParams with _$MovieDetailsQueryParams {
  const factory MovieDetailsQueryParams({
    @Default("en-US") String? language,
    @Default(null)
    @JsonKey(name: "append_to_response")
    String? appendToResponse,
  }) = _MovieDetailsQueryParams;

  factory MovieDetailsQueryParams.fromJson(Map<String, dynamic> json) =>
      _$MovieDetailsQueryParamsFromJson(json);
}
