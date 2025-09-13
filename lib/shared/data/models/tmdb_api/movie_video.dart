import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie_video.g.dart';
part 'movie_video.freezed.dart';

@freezed
abstract class MovieVideo with _$MovieVideo {
  const factory MovieVideo({
    @Default(null) @JsonKey(name: "iso_639_1") String? iso6391,
    @Default(null) @JsonKey(name: "iso_3166_1") String? iso31661,
    @Default(null) String? name,
    @Default(null) String? key,
    @Default(null) String? site,
    @Default(null) int? size,
    @Default(null) String? type,
    @Default(false) bool? oficial,
    @Default(null) @JsonKey(name: "published_at") String? publishedAt,
  }) = _MovieVideo;

  factory MovieVideo.fromJson(Map<String, dynamic> json) =>
      _$MovieVideoFromJson(json);
}
