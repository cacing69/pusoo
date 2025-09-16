import 'package:dartz/dartz.dart';
import 'package:pusoo/core/errors/failure.dart';
import 'package:pusoo/features/track/data/datasources/local/track_drift_datasource.dart';
import 'package:pusoo/features/track/domain/models/get_track_group_titles_params.dart';
import 'package:pusoo/features/track/domain/repostiory/track_repository.dart';
import 'package:pusoo/features/track/domain/models/get_tracks_params.dart';
import 'package:pusoo/shared/data/models/track.dart';

class TrackDriftRepositoryImpl implements TrackRepository {
  final TrackDriftDatasource _datasource;

  TrackDriftRepositoryImpl(this._datasource);

  @override
  Future<Either<Failure, List<Track>>> get(GetTracksParams? params) async {
    try {
      final result = await _datasource.get(params);
      return Right(result);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<String>>> getGroupTitle(
    GetTrackGroupTitlesParams? params,
  ) async {
    try {
      final result = await _datasource.getGroupTitle(params);
      return Right(result);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }
}
