import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pusoo/shared/data/models/tmdb_api/genre.dart';
import 'package:pusoo/shared/data/models/tmdb_api/production_company.dart';
import 'package:pusoo/shared/data/models/tmdb_api/production_country.dart';
import 'package:pusoo/shared/data/models/tmdb_api/spoken_language.dart';

part 'movie_detail_response.g.dart';
part 'movie_detail_response.freezed.dart';

@freezed
abstract class MovieDetailResponse with _$MovieDetailResponse {
  const factory MovieDetailResponse({
    @Default(null) bool? adult,
    @Default(null) @JsonKey(name: 'backdrop_path') String? backdropPath,
    @Default(null) int? budget,
    @Default(null) List<Genre>? genres,
    @Default(null) String? homepage,
    @Default(null) int? id,
    @Default(null) @JsonKey(name: 'imdb_id') String? imdbId,
    @Default(null) @JsonKey(name: 'origin_country') List<String>? originCountry,
    @Default(null) @JsonKey(name: 'original_language') String? originalLanguage,
    @Default(null) @JsonKey(name: 'original_title') String? originalTitle,
    @Default(null) String? overview,
    @Default(null) double? popularity,
    @Default(null) @JsonKey(name: 'poster_path') String? posterPath,
    @Default(null)
    @JsonKey(name: 'production_companies')
    List<ProductionCompany>? productionCompanies,
    @Default(null)
    @JsonKey(name: 'production_countries')
    List<ProductionCountry>? productionCountries,
    @Default(null) @JsonKey(name: 'release_date') String? releaseDate,
    @Default(null) int? revenue,
    @Default(null) int? runtime,
    @Default(null)
    @JsonKey(name: 'spoken_languages')
    List<SpokenLanguage>? spokenLanguages,
    @Default(null) String? status,
    @Default(null) String? tagline,
    @Default(null) String? title,
    @Default(null) bool? video,
    @Default(null) @JsonKey(name: 'vote_average') double? voteAverage,
    @Default(null) @JsonKey(name: 'vote_count') int? voteCount,
  }) = _MovieDetailResponse;

  factory MovieDetailResponse.fromJson(Map<String, dynamic> json) =>
      _$MovieDetailResponseFromJson(json);
}
