import 'package:dartz/dartz.dart';
import 'package:pusoo/core/errors/failure.dart';
import 'package:pusoo/features/tv/data/datasources/tv_local_datasource.dart';
import 'package:pusoo/features/tv/domain/models/get_tv_tracks_params.dart';
import 'package:pusoo/features/tv/domain/repository/tv_local_repository.dart';
import 'package:pusoo/shared/data/models/track.dart';

class TvLocalRepositoryImpl implements TvLocalRepository {
  final TvLocalDatasource _tvLocalDatasource;

  TvLocalRepositoryImpl(this._tvLocalDatasource);

  @override
  Future<Either<Failure, List<Track>>> getTvTracks(
    GetTvTracksParams? params,
  ) async {
    try {
      final result = await _tvLocalDatasource.getTvTracks(params);
      return Right(result);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }
}
