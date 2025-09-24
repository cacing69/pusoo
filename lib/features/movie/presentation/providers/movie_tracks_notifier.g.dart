// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_tracks_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(MovieTracksNotifier)
const movieTracksProvider = MovieTracksNotifierProvider._();

final class MovieTracksNotifierProvider
    extends $NotifierProvider<MovieTracksNotifier, AsyncValue<List<Track>?>> {
  const MovieTracksNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'movieTracksProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$movieTracksNotifierHash();

  @$internal
  @override
  MovieTracksNotifier create() => MovieTracksNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AsyncValue<List<Track>?> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AsyncValue<List<Track>?>>(value),
    );
  }
}

String _$movieTracksNotifierHash() =>
    r'10cb98d80a7938b15408ee8b97275a239b06b2a4';

abstract class _$MovieTracksNotifier
    extends $Notifier<AsyncValue<List<Track>?>> {
  AsyncValue<List<Track>?> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref as $Ref<AsyncValue<List<Track>?>, AsyncValue<List<Track>?>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<Track>?>, AsyncValue<List<Track>?>>,
              AsyncValue<List<Track>?>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
