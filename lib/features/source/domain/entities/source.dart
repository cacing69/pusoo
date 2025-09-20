import 'package:freezed_annotation/freezed_annotation.dart';

part 'source.g.dart';
part 'source.freezed.dart';

@freezed
abstract class Source with _$Source {
  const factory Source({
    int? id,
    String? name,
    @Default("m3u") String type,
    String? contentType,
    String? filePath,
    String? template,
    String? epgLink,
    String? url,
    @Default(false) bool? isActive,
    @Default(false) bool? isEmpty,

    // Atribut untuk Xtream Codes
    String? username,
    String? password,
    String? serverUrl,
  }) = _Source;

  factory Source.fromJson(Map<String, dynamic> json) => _$SourceFromJson(json);
}
