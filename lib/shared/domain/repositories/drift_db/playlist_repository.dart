import 'package:dartz/dartz.dart';
import 'package:media_kit/media_kit.dart';
import 'package:pusoo/core/errors/failure.dart';
import 'package:pusoo/shared/data/datasources/local/drift_database.dart';

abstract class PlaylistRepository {
  Future<Either<Failure, List<Playlist>>> get();
  Future<Either<Failure, Playlist>> getActivePlaylist();
}
