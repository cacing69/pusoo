import 'package:dartz/dartz.dart';
import 'package:logger/logger.dart';
import 'package:pusoo/core/errors/failure.dart';
import 'package:pusoo/core/utils/usecase.dart';
import 'package:pusoo/features/track/domain/models/get_track_group_titles_params.dart';
import 'package:pusoo/features/track/domain/repostiory/track_repository.dart';

class GetTrackGroupTitlesUsecase
    implements UseCase<List<String>, GetTrackGroupTitlesParams> {
  final TrackRepository _repository;
  final Logger _log;

  GetTrackGroupTitlesUsecase(this._repository, this._log);

  @override
  Future<Either<Failure, List<String>>> call(
    GetTrackGroupTitlesParams? params,
  ) async {
    _log.i(params);

    final result = await _repository.getGroupTitle(params);

    // result.fold((failure) {}, (tracks) {});

    return result;
  }
}
