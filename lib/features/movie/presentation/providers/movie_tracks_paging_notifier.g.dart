// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_tracks_paging_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(MovieTracksPagingNotifier)
const movieTracksPagingProvider = MovieTracksPagingNotifierProvider._();

final class MovieTracksPagingNotifierProvider
    extends
        $NotifierProvider<
          MovieTracksPagingNotifier,
          PagingController<int, Track>
        > {
  const MovieTracksPagingNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'movieTracksPagingProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$movieTracksPagingNotifierHash();

  @$internal
  @override
  MovieTracksPagingNotifier create() => MovieTracksPagingNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PagingController<int, Track> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PagingController<int, Track>>(value),
    );
  }
}

String _$movieTracksPagingNotifierHash() =>
    r'ff078467c8a590de5c00bbb1abd66aa671672177';

abstract class _$MovieTracksPagingNotifier
    extends $Notifier<PagingController<int, Track>> {
  PagingController<int, Track> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref
            as $Ref<PagingController<int, Track>, PagingController<int, Track>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                PagingController<int, Track>,
                PagingController<int, Track>
              >,
              PagingController<int, Track>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
