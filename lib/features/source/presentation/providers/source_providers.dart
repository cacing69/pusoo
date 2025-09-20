import 'package:pusoo/features/source/data/datasource/source_drift_datasource_impl.dart';
import 'package:pusoo/features/source/data/repository_impl/source_drift_repository_impl.dart';
import 'package:pusoo/features/source/domain/usecases/get_active_source_usecase.dart';
import 'package:pusoo/shared/presentation/providers/logger_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'source_providers.g.dart';

@riverpod
SourceDriftDatasourceImpl sourceDriftDatasource(Ref ref) {
  return SourceDriftDatasourceImpl(ref.read(loggerProvider));
}

@riverpod
SourceDriftRepositoryImpl sourceDriftRepository(Ref ref) {
  return SourceDriftRepositoryImpl(ref.read(sourceDriftDatasourceProvider));
}

// // USE CASE
@riverpod
GetActiveSourceUsecase getActiveSourceUsecase(Ref ref) {
  return GetActiveSourceUsecase(
    ref.read(sourceDriftRepositoryProvider),
    ref.read(loggerProvider),
  );
}
