/*
 * Pusoo - IPTV Player
 * Copyright (C) 2025 Ibnul Mutaki <ibnuul@gmail.com>
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
 * See the GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program. If not, see <https://www.gnu.org/licenses/>.
 */


// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_details_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MovieDetailsResponse _$MovieDetailsResponseFromJson(
  Map<String, dynamic> json,
) => _MovieDetailsResponse(
  adult: json['adult'] as bool? ?? null,
  backdropPath: json['backdrop_path'] as String?,
  budget: (json['budget'] as num?)?.toInt() ?? null,
  genres:
      (json['genres'] as List<dynamic>?)
          ?.map((e) => Genre.fromJson(e as Map<String, dynamic>))
          .toList() ??
      null,
  homepage: json['homepage'] as String? ?? null,
  id: (json['id'] as num?)?.toInt() ?? null,
  imdbId: json['imdb_id'] as String?,
  originCountry: (json['origin_country'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  originalLanguage: json['original_language'] as String?,
  originalTitle: json['original_title'] as String?,
  overview: json['overview'] as String? ?? null,
  popularity: (json['popularity'] as num?)?.toDouble() ?? null,
  posterPath: json['poster_path'] as String?,
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
  releaseDate: json['release_date'] as String?,
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
  voteAverage: (json['vote_average'] as num?)?.toDouble(),
  voteCount: (json['vote_count'] as num?)?.toInt(),
);

Map<String, dynamic> _$MovieDetailsResponseToJson(
  _MovieDetailsResponse instance,
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
