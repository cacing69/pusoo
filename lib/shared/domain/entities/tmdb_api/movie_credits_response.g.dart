// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_credits_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MovieCreditsResponse _$MovieCreditsResponseFromJson(
  Map<String, dynamic> json,
) => _MovieCreditsResponse(
  id: (json['id'] as num?)?.toInt() ?? 0,
  casts:
      (json['casts'] as List<dynamic>?)
          ?.map((e) => MovieCast.fromJson(e as Map<String, dynamic>))
          .toList() ??
      null,
  crew:
      (json['crew'] as List<dynamic>?)
          ?.map((e) => MovieCrew.fromJson(e as Map<String, dynamic>))
          .toList() ??
      null,
);

Map<String, dynamic> _$MovieCreditsResponseToJson(
  _MovieCreditsResponse instance,
) => <String, dynamic>{
  'id': instance.id,
  'casts': instance.casts,
  'crew': instance.crew,
};
