import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pusoo/shared/domain/entities/open_subtitles/subtitle_attribute.dart';

part 'subtitle.g.dart';
part 'subtitle.freezed.dart';

@freezed
abstract class Subtitle with _$Subtitle {
  const factory Subtitle({
    String? id,
    String? type,
    SubtitleAttribute? attributes,
  }) = _Subtitle;

  factory Subtitle.fromJson(Map<String, dynamic> json) =>
      _$SubtitleFromJson(json);
}
