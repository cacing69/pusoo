/*
 * Pusoo - IPTV Player
 * Copyright (C) 2025 Ibnul Mutaki <ibnuul@gmail.com>
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
 * See the GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program. If not, see <https://www.gnu.org/licenses/>.
 */


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
