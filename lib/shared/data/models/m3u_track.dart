import 'package:freezed_annotation/freezed_annotation.dart';

part 'm3u_track.g.dart';
part 'm3u_track.freezed.dart';

@freezed
abstract class M3UTrack with _$M3UTrack {
  const factory M3UTrack({
    @Default("") String title,
    @Default([]) List<String> links,
    @Default("") String category,

    @Default({}) Map<String, String> attributes,
    @Default([]) List<Map<String, String>> extVlcOpt,
    @Default([]) List<Map<String, String>> kodiProp,
    @Default([]) List<Map<String, String>> httpHeaders,
  }) = _M3UTrack;

  factory M3UTrack.fromJson(Map<String, dynamic> json) =>
      _$M3UTrackFromJson(json);
}
