import 'package:dartz/dartz.dart';
import 'package:pusoo/core/errors/failure.dart';
import 'package:pusoo/shared/data/models/tmdb_api/movie_credits_query_params.dart';
import 'package:pusoo/shared/data/models/tmdb_api/movie_credits_response.dart';
import 'package:pusoo/shared/data/models/tmdb_api/movie_details_query_params.dart';
import 'package:pusoo/shared/data/models/tmdb_api/movie_details_response.dart';
import 'package:pusoo/shared/data/models/tmdb_api/movie_videos_query_params.dart';
import 'package:pusoo/shared/data/models/tmdb_api/movie_videos_response.dart';

abstract class MoviesRepository {
  Future<Either<Failure, MovieDetailsResponse>> details(
    String movieId,
    MovieDetailsQueryParams queryParams,
  );

  Future<Either<Failure, MovieCreditsResponse>> credits(
    String movieId,
    MovieCreditsQueryParams queryParams,
  );

  Future<Either<Failure, MovieVideosResponse>> videos(
    String movieId,
    MovieVideosQueryParams queryParams,
  );
}
