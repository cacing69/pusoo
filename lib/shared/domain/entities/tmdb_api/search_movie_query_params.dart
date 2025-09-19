import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_movie_query_params.g.dart';
part 'search_movie_query_params.freezed.dart';

@freezed
abstract class SearchMovieQueryParams with _$SearchMovieQueryParams {
  const factory SearchMovieQueryParams({
    @Default("") String query,
    @Default("en-US") String language,
    @Default(1) int page,
    @Default(null) String? region,
    @Default(null) String? year,
    @Default(false) @JsonKey(name: 'include_adult') bool includeAdult,
    @Default(null)
    @JsonKey(name: 'primary_release_year')
    String? primaryReleaseYear,
  }) = _SearchMovieQueryParams;

  factory SearchMovieQueryParams.fromJson(Map<String, dynamic> json) =>
      _$SearchMovieQueryParamsFromJson(json);
}
