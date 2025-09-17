import 'package:pusoo/features/playlist/data/datasources/local/playlist_drift_datasource_impl.dart';
import 'package:pusoo/features/playlist/data/repository_impl/playlist_drift_repository_impl.dart';
import 'package:pusoo/features/playlist/domain/usecases/get_active_playlist_usecase.dart';
import 'package:pusoo/shared/presentation/providers/logger_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'playlist_providers.g.dart';

@riverpod
PlaylistDriftDatasourceImpl playlistDriftDatasource(Ref ref) {
  return PlaylistDriftDatasourceImpl(ref.read(loggerProvider));
}

@riverpod
PlaylistDriftRepositoryImpl playlistDriftRepository(Ref ref) {
  return PlaylistDriftRepositoryImpl(ref.read(playlistDriftDatasourceProvider));
}

// USE CASE
@riverpod
GetActivePlaylistUsecase getActivePlaylistUsecase(Ref ref) {
  return GetActivePlaylistUsecase(
    ref.read(playlistDriftRepositoryProvider),
    ref.read(loggerProvider),
  );
}
