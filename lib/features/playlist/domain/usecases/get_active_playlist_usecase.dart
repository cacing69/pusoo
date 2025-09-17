import 'package:dartz/dartz.dart';
import 'package:logger/logger.dart';
import 'package:pusoo/core/errors/failure.dart';
import 'package:pusoo/core/utils/usecase.dart';
import 'package:pusoo/features/playlist/domain/models/playlist.dart';
import 'package:pusoo/features/playlist/domain/repostiory/playlist_repository.dart';

class GetActivePlaylistUsecase implements UseCase<Playlist, NoParams> {
  final PlaylistRepository _repository;
  final Logger _log;

  GetActivePlaylistUsecase(this._repository, this._log);

  @override
  Future<Either<Failure, Playlist>> call(NoParams? params) async {
    _log.i("GetActivePlaylistUsecase:_repository.getTvTracks");
    _log.i(params);

    final result = await _repository.getActive();

    result.fold(
      (failure) {
        // Skenario 1: Operasi GAGAL
        _log.e(
          "GetActivePlaylistUsecase: Failed with error: ${failure.message}",
        );
      },
      (tracks) {
        // Skenario 2: Operasi SUKSES
        _log.i("GetActivePlaylistUsecase: Successfully fetched");
      },
    );

    return result;
  }
}
