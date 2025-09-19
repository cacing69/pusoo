import 'package:dartz/dartz.dart';
import 'package:pusoo/core/errors/failure.dart';
import 'package:pusoo/features/track/domain/models/track_filter_query.dart';
import 'package:pusoo/features/track/domain/models/track.dart';

abstract class TrackRepository {
  Future<Either<Failure, List<Track>>> get(TrackFilterQuery? params);
  Future<Either<Failure, List<String>>> getGroupTitle(TrackFilterQuery? params);

  Future<Either<Failure, int>> count(TrackFilterQuery? params);
}
