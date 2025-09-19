import 'package:freezed_annotation/freezed_annotation.dart';

part 'spoken_language.g.dart';
part 'spoken_language.freezed.dart';

@freezed
abstract class SpokenLanguage with _$SpokenLanguage {
  const factory SpokenLanguage({
    @JsonKey(name: "iso_639_1") String? iso6391,
    @Default(null) String? name,
    @JsonKey(name: "english_name") String? englishName,
  }) = _SpokenLanguage;

  factory SpokenLanguage.fromJson(Map<String, dynamic> json) =>
      _$SpokenLanguageFromJson(json);
}
