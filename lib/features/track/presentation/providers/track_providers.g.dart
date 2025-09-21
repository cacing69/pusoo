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

part of 'track_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(trackDriftDatasource)
const trackDriftDatasourceProvider = TrackDriftDatasourceProvider._();

final class TrackDriftDatasourceProvider
    extends
        $FunctionalProvider<
          TrackDriftDatasourceImpl,
          TrackDriftDatasourceImpl,
          TrackDriftDatasourceImpl
        >
    with $Provider<TrackDriftDatasourceImpl> {
  const TrackDriftDatasourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'trackDriftDatasourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$trackDriftDatasourceHash();

  @$internal
  @override
  $ProviderElement<TrackDriftDatasourceImpl> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  TrackDriftDatasourceImpl create(Ref ref) {
    return trackDriftDatasource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TrackDriftDatasourceImpl value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TrackDriftDatasourceImpl>(value),
    );
  }
}

String _$trackDriftDatasourceHash() =>
    r'154527a9ee176cd1f2bc9b88cf863293ac054ce4';

@ProviderFor(trackDriftRepository)
const trackDriftRepositoryProvider = TrackDriftRepositoryProvider._();

final class TrackDriftRepositoryProvider
    extends
        $FunctionalProvider<
          TrackDriftRepositoryImpl,
          TrackDriftRepositoryImpl,
          TrackDriftRepositoryImpl
        >
    with $Provider<TrackDriftRepositoryImpl> {
  const TrackDriftRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'trackDriftRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$trackDriftRepositoryHash();

  @$internal
  @override
  $ProviderElement<TrackDriftRepositoryImpl> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  TrackDriftRepositoryImpl create(Ref ref) {
    return trackDriftRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TrackDriftRepositoryImpl value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TrackDriftRepositoryImpl>(value),
    );
  }
}

String _$trackDriftRepositoryHash() =>
    r'cf3ac0051b17e772d5f3689c0090009582e99619';

@ProviderFor(getTracksUsecase)
const getTracksUsecaseProvider = GetTracksUsecaseProvider._();

final class GetTracksUsecaseProvider
    extends
        $FunctionalProvider<
          GetTracksUsecase,
          GetTracksUsecase,
          GetTracksUsecase
        >
    with $Provider<GetTracksUsecase> {
  const GetTracksUsecaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getTracksUsecaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getTracksUsecaseHash();

  @$internal
  @override
  $ProviderElement<GetTracksUsecase> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  GetTracksUsecase create(Ref ref) {
    return getTracksUsecase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetTracksUsecase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetTracksUsecase>(value),
    );
  }
}

String _$getTracksUsecaseHash() => r'1b06e1d6803650a6f823683a148f09a5b0b2705c';

@ProviderFor(getGroupTitlesTrackUsecase)
const getGroupTitlesTrackUsecaseProvider =
    GetGroupTitlesTrackUsecaseProvider._();

final class GetGroupTitlesTrackUsecaseProvider
    extends
        $FunctionalProvider<
          GetGroupTitlesTrackUsecase,
          GetGroupTitlesTrackUsecase,
          GetGroupTitlesTrackUsecase
        >
    with $Provider<GetGroupTitlesTrackUsecase> {
  const GetGroupTitlesTrackUsecaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getGroupTitlesTrackUsecaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getGroupTitlesTrackUsecaseHash();

  @$internal
  @override
  $ProviderElement<GetGroupTitlesTrackUsecase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  GetGroupTitlesTrackUsecase create(Ref ref) {
    return getGroupTitlesTrackUsecase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetGroupTitlesTrackUsecase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetGroupTitlesTrackUsecase>(value),
    );
  }
}

String _$getGroupTitlesTrackUsecaseHash() =>
    r'5d3b9088039e42c8b1dc0948cd7a5dd61e62fc12';

@ProviderFor(countTrackUsecase)
const countTrackUsecaseProvider = CountTrackUsecaseProvider._();

final class CountTrackUsecaseProvider
    extends
        $FunctionalProvider<
          CountTrackUsecase,
          CountTrackUsecase,
          CountTrackUsecase
        >
    with $Provider<CountTrackUsecase> {
  const CountTrackUsecaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'countTrackUsecaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$countTrackUsecaseHash();

  @$internal
  @override
  $ProviderElement<CountTrackUsecase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  CountTrackUsecase create(Ref ref) {
    return countTrackUsecase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CountTrackUsecase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CountTrackUsecase>(value),
    );
  }
}

String _$countTrackUsecaseHash() => r'70e90d2d3fce13160f19313eda8efdd68252d76f';

@ProviderFor(refreshAllTrackUsecase)
const refreshAllTrackUsecaseProvider = RefreshAllTrackUsecaseProvider._();

final class RefreshAllTrackUsecaseProvider
    extends
        $FunctionalProvider<
          RefreshAllTrackUsecase,
          RefreshAllTrackUsecase,
          RefreshAllTrackUsecase
        >
    with $Provider<RefreshAllTrackUsecase> {
  const RefreshAllTrackUsecaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'refreshAllTrackUsecaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$refreshAllTrackUsecaseHash();

  @$internal
  @override
  $ProviderElement<RefreshAllTrackUsecase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  RefreshAllTrackUsecase create(Ref ref) {
    return refreshAllTrackUsecase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(RefreshAllTrackUsecase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<RefreshAllTrackUsecase>(value),
    );
  }
}

String _$refreshAllTrackUsecaseHash() =>
    r'1367a0dd6c202a88547252d14e3a6a89aaab8374';
