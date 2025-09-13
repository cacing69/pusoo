import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pusoo/shared/data/models/tmdb_api/movie_video.dart';

part 'movie_videos_response.g.dart';
part 'movie_videos_response.freezed.dart';

@freezed
abstract class MovieVideosResponse with _$MovieVideosResponse {
  const factory MovieVideosResponse({
    @Default(0) int? id,
    @Default(null) List<MovieVideo>? results,
  }) = _MovieVideosResponse;

  factory MovieVideosResponse.fromJson(Map<String, dynamic> json) =>
      _$MovieVideosResponseFromJson(json);
}
