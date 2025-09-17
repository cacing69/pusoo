import 'package:dartz/dartz.dart';
import 'package:logger/logger.dart';
import 'package:pusoo/core/errors/failure.dart';
import 'package:pusoo/core/utils/usecase.dart';
import 'package:pusoo/features/track/domain/models/track_drift_filter_query.dart';
import 'package:pusoo/features/track/domain/repostiory/track_repository.dart';

class GetTrackGroupTitlesUsecase
    implements UseCase<List<String>, TrackDriftFilterQuery> {
  final TrackRepository _repository;
  final Logger _log;

  GetTrackGroupTitlesUsecase(this._repository, this._log);

  @override
  Future<Either<Failure, List<String>>> call(
    TrackDriftFilterQuery? params,
  ) async {
    _log.i(params);

    final result = await _repository.getGroupTitle(params);

    // result.fold((failure) {}, (tracks) {});

    return result;
  }
}
