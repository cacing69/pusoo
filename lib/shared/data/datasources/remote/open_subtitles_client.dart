import 'package:dio/dio.dart';
import 'package:pusoo/shared/domain/entities/open_subtitles/subtitle.dart';
import 'package:pusoo/shared/domain/entities/open_subtitles/t_open_subtitle_search_response.dart';
import 'package:pusoo/shared/domain/entities/tmdb_api/movie_details_query_params.dart';
import 'package:retrofit/retrofit.dart';

part 'open_subtitles_client.g.dart';

@RestApi()
abstract class OpenSubtitlesClient {
  factory OpenSubtitlesClient(Dio dio, {String baseUrl}) = _OpenSubtitlesClient;

  // MOVIES SECTION
  @GET("/3/movie/{movieId}")
  Future<TOpenSubtitleSearchResponse<Subtitle>> movieDetails(
    @Path("movieId") String movieId,
    @Queries() MovieDetailsQueryParams queryParams,
  );
}
