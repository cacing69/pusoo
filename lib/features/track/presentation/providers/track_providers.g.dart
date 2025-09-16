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

@ProviderFor(getTrackGroupTitlesUsecase)
const getTrackGroupTitlesUsecaseProvider =
    GetTrackGroupTitlesUsecaseProvider._();

final class GetTrackGroupTitlesUsecaseProvider
    extends
        $FunctionalProvider<
          GetTrackGroupTitlesUsecase,
          GetTrackGroupTitlesUsecase,
          GetTrackGroupTitlesUsecase
        >
    with $Provider<GetTrackGroupTitlesUsecase> {
  const GetTrackGroupTitlesUsecaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getTrackGroupTitlesUsecaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getTrackGroupTitlesUsecaseHash();

  @$internal
  @override
  $ProviderElement<GetTrackGroupTitlesUsecase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  GetTrackGroupTitlesUsecase create(Ref ref) {
    return getTrackGroupTitlesUsecase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetTrackGroupTitlesUsecase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetTrackGroupTitlesUsecase>(value),
    );
  }
}

String _$getTrackGroupTitlesUsecaseHash() =>
    r'd98d23569d410113c32f292ddb67b5abc08608b9';
