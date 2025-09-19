import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_movie_response.g.dart';
part 'search_movie_response.freezed.dart';

@freezed
abstract class SearchMovieResponse with _$SearchMovieResponse {
  const factory SearchMovieResponse({
    @Default(null) bool? adult,
    @JsonKey(name: 'backdrop_path') String? backdropPath,
    @Default(null) int? budget,
    @JsonKey(name: 'genre_ids') List<int>? genreIds,
    @Default(null) int? id,
    @JsonKey(name: 'original_language') String? originalLanguage,
    @JsonKey(name: 'original_title') String? originalTitle,
    @Default(null) String? overview,
    @Default(null) double? popularity,
    @JsonKey(name: 'poster_path') String? posterPath,
    @JsonKey(name: 'release_date') String? releaseDate,
    @Default(null) String? title,
    @Default(null) bool? video,
    @JsonKey(name: 'vote_average') double? voteAverage,
    @JsonKey(name: 'vote_count') int? voteCount,
  }) = _SearchMovieResponse;

  factory SearchMovieResponse.fromJson(Map<String, dynamic> json) =>
      _$SearchMovieResponseFromJson(json);
}
