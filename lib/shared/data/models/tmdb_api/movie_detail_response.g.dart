// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_detail_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MovieDetailResponse _$MovieDetailResponseFromJson(
  Map<String, dynamic> json,
) => _MovieDetailResponse(
  adult: json['adult'] as bool? ?? null,
  backdropPath: json['backdrop_path'] as String? ?? null,
  budget: (json['budget'] as num?)?.toInt() ?? null,
  genres:
      (json['genres'] as List<dynamic>?)
          ?.map((e) => Genre.fromJson(e as Map<String, dynamic>))
          .toList() ??
      null,
  homepage: json['homepage'] as String? ?? null,
  id: (json['id'] as num?)?.toInt() ?? null,
  imdbId: json['imdb_id'] as String? ?? null,
  originCountry:
      (json['origin_country'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      null,
  originalLanguage: json['original_language'] as String? ?? null,
  originalTitle: json['original_title'] as String? ?? null,
  overview: json['overview'] as String? ?? null,
  popularity: (json['popularity'] as num?)?.toDouble() ?? null,
  posterPath: json['poster_path'] as String? ?? null,
  productionCompanies:
      (json['production_companies'] as List<dynamic>?)
          ?.map((e) => ProductionCompany.fromJson(e as Map<String, dynamic>))
          .toList() ??
      null,
  productionCountries:
      (json['production_countries'] as List<dynamic>?)
          ?.map((e) => ProductionCountry.fromJson(e as Map<String, dynamic>))
          .toList() ??
      null,
  releaseDate: json['release_date'] as String? ?? null,
  revenue: (json['revenue'] as num?)?.toInt() ?? null,
  runtime: (json['runtime'] as num?)?.toInt() ?? null,
  spokenLanguages:
      (json['spoken_languages'] as List<dynamic>?)
          ?.map((e) => SpokenLanguage.fromJson(e as Map<String, dynamic>))
          .toList() ??
      null,
  status: json['status'] as String? ?? null,
  tagline: json['tagline'] as String? ?? null,
  title: json['title'] as String? ?? null,
  video: json['video'] as bool? ?? null,
  voteAverage: (json['vote_average'] as num?)?.toDouble() ?? null,
  voteCount: (json['vote_count'] as num?)?.toInt() ?? null,
);

Map<String, dynamic> _$MovieDetailResponseToJson(
  _MovieDetailResponse instance,
) => <String, dynamic>{
  'adult': instance.adult,
  'backdrop_path': instance.backdropPath,
  'budget': instance.budget,
  'genres': instance.genres,
  'homepage': instance.homepage,
  'id': instance.id,
  'imdb_id': instance.imdbId,
  'origin_country': instance.originCountry,
  'original_language': instance.originalLanguage,
  'original_title': instance.originalTitle,
  'overview': instance.overview,
  'popularity': instance.popularity,
  'poster_path': instance.posterPath,
  'production_companies': instance.productionCompanies,
  'production_countries': instance.productionCountries,
  'release_date': instance.releaseDate,
  'revenue': instance.revenue,
  'runtime': instance.runtime,
  'spoken_languages': instance.spokenLanguages,
  'status': instance.status,
  'tagline': instance.tagline,
  'title': instance.title,
  'video': instance.video,
  'vote_average': instance.voteAverage,
  'vote_count': instance.voteCount,
};
