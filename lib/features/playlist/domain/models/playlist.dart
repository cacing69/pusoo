import 'package:freezed_annotation/freezed_annotation.dart';

part 'playlist.g.dart';
part 'playlist.freezed.dart';

@freezed
abstract class Playlist with _$Playlist {
  const factory Playlist({
    int? id,
    String? name,
    @Default("m3u") String type,
    String? contentType,
    String? filePath,
    String? template,
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
