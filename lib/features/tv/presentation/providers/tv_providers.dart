import 'package:pusoo/features/tv/data/datasources/tv_local_datasource.dart';
import 'package:pusoo/features/tv/data/datasources/tv_local_datasource_impl.dart';
import 'package:pusoo/features/tv/data/repository_impl/tv_local_repository_impl.dart';
import 'package:pusoo/features/tv/domain/repository/tv_local_repository.dart';
import 'package:pusoo/features/tv/domain/usecases/get_tv_tracks_usecase.dart';
import 'package:pusoo/shared/presentation/providers/logger_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'tv_providers.g.dart';

@riverpod
TvLocalDatasource tvLocalDatasource(Ref ref) {
  return TvLocalDatasourceImpl(ref.read(loggerProvider));
}

@riverpod
TvLocalRepository tvLocalRepository(Ref ref) {
  return TvLocalRepositoryImpl(ref.read(tvLocalDatasourceProvider));
}

// USE CASE
@riverpod
GetTvTracksUsecase getTvTracksUsecase(Ref ref) {
  return GetTvTracksUsecase(
    ref.read(tvLocalRepositoryProvider),
    ref.read(loggerProvider),
  );
}
