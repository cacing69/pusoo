import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pusoo/shared/data/models/playlist.dart';

part 'track.g.dart';
part 'track.freezed.dart';

@freezed
abstract class Track with _$Track {
  const factory Track({
    @Default("") String id,
    @Default("") String title,
    @Default(ContentType.unknown) ContentType contentType,
    @Default([]) List<String> links,
    @Default("") String groupTitle,
    @Default("") String imdbId,
    @Default("") String tvgId,
    @Default("") String tvgName,
    @Default("") String tvgLogo,
    @Default(0) int duration,
    @Default(false) bool isNsfw,

    @Default({}) Map<String, String> attributes,
    @Default([]) List<Map<String, String>> extVlcOpts,
    @Default([]) List<Map<String, String>> kodiProps,
    @Default([]) List<Map<String, String>> httpHeaders,
  }) = _Track;

  factory Track.fromJson(Map<String, dynamic> json) => _$TrackFromJson(json);
}
