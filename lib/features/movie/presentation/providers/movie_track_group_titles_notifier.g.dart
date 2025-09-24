// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_track_group_titles_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(MovieTrackGroupTitlesNotifier)
const movieTrackGroupTitlesProvider = MovieTrackGroupTitlesNotifierProvider._();

final class MovieTrackGroupTitlesNotifierProvider
    extends
        $NotifierProvider<
          MovieTrackGroupTitlesNotifier,
          AsyncValue<List<String>?>
        > {
  const MovieTrackGroupTitlesNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'movieTrackGroupTitlesProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$movieTrackGroupTitlesNotifierHash();

  @$internal
  @override
  MovieTrackGroupTitlesNotifier create() => MovieTrackGroupTitlesNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AsyncValue<List<String>?> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AsyncValue<List<String>?>>(value),
    );
  }
}

String _$movieTrackGroupTitlesNotifierHash() =>
    r'c9c15a5cbde5e70ed6c9ed40b871cab2d47d33f5';

abstract class _$MovieTrackGroupTitlesNotifier
    extends $Notifier<AsyncValue<List<String>?>> {
  AsyncValue<List<String>?> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref as $Ref<AsyncValue<List<String>?>, AsyncValue<List<String>?>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<String>?>, AsyncValue<List<String>?>>,
              AsyncValue<List<String>?>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
