import 'package:freezed_annotation/freezed_annotation.dart';

part 'playlist.g.dart';
part 'playlist.freezed.dart';

@freezed
abstract class Playlist with _$Playlist {
  const factory Playlist({
    @Default(null) String? id,
    @Default(null) String? name,
    @Default(null) String? type,
    @Default(null) String? epgLink,
    @Default(null) String? url,
    @Default(false) bool? isActive,
  }) = _Playlist;

  factory Playlist.fromJson(Map<String, dynamic> json) =>
      _$PlaylistFromJson(json);
}
