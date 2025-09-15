import 'package:dartz/dartz.dart';
import 'package:logger/logger.dart';
import 'package:pusoo/core/errors/failure.dart';
import 'package:pusoo/core/utils/usecase.dart';
import 'package:pusoo/features/tv/domain/models/get_tv_tracks_params.dart';
import 'package:pusoo/features/tv/domain/repository/tv_local_repository.dart';
import 'package:pusoo/shared/data/models/track.dart';

class GetTvTracksUsecase implements UseCase<List<Track>, GetTvTracksParams> {
  final TvLocalRepository _repository;
  final Logger _log;

  GetTvTracksUsecase(this._repository, this._log);

  @override
  Future<Either<Failure, List<Track>>> call(GetTvTracksParams? params) async {
    _log.i("GetTvTracksUsecase:_repository.getTvTracks");

    final result = await _repository.getTvTracks(params);

    result.fold(
      (failure) {
        // Skenario 1: Operasi GAGAL
        // `failure` adalah objek Failure
        _log.e("GetTvTracksUsecase: Failed with error: ${failure.toString()}");
        // Kamu bisa log properti spesifik dari Failure, misal:
        // _log.e("Error message: ${failure.message}");
      },
      (tracks) {
        // Skenario 2: Operasi SUKSES
        // `tracks` adalah List<Track>
        _log.i(
          "GetTvTracksUsecase: Successfully fetched ${tracks.length} tracks.",
        );
        // Kamu bisa log data spesifik, misal:
        // _log.d("First track name: ${tracks.first.name}");
      },
    );

    return result;
  }
}
