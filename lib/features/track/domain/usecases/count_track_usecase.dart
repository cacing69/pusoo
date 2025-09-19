import 'package:dartz/dartz.dart';
import 'package:logger/logger.dart';
import 'package:pusoo/core/errors/failure.dart';
import 'package:pusoo/core/utils/usecase.dart';
import 'package:pusoo/features/track/domain/models/track_filter_query.dart';
import 'package:pusoo/features/track/domain/repostiory/track_repository.dart';

class CountTrackUsecase implements UseCase<int, TrackFilterQuery> {
  final TrackRepository _repository;
  final Logger _log;

  CountTrackUsecase(this._repository, this._log);

  @override
  Future<Either<Failure, int>> call(TrackFilterQuery? params) async {
    _log.i(params);

    final result = await _repository.count(params);

    return result;
  }
}
