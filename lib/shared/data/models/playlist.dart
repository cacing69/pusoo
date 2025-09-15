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

/// Creates a [ContentType] from a string value.
///
/// The method is case-insensitive and returns [ContentType.unknown]
/// for any string that does not match.
ContentType contentTypefromString(String type) {
  switch (type.toLowerCase()) {
    case "live":
      return ContentType.live;
    case "vod":
      return ContentType.vod;
    case "series":
      return ContentType.series;
    case "audio":
      return ContentType.audio;
    default:
      return ContentType.unknown;
  }
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
