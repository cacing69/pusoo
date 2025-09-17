import 'package:pusoo/features/track/data/datasources/local/track_drift_datasource_impl.dart';
import 'package:pusoo/features/track/data/repository_impl/track_drift_repository_impl.dart';
import 'package:pusoo/features/track/domain/usecases/count_track_usecase.dart';
import 'package:pusoo/features/track/domain/usecases/get_group_titles_track_usecase.dart';
import 'package:pusoo/features/track/domain/usecases/get_tracks_usecase.dart';
import 'package:pusoo/shared/presentation/providers/logger_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'track_providers.g.dart';

@riverpod
TrackDriftDatasourceImpl trackDriftDatasource(Ref ref) {
  return TrackDriftDatasourceImpl(ref.read(loggerProvider));
}

@riverpod
TrackDriftRepositoryImpl trackDriftRepository(Ref ref) {
  return TrackDriftRepositoryImpl(ref.read(trackDriftDatasourceProvider));
}

// USE CASE
@riverpod
GetTracksUsecase getTracksUsecase(Ref ref) {
  return GetTracksUsecase(
    ref.read(trackDriftRepositoryProvider),
    ref.read(loggerProvider),
  );
}

@riverpod
GetGroupTitlesTrackUsecase getGroupTitlesTrackUsecase(Ref ref) {
  return GetGroupTitlesTrackUsecase(
    ref.read(trackDriftRepositoryProvider),
    ref.read(loggerProvider),
  );
}

@riverpod
CountTrackUsecase countTrackUsecase(Ref ref) {
  return CountTrackUsecase(
    ref.read(trackDriftRepositoryProvider),
    ref.read(loggerProvider),
  );
}
