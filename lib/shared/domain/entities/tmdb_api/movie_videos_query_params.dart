import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie_videos_query_params.g.dart';
part 'movie_videos_query_params.freezed.dart';

@freezed
abstract class MovieVideosQueryParams with _$MovieVideosQueryParams {
  const factory MovieVideosQueryParams({@Default("en-US") String? language}) =
      _MovieVideosQueryParams;

  factory MovieVideosQueryParams.fromJson(Map<String, dynamic> json) =>
      _$MovieVideosQueryParamsFromJson(json);
}
