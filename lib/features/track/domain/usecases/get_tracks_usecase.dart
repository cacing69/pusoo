import 'package:dartz/dartz.dart';
import 'package:logger/logger.dart';
import 'package:pusoo/core/errors/failure.dart';
import 'package:pusoo/core/utils/usecase.dart';
import 'package:pusoo/features/track/domain/models/track_filter_query.dart';
import 'package:pusoo/features/track/domain/repostiory/track_repository.dart';
import 'package:pusoo/features/track/domain/models/track.dart';

class GetTracksUsecase implements UseCase<List<Track>, TrackFilterQuery> {
  final TrackRepository _repository;
  final Logger _log;

  GetTracksUsecase(this._repository, this._log);

  @override
  Future<Either<Failure, List<Track>>> call(TrackFilterQuery? params) async {
    _log.i("GetTracksUsecase:_repository.getTvTracks");
    _log.i(params);

    final result = await _repository.get(params);

    result.fold(
      (failure) {
        // Skenario 1: Operasi GAGAL
        // `failure` adalah objek Failure
        _log.e("GetTracksUsecase: Failed with error: ${failure.toString()}");
        // Kamu bisa log properti spesifik dari Failure, misal:
        // _log.e("Error message: ${failure.message}");
      },
      (tracks) {
        // Skenario 2: Operasi SUKSES
        // `tracks` adalah List<Track>
        _log.i(
          "GetTracksUsecase: Successfully fetched ${tracks.length} tracks.",
        );
        // Kamu bisa log data spesifik, misal:
        // _log.d("First track name: ${tracks.first.name}");
      },
    );

    return result;
  }
}
