import 'package:dio/dio.dart';
import 'package:pusoo/shared/data/models/tmdb_api/movie_credits_response.dart';
import 'package:pusoo/shared/data/models/tmdb_api/movie_detail_query_params.dart';
import 'package:pusoo/shared/data/models/tmdb_api/movie_detail_response.dart';
import 'package:pusoo/shared/data/models/tmdb_api/movie_videos_response.dart';
import 'package:pusoo/shared/data/models/tmdb_api/search_movie_response.dart';
import 'package:pusoo/shared/data/models/tmdb_api/t_search_response.dart';
import 'package:pusoo/shared/presentation/providers/tmdb_http_client.dart';
import 'package:retrofit/retrofit.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'tmdb_api_client.g.dart';

@riverpod
TmdbApiClient tmdbApiClient(Ref ref) {
  return TmdbApiClient(ref.read(tmddbHttpClientProvider));
}

@RestApi()
abstract class TmdbApiClient {
  factory TmdbApiClient(Dio dio, {String baseUrl}) = _TmdbApiClient;

  // MOVIES SECTION
  @GET("/3/movie/{movieId}")
  Future<MovieDetailResponse> movieDetail(
    @Path("movieId") String movieId,
    @Queries() MovieDetailQueryParams queryParams,
  );

  @GET("/3/movie/{movieId}/videos")
  Future<MovieVideosResponse> movieVideos(@Path("movieId") String movieId);

  @GET("/3/movie/{movieId}/credits")
  Future<MovieCreditsResponse> movieCredits(@Path("movieId") String movieId);

  // SEARCH SECTION
  @GET("/3/search/movie")
  Future<TSeaerchResponse<SearchMovieResponse>> searchMovie(
    @Path("movieId") String movieId,
    @Queries() MovieDetailQueryParams queryParams,
  );
}
