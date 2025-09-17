import 'package:dartz/dartz.dart';
import 'package:pusoo/core/errors/failure.dart';
import 'package:pusoo/features/track/data/datasources/local/track_drift_datasource.dart';
import 'package:pusoo/features/track/domain/repostiory/track_repository.dart';
import 'package:pusoo/features/track/domain/models/track_drift_filter_query.dart';
import 'package:pusoo/shared/data/models/track.dart';

class TrackDriftRepositoryImpl implements TrackRepository {
  final TrackDriftDatasource _datasource;

  TrackDriftRepositoryImpl(this._datasource);

  @override
  Future<Either<Failure, List<Track>>> get(
    TrackDriftFilterQuery? params,
  ) async {
    try {
      final result = await _datasource.get(params);
      return Right(result);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<String>>> getGroupTitle(
    TrackDriftFilterQuery? params,
  ) async {
    try {
      final result = await _datasource.getGroupTitle(params);
      return Right(result);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, int>> count(TrackDriftFilterQuery? params) async {
    try {
      final result = await _datasource.count(params);
      return Right(result);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }
}
