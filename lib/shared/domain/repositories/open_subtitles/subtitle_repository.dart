import 'package:dartz/dartz.dart';
import 'package:pusoo/core/errors/failure.dart';
import 'package:pusoo/shared/domain/entities/tmdb_api/movie_credits_query_params.dart';
import 'package:pusoo/shared/domain/entities/tmdb_api/movie_credits_response.dart';
import 'package:pusoo/shared/domain/entities/tmdb_api/movie_details_query_params.dart';
import 'package:pusoo/shared/domain/entities/tmdb_api/movie_details_response.dart';
import 'package:pusoo/shared/domain/entities/tmdb_api/movie_videos_query_params.dart';
import 'package:pusoo/shared/domain/entities/tmdb_api/movie_videos_response.dart';

abstract class SubtitleRepository {
  Future<Either<Failure, MovieDetailsResponse>> search();
}
