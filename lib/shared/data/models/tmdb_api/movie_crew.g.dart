// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_crew.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MovieCrew _$MovieCrewFromJson(Map<String, dynamic> json) => _MovieCrew(
  adult: json['adult'] as bool? ?? true,
  gender: (json['gender'] as num?)?.toInt() ?? 0,
  id: (json['id'] as num?)?.toInt() ?? 0,
  knownForDepartment: json['known_for_department'] as String? ?? null,
  name: json['name'] as String? ?? null,
  originalName: json['original_name'] as String? ?? null,
  popularity: (json['popularity'] as num?)?.toDouble() ?? 0,
  profilePath: json['profile_path'] as String? ?? null,
  creditId: json['credit_id'] as String? ?? null,
  department: json['department'] as String? ?? null,
  job: json['job'] as String? ?? null,
);

Map<String, dynamic> _$MovieCrewToJson(_MovieCrew instance) =>
    <String, dynamic>{
      'adult': instance.adult,
      'gender': instance.gender,
      'id': instance.id,
      'known_for_department': instance.knownForDepartment,
      'name': instance.name,
      'original_name': instance.originalName,
      'popularity': instance.popularity,
      'profile_path': instance.profilePath,
      'credit_id': instance.creditId,
      'department': instance.department,
      'job': instance.job,
    };
