import 'package:freezed_annotation/freezed_annotation.dart';

part 'playlist.g.dart';
part 'playlist.freezed.dart';

enum ContentType {
  @JsonValue("unknown")
  unknown,
  @JsonValue("live")
  live,
  @JsonValue("vod")
  vod,
  @JsonValue("series")
  series,
  @JsonValue("audio")
  audio,
}

@freezed
abstract class Playlist with _$Playlist {
  const factory Playlist({
    String? id,
    String? name,
    @Default("m3u") String type,
    @Default(ContentType.unknown) ContentType contentType,
    @Default("") String filePath,
    String? epgLink,
    String? url,
    @Default(false) bool? isActive,

    // Atribut untuk Xtream Codes
    String? username,
    String? password,
    String? serverUrl,
  }) = _Playlist;

  factory Playlist.fromJson(Map<String, dynamic> json) =>
      _$PlaylistFromJson(json);
}
