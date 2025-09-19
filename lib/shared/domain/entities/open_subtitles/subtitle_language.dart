import 'package:freezed_annotation/freezed_annotation.dart';

part 'subtitle_language.g.dart';
part 'subtitle_language.freezed.dart';

@freezed
abstract class SubtitleLanguage with _$SubtitleLanguage {
  const factory SubtitleLanguage({String? label, String? value}) =
      _SubtitleLanguage;

  factory SubtitleLanguage.fromJson(Map<String, dynamic> json) =>
      _$SubtitleLanguageFromJson(json);
}
