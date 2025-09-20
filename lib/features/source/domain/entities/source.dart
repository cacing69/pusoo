import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pusoo/features/track/domain/models/track.dart';

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
    @Default(false) bool? isPersonal,
    @Default(false) bool? isPublic,

    @Default(false) bool isEmpty,

    String? homepage,
    String? owner,
    String? description,
    String? repository,

    List<Track>? tracks,

    //>? isEmpty,

    // Atribut untuk Xtream Codes
    String? username,
    String? password,
    String? serverUrl,
  }) = _Source;

  factory Source.fromJson(Map<String, dynamic> json) => _$SourceFromJson(json);
}
