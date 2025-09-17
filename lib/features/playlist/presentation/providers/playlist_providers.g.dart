// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'playlist_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(playlistDriftDatasource)
const playlistDriftDatasourceProvider = PlaylistDriftDatasourceProvider._();

final class PlaylistDriftDatasourceProvider
    extends
        $FunctionalProvider<
          PlaylistDriftDatasourceImpl,
          PlaylistDriftDatasourceImpl,
          PlaylistDriftDatasourceImpl
        >
    with $Provider<PlaylistDriftDatasourceImpl> {
  const PlaylistDriftDatasourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'playlistDriftDatasourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$playlistDriftDatasourceHash();

  @$internal
  @override
  $ProviderElement<PlaylistDriftDatasourceImpl> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  PlaylistDriftDatasourceImpl create(Ref ref) {
    return playlistDriftDatasource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PlaylistDriftDatasourceImpl value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PlaylistDriftDatasourceImpl>(value),
    );
  }
}

String _$playlistDriftDatasourceHash() =>
    r'e094e7d93e6721233ba2f511a6134ead1a41b0bd';

@ProviderFor(playlistDriftRepository)
const playlistDriftRepositoryProvider = PlaylistDriftRepositoryProvider._();

final class PlaylistDriftRepositoryProvider
    extends
        $FunctionalProvider<
          PlaylistDriftRepositoryImpl,
          PlaylistDriftRepositoryImpl,
          PlaylistDriftRepositoryImpl
        >
    with $Provider<PlaylistDriftRepositoryImpl> {
  const PlaylistDriftRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'playlistDriftRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$playlistDriftRepositoryHash();

  @$internal
  @override
  $ProviderElement<PlaylistDriftRepositoryImpl> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  PlaylistDriftRepositoryImpl create(Ref ref) {
    return playlistDriftRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PlaylistDriftRepositoryImpl value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PlaylistDriftRepositoryImpl>(value),
    );
  }
}

String _$playlistDriftRepositoryHash() =>
    r'2c3462e0133d3571936bb77f90afcd5cbb939497';

@ProviderFor(getActivePlaylistUsecase)
const getActivePlaylistUsecaseProvider = GetActivePlaylistUsecaseProvider._();

final class GetActivePlaylistUsecaseProvider
    extends
        $FunctionalProvider<
          GetActivePlaylistUsecase,
          GetActivePlaylistUsecase,
          GetActivePlaylistUsecase
        >
    with $Provider<GetActivePlaylistUsecase> {
  const GetActivePlaylistUsecaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getActivePlaylistUsecaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getActivePlaylistUsecaseHash();

  @$internal
  @override
  $ProviderElement<GetActivePlaylistUsecase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  GetActivePlaylistUsecase create(Ref ref) {
    return getActivePlaylistUsecase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetActivePlaylistUsecase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetActivePlaylistUsecase>(value),
    );
  }
}

String _$getActivePlaylistUsecaseHash() =>
    r'f34defcdd71e4eeedc0193acc94359d285027ef3';
