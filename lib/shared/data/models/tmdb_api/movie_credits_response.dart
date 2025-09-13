import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pusoo/shared/data/models/tmdb_api/movie_cast.dart';
import 'package:pusoo/shared/data/models/tmdb_api/movie_crew.dart';

part 'movie_credits_response.g.dart';
part 'movie_credits_response.freezed.dart';

@freezed
abstract class MovieCreditsResponse with _$MovieCreditsResponse {
  const factory MovieCreditsResponse({
    @Default(0) int? id,
    @Default(null) List<MovieCast>? casts,
    @Default(null) List<MovieCrew>? crew,
  }) = _MovieCreditsResponse;

  factory MovieCreditsResponse.fromJson(Map<String, dynamic> json) =>
      _$MovieCreditsResponseFromJson(json);
}
