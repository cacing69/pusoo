import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pusoo/shared/domain/entities/open_subtitles/subtitle_attribute.dart';

part 'subtitle.g.dart';
part 'subtitle.freezed.dart';

@freezed
abstract class Subtitle with _$Subtitle {
  const factory Subtitle({
    @JsonKey(name: "id") String? id,
    @JsonKey(name: "type") String? type,
    @JsonKey(name: "attributes") SubtitleAttribute? attributes,
    @JsonKey(name: "data") List<dynamic>? data,
  }) = _Subtitle;

  factory Subtitle.fromJson(Map<String, dynamic> json) =>
      _$SubtitleFromJson(json);
}
