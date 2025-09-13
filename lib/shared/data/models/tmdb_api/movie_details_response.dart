import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pusoo/shared/data/models/tmdb_api/genre.dart';
import 'package:pusoo/shared/data/models/tmdb_api/production_company.dart';
import 'package:pusoo/shared/data/models/tmdb_api/production_country.dart';
import 'package:pusoo/shared/data/models/tmdb_api/spoken_language.dart';

part 'movie_details_response.g.dart';
part 'movie_details_response.freezed.dart';

@freezed
abstract class MovieDetailsResponse with _$MovieDetailsResponse {
  const factory MovieDetailsResponse({
    @Default(null) bool? adult,
    @JsonKey(name: 'backdrop_path') String? backdropPath,
    @Default(null) int? budget,
    @Default(null) List<Genre>? genres,
    @Default(null) String? homepage,
    @Default(null) int? id,
    @JsonKey(name: 'imdb_id') String? imdbId,
    @JsonKey(name: 'origin_country') List<String>? originCountry,
    @JsonKey(name: 'original_language') String? originalLanguage,
    @JsonKey(name: 'original_title') String? originalTitle,
    @Default(null) String? overview,
    @Default(null) double? popularity,
    @JsonKey(name: 'poster_path') String? posterPath,
    @Default(null)
    @JsonKey(name: 'production_companies')
    List<ProductionCompany>? productionCompanies,
    @Default(null)
    @JsonKey(name: 'production_countries')
    List<ProductionCountry>? productionCountries,
    @JsonKey(name: 'release_date') String? releaseDate,
    @Default(null) int? revenue,
    @Default(null) int? runtime,
    @Default(null)
    @JsonKey(name: 'spoken_languages')
    List<SpokenLanguage>? spokenLanguages,
    @Default(null) String? status,
    @Default(null) String? tagline,
    @Default(null) String? title,
    @Default(null) bool? video,
    @JsonKey(name: 'vote_average') double? voteAverage,
    @JsonKey(name: 'vote_count') int? voteCount,
  }) = _MovieDetailsResponse;

  factory MovieDetailsResponse.fromJson(Map<String, dynamic> json) =>
      _$MovieDetailsResponseFromJson(json);
}
