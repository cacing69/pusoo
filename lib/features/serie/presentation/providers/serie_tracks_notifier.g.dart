// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'serie_tracks_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(SerieTracksNotifier)
const serieTracksProvider = SerieTracksNotifierProvider._();

final class SerieTracksNotifierProvider
    extends $NotifierProvider<SerieTracksNotifier, AsyncValue<List<Track>?>> {
  const SerieTracksNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'serieTracksProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$serieTracksNotifierHash();

  @$internal
  @override
  SerieTracksNotifier create() => SerieTracksNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AsyncValue<List<Track>?> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AsyncValue<List<Track>?>>(value),
    );
  }
}

String _$serieTracksNotifierHash() =>
    r'159d183d54b57827d82f688ca06d46968ce17d97';

abstract class _$SerieTracksNotifier
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
