// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tv_tracks_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(TvTracksNotifier)
const tvTracksProvider = TvTracksNotifierProvider._();

final class TvTracksNotifierProvider
    extends $NotifierProvider<TvTracksNotifier, AsyncValue<List<Track>?>> {
  const TvTracksNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'tvTracksProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$tvTracksNotifierHash();

  @$internal
  @override
  TvTracksNotifier create() => TvTracksNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AsyncValue<List<Track>?> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AsyncValue<List<Track>?>>(value),
    );
  }
}

String _$tvTracksNotifierHash() => r'3bfd3f38075045ce6b60b7b7058e324df374b4d4';

abstract class _$TvTracksNotifier extends $Notifier<AsyncValue<List<Track>?>> {
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
