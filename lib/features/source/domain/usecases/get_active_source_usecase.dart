import 'package:dartz/dartz.dart';
import 'package:logger/logger.dart';
import 'package:pusoo/core/errors/failure.dart';
import 'package:pusoo/core/utils/usecase.dart';
import 'package:pusoo/features/source/domain/entities/source.dart';
import 'package:pusoo/features/source/domain/repository/source_repository.dart';

class GetActiveSourceUsecase implements UseCase<Source, NoParams> {
  final SourceRepository _repository;
  final Logger _log;

  GetActiveSourceUsecase(this._repository, this._log);

  @override
  Future<Either<Failure, Source>> call(NoParams? params) async {
    _log.i("GetActiveSourceUsecase:_repository.getTvTracks");
    _log.i(params);

    final result = await _repository.getActive();

    result.fold(
      (failure) {
        // Skenario 1: Operasi GAGAL
        _log.e("GetActiveSourceUsecase: Failed with error: ${failure.message}");
      },
      (tracks) {
        // Skenario 2: Operasi SUKSES
        _log.i("GetActiveSourceUsecase: Successfully fetched");
      },
    );

    return result;
  }
}
