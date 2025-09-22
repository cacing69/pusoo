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


// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'source_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(sourceDriftDatasource)
const sourceDriftDatasourceProvider = SourceDriftDatasourceProvider._();

final class SourceDriftDatasourceProvider
    extends
        $FunctionalProvider<
          SourceDriftDatasourceImpl,
          SourceDriftDatasourceImpl,
          SourceDriftDatasourceImpl
        >
    with $Provider<SourceDriftDatasourceImpl> {
  const SourceDriftDatasourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'sourceDriftDatasourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$sourceDriftDatasourceHash();

  @$internal
  @override
  $ProviderElement<SourceDriftDatasourceImpl> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  SourceDriftDatasourceImpl create(Ref ref) {
    return sourceDriftDatasource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SourceDriftDatasourceImpl value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SourceDriftDatasourceImpl>(value),
    );
  }
}

String _$sourceDriftDatasourceHash() =>
    r'ea0337abed2991bc1b22e23aec588cfced22409c';

@ProviderFor(sourceDriftRepository)
const sourceDriftRepositoryProvider = SourceDriftRepositoryProvider._();

final class SourceDriftRepositoryProvider
    extends
        $FunctionalProvider<
          SourceDriftRepositoryImpl,
          SourceDriftRepositoryImpl,
          SourceDriftRepositoryImpl
        >
    with $Provider<SourceDriftRepositoryImpl> {
  const SourceDriftRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'sourceDriftRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$sourceDriftRepositoryHash();

  @$internal
  @override
  $ProviderElement<SourceDriftRepositoryImpl> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  SourceDriftRepositoryImpl create(Ref ref) {
    return sourceDriftRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SourceDriftRepositoryImpl value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SourceDriftRepositoryImpl>(value),
    );
  }
}

String _$sourceDriftRepositoryHash() =>
    r'dc6dc4d18bf7876c6585ba5fe4280dcfcc0b99d3';

@ProviderFor(getActiveSourceUsecase)
const getActiveSourceUsecaseProvider = GetActiveSourceUsecaseProvider._();

final class GetActiveSourceUsecaseProvider
    extends
        $FunctionalProvider<
          GetActiveSourceUsecase,
          GetActiveSourceUsecase,
          GetActiveSourceUsecase
        >
    with $Provider<GetActiveSourceUsecase> {
  const GetActiveSourceUsecaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getActiveSourceUsecaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getActiveSourceUsecaseHash();

  @$internal
  @override
  $ProviderElement<GetActiveSourceUsecase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  GetActiveSourceUsecase create(Ref ref) {
    return getActiveSourceUsecase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetActiveSourceUsecase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetActiveSourceUsecase>(value),
    );
  }
}

String _$getActiveSourceUsecaseHash() =>
    r'86641409b418c0a2eea7ec305b4c91872ba592ee';
