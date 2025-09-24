// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_tracks_filter_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(MovieTracksFilterNotifier)
const movieTracksFilterProvider = MovieTracksFilterNotifierProvider._();

final class MovieTracksFilterNotifierProvider
    extends $NotifierProvider<MovieTracksFilterNotifier, TrackFilterQuery> {
  const MovieTracksFilterNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'movieTracksFilterProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$movieTracksFilterNotifierHash();

  @$internal
  @override
  MovieTracksFilterNotifier create() => MovieTracksFilterNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TrackFilterQuery value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TrackFilterQuery>(value),
    );
  }
}

String _$movieTracksFilterNotifierHash() =>
    r'74086a6a083be262b3862b00782f148d1954d179';

abstract class _$MovieTracksFilterNotifier extends $Notifier<TrackFilterQuery> {
  TrackFilterQuery build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<TrackFilterQuery, TrackFilterQuery>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<TrackFilterQuery, TrackFilterQuery>,
              TrackFilterQuery,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
