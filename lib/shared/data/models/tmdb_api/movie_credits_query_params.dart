import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie_credits_query_params.g.dart';
part 'movie_credits_query_params.freezed.dart';

@freezed
abstract class MovieCreditsQueryParams with _$MovieCreditsQueryParams {
  const factory MovieCreditsQueryParams({@Default("en-US") String? language}) =
      _MovieCreditsQueryParams;

  factory MovieCreditsQueryParams.fromJson(Map<String, dynamic> json) =>
      _$MovieCreditsQueryParamsFromJson(json);
}
