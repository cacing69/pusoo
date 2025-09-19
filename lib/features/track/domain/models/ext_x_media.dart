import 'package:freezed_annotation/freezed_annotation.dart';

part 'ext_x_media.g.dart';
part 'ext_x_media.freezed.dart';

@freezed
abstract class ExtXMedia with _$ExtXMedia {
  const factory ExtXMedia({
    @Default("") String type,
    @Default("") String groupId,
    @Default("") String language,
    @Default("") String name,
    @Default(false) bool isDefault,
    @Default(false) bool autoSelect,
    @Default("") String uri,
  }) = _ExtXMedia;

  factory ExtXMedia.fromJson(Map<String, dynamic> json) =>
      _$ExtXMediaFromJson(json);

  factory ExtXMedia.fromMap(Map<String, String> map) {
    return ExtXMedia(
      type: map["TYPE"] ?? "",
      groupId: map["GROUP-ID"] ?? "",
      language: map["LANGUAGE"] ?? "",
      name: map["NAME"] ?? "",
      isDefault: map["DEFAULT"] == "YES",
      autoSelect: map["AUTOSELECT"] == "YES",
      uri: map["URI"] ?? "",
    );
  }
}
