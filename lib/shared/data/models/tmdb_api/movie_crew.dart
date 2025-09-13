import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie_crew.g.dart';
part 'movie_crew.freezed.dart';

@freezed
abstract class MovieCrew with _$MovieCrew {
  const factory MovieCrew({
    @Default(true) bool adult,
    @Default(0) int gender,
    @Default(0) int id,
    @Default(null)
    @JsonKey(name: "known_for_department")
    String? knownForDepartment,
    @Default(null) String? name,
    @JsonKey(name: "original_name") String? originalName,
    @Default(0) double popularity,
    @JsonKey(name: "profile_path") String? profilePath,
    @JsonKey(name: "credit_id") String? creditId,
    @Default(null) String? department,
    @Default(null) String? job,
  }) = _MovieCrew;

  factory MovieCrew.fromJson(Map<String, dynamic> json) =>
      _$MovieCrewFromJson(json);
}
