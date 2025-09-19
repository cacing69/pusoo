// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(tmdbClient)
const tmdbClientProvider = TmdbClientProvider._();

final class TmdbClientProvider
    extends $FunctionalProvider<TMDBClient, TMDBClient, TMDBClient>
    with $Provider<TMDBClient> {
  const TmdbClientProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'tmdbClientProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$tmdbClientHash();

  @$internal
  @override
  $ProviderElement<TMDBClient> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  TMDBClient create(Ref ref) {
    return tmdbClient(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TMDBClient value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TMDBClient>(value),
    );
  }
}

String _$tmdbClientHash() => r'94c2cdcce211024d16b498d405d00d386bfd4cc4';

@ProviderFor(openSubtitlesClient)
const openSubtitlesClientProvider = OpenSubtitlesClientProvider._();

final class OpenSubtitlesClientProvider
    extends
        $FunctionalProvider<
          OpenSubtitlesClient,
          OpenSubtitlesClient,
          OpenSubtitlesClient
        >
    with $Provider<OpenSubtitlesClient> {
  const OpenSubtitlesClientProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'openSubtitlesClientProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$openSubtitlesClientHash();

  @$internal
  @override
  $ProviderElement<OpenSubtitlesClient> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  OpenSubtitlesClient create(Ref ref) {
    return openSubtitlesClient(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(OpenSubtitlesClient value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<OpenSubtitlesClient>(value),
    );
  }
}

String _$openSubtitlesClientHash() =>
    r'a804e01c24f769f86ae878c2ae81be15055c72cf';
