import 'package:freezed_annotation/freezed_annotation.dart';

part 'genre.g.dart';
part 'genre.freezed.dart';

@freezed
abstract class Genre with _$Genre {
  const factory Genre({@Default(null) int? id, @Default(null) String? name}) =
      _Genre;

  factory Genre.fromJson(Map<String, dynamic> json) => _$GenreFromJson(json);
}
