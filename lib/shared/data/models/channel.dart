import 'package:freezed_annotation/freezed_annotation.dart';

part 'channel.g.dart';
part 'channel.freezed.dart';

@freezed
abstract class Channel with _$Channel {
  const factory Channel({
    @Default(null) String? id,
    @Default(null) String? playlistId,
    @Default(null) String? name,
    @Default(null) String? tvgId,
    @Default(null) String? tmdbId,
    @Default(null) String? tvgName,
    @Default(null) String? logo,
    @Default(null) String? groupTitle,
    @Default(null) bool? isFavorite,
    @Default(null) bool? isLiveTv,
    @Default(null) bool? isMovie,
    @Default(null) bool? isTvSerie,
    @Default(null) bool? isWatched,

    @Default(null) Map<String, String>? kodiprop,
    @Default(null) Map<String, String>? extvlcopt,
  }) = _Channel;

  factory Channel.fromJson(Map<String, dynamic> json) =>
      _$ChannelFromJson(json);
}
