// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_track_count_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(MovieTrackCountNotifier)
const movieTrackCountProvider = MovieTrackCountNotifierProvider._();

final class MovieTrackCountNotifierProvider
    extends $NotifierProvider<MovieTrackCountNotifier, AsyncValue<int?>> {
  const MovieTrackCountNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'movieTrackCountProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$movieTrackCountNotifierHash();

  @$internal
  @override
  MovieTrackCountNotifier create() => MovieTrackCountNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AsyncValue<int?> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AsyncValue<int?>>(value),
    );
  }
}

String _$movieTrackCountNotifierHash() =>
    r'cc88a01f6fc52196ca0503bcadb649a084469cf8';

abstract class _$MovieTrackCountNotifier extends $Notifier<AsyncValue<int?>> {
  AsyncValue<int?> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<int?>, AsyncValue<int?>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<int?>, AsyncValue<int?>>,
              AsyncValue<int?>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
