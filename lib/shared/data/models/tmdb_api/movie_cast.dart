import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie_cast.g.dart';
part 'movie_cast.freezed.dart';

@freezed
abstract class MovieCast with _$MovieCast {
  const factory MovieCast({
    @Default(true) bool adult,
    @Default(0) int gender,
    @Default(0) int id,
    @Default(null)
    @JsonKey(name: "known_for_department")
    String? knownForDepartment,
    @Default(null) String? name,
    @Default(null) @JsonKey(name: "original_name") String? originalName,
    @Default(0) double popularity,
    @Default(null) @JsonKey(name: "profile_path") String? profilePath,
    @Default(0) @JsonKey(name: "cast_id") int castId,
    @Default(null) String? character,
    @Default(null) @JsonKey(name: "credit_id") String? creditId,
    @Default(0) int order,
  }) = _MovieCast;

  factory MovieCast.fromJson(Map<String, dynamic> json) =>
      _$MovieCastFromJson(json);
}
