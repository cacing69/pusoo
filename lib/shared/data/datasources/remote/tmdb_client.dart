import 'package:dio/dio.dart';
import 'package:pusoo/shared/domain/entities/tmdb_api/movie_credits_query_params.dart';
import 'package:pusoo/shared/domain/entities/tmdb_api/movie_credits_response.dart';
import 'package:pusoo/shared/domain/entities/tmdb_api/movie_details_query_params.dart';
import 'package:pusoo/shared/domain/entities/tmdb_api/movie_details_response.dart';
import 'package:pusoo/shared/domain/entities/tmdb_api/movie_videos_query_params.dart';
import 'package:pusoo/shared/domain/entities/tmdb_api/movie_videos_response.dart';
import 'package:pusoo/shared/domain/entities/tmdb_api/search_movie_query_params.dart';
import 'package:pusoo/shared/domain/entities/tmdb_api/search_movie_response.dart';
import 'package:pusoo/shared/domain/entities/tmdb_api/t_tmdb_search_response.dart';
import 'package:retrofit/retrofit.dart';

part 'tmdb_client.g.dart';

@RestApi()
abstract class TMDBClient {
  factory TMDBClient(Dio dio, {String baseUrl}) = _TMDBClient;

  // MOVIES SECTION
  @GET("/3/movie/{movieId}")
  Future<MovieDetailsResponse> movieDetails(
    @Path("movieId") String movieId,
    @Queries() MovieDetailsQueryParams queryParams,
  );

  @GET("/3/movie/{movieId}/credits")
  Future<MovieCreditsResponse> movieCredits(
    @Path("movieId") String movieId,
    @Queries() MovieCreditsQueryParams queryParams,
  );

  @GET("/3/movie/{movieId}/videos")
  Future<MovieVideosResponse> movieVideos(
    @Path("movieId") String movieId,
    @Queries() MovieVideosQueryParams queryParams,
  );

  // SEARCH SECTION
  @GET("/3/search/movie")
  Future<TTMDBSearchResponse<SearchMovieResponse>> searchMovie(
    @Path("movieId") String movieId,
    @Queries() SearchMovieQueryParams queryParams,
  );
}
