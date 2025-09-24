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
