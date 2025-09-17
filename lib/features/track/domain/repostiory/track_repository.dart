import 'package:dartz/dartz.dart';
import 'package:pusoo/core/errors/failure.dart';
import 'package:pusoo/features/track/domain/models/track_drift_filter_query.dart';
import 'package:pusoo/features/track/domain/models/track.dart';

abstract class TrackRepository {
  Future<Either<Failure, List<Track>>> get(TrackDriftFilterQuery? params);
  Future<Either<Failure, List<String>>> getGroupTitle(
    TrackDriftFilterQuery? params,
  );

  Future<Either<Failure, int>> count(TrackDriftFilterQuery? params);
}
