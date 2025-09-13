// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_movie_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SearchMovieResponse _$SearchMovieResponseFromJson(Map<String, dynamic> json) =>
    _SearchMovieResponse(
      adult: json['adult'] as bool? ?? null,
      backdropPath: json['backdrop_path'] as String?,
      budget: (json['budget'] as num?)?.toInt() ?? null,
      genreIds: (json['genre_ids'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList(),
      id: (json['id'] as num?)?.toInt() ?? null,
      originalLanguage: json['original_language'] as String?,
      originalTitle: json['original_title'] as String?,
      overview: json['overview'] as String? ?? null,
      popularity: (json['popularity'] as num?)?.toDouble() ?? null,
      posterPath: json['poster_path'] as String?,
      releaseDate: json['release_date'] as String?,
      title: json['title'] as String? ?? null,
      video: json['video'] as bool? ?? null,
      voteAverage: (json['vote_average'] as num?)?.toDouble(),
      voteCount: (json['vote_count'] as num?)?.toInt(),
    );

Map<String, dynamic> _$SearchMovieResponseToJson(
  _SearchMovieResponse instance,
) => <String, dynamic>{
  'adult': instance.adult,
  'backdrop_path': instance.backdropPath,
  'budget': instance.budget,
  'genre_ids': instance.genreIds,
  'id': instance.id,
  'original_language': instance.originalLanguage,
  'original_title': instance.originalTitle,
  'overview': instance.overview,
  'popularity': instance.popularity,
  'poster_path': instance.posterPath,
  'release_date': instance.releaseDate,
  'title': instance.title,
  'video': instance.video,
  'vote_average': instance.voteAverage,
  'vote_count': instance.voteCount,
};
