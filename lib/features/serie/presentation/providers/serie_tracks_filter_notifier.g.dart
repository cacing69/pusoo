// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'serie_tracks_filter_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(SerieTracksFilterNotifier)
const serieTracksFilterProvider = SerieTracksFilterNotifierProvider._();

final class SerieTracksFilterNotifierProvider
    extends $NotifierProvider<SerieTracksFilterNotifier, TrackFilterQuery> {
  const SerieTracksFilterNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'serieTracksFilterProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$serieTracksFilterNotifierHash();

  @$internal
  @override
  SerieTracksFilterNotifier create() => SerieTracksFilterNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TrackFilterQuery value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TrackFilterQuery>(value),
    );
  }
}

String _$serieTracksFilterNotifierHash() =>
    r'664a8df1c54dcc30d19b4eb4c6f5a443dbe6f83f';

abstract class _$SerieTracksFilterNotifier extends $Notifier<TrackFilterQuery> {
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
