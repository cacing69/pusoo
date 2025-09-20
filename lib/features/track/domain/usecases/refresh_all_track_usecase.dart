import 'package:dartz/dartz.dart';
import 'package:pusoo/core/errors/failure.dart';
import 'package:pusoo/core/utils/usecase.dart';
import 'package:pusoo/features/tv/presentation/providers/tv_tracks_filter_notifier.dart';
import 'package:pusoo/features/tv/presentation/providers/tv_tracks_paging_notifier.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

class RefreshAllTrackUsecase implements UseCase<void, NoParams> {
  final Ref ref;

  RefreshAllTrackUsecase(this.ref);

  @override
  Future<Either<Failure, void>> call(NoParams? params) async {
    // REFRESH HOME
    ref.read(tvTracksFilterProvider.notifier).reset();
    ref.read(tvTracksPagingProvider).refresh();

    // MOVIE

    // SERIES

    return Right(null);
  }
}
