/*
 * Pusoo - IPTV Player
 * Copyright (C) 2025 Ibnul Mutaki <ibnuul@gmail.com>
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
 * See the GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program. If not, see <https://www.gnu.org/licenses/>.
 */


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
