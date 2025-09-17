import 'package:dartz/dartz.dart';
import 'package:pusoo/core/errors/failure.dart';
import 'package:pusoo/features/playlist/data/datasources/local/playlist_datasource.dart';
import 'package:pusoo/features/playlist/domain/models/playlist.dart';
import 'package:pusoo/features/playlist/domain/repostiory/playlist_repository.dart';

class PlaylistDriftRepositoryImpl implements PlaylistRepository {
  final PlaylistDatasource _datasource;

  PlaylistDriftRepositoryImpl(this._datasource);

  @override
  Future<Either<Failure, Playlist>> getActive() async {
    try {
      final result = await _datasource.getActive();
      return Right(result);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }
}
