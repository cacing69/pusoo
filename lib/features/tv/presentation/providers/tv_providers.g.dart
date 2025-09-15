// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tv_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(tvLocalDatasource)
const tvLocalDatasourceProvider = TvLocalDatasourceProvider._();

final class TvLocalDatasourceProvider
    extends
        $FunctionalProvider<
          TvLocalDatasource,
          TvLocalDatasource,
          TvLocalDatasource
        >
    with $Provider<TvLocalDatasource> {
  const TvLocalDatasourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'tvLocalDatasourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$tvLocalDatasourceHash();

  @$internal
  @override
  $ProviderElement<TvLocalDatasource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  TvLocalDatasource create(Ref ref) {
    return tvLocalDatasource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TvLocalDatasource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TvLocalDatasource>(value),
    );
  }
}

String _$tvLocalDatasourceHash() => r'ade060202c1c875ae14652fcbeccea64ddba9e4c';

@ProviderFor(tvLocalRepository)
const tvLocalRepositoryProvider = TvLocalRepositoryProvider._();

final class TvLocalRepositoryProvider
    extends
        $FunctionalProvider<
          TvLocalRepository,
          TvLocalRepository,
          TvLocalRepository
        >
    with $Provider<TvLocalRepository> {
  const TvLocalRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'tvLocalRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$tvLocalRepositoryHash();

  @$internal
  @override
  $ProviderElement<TvLocalRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  TvLocalRepository create(Ref ref) {
    return tvLocalRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TvLocalRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TvLocalRepository>(value),
    );
  }
}

String _$tvLocalRepositoryHash() => r'dc87983f8d5f580942d3745bc1a88862a40ced23';

@ProviderFor(getTvTracksUsecase)
const getTvTracksUsecaseProvider = GetTvTracksUsecaseProvider._();

final class GetTvTracksUsecaseProvider
    extends
        $FunctionalProvider<
          GetTvTracksUsecase,
          GetTvTracksUsecase,
          GetTvTracksUsecase
        >
    with $Provider<GetTvTracksUsecase> {
  const GetTvTracksUsecaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getTvTracksUsecaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getTvTracksUsecaseHash();

  @$internal
  @override
  $ProviderElement<GetTvTracksUsecase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  GetTvTracksUsecase create(Ref ref) {
    return getTvTracksUsecase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetTvTracksUsecase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetTvTracksUsecase>(value),
    );
  }
}

String _$getTvTracksUsecaseHash() =>
    r'9dbc0ee699cb8cc60de1bfe986a70026c52b7408';
