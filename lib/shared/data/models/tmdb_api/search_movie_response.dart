import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_movie_response.g.dart';
part 'search_movie_response.freezed.dart';

@freezed
abstract class SearchMovieResponse with _$SearchMovieResponse {
  const factory SearchMovieResponse({
    @Default(null) bool? adult,
    @Default(null) @JsonKey(name: 'backdrop_path') String? backdropPath,
    @Default(null) int? budget,
    @Default(null) @JsonKey(name: 'genre_ids') List<int>? genreIds,
    @Default(null) int? id,
    @Default(null) @JsonKey(name: 'original_language') String? originalLanguage,
    @Default(null) @JsonKey(name: 'original_title') String? originalTitle,
    @Default(null) String? overview,
    @Default(null) double? popularity,
    @Default(null) @JsonKey(name: 'poster_path') String? posterPath,
    @Default(null) @JsonKey(name: 'release_date') String? releaseDate,
    @Default(null) String? title,
    @Default(null) bool? video,
    @Default(null) @JsonKey(name: 'vote_average') double? voteAverage,
    @Default(null) @JsonKey(name: 'vote_count') int? voteCount,
  }) = _SearchMovieResponse;

  factory SearchMovieResponse.fromJson(Map<String, dynamic> json) =>
      _$SearchMovieResponseFromJson(json);
}
