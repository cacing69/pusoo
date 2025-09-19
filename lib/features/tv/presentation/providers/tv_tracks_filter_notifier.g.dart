// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tv_tracks_filter_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(TvTracksFilterNotifier)
const tvTracksFilterProvider = TvTracksFilterNotifierProvider._();

final class TvTracksFilterNotifierProvider
    extends $NotifierProvider<TvTracksFilterNotifier, TrackFilterQuery> {
  const TvTracksFilterNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'tvTracksFilterProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$tvTracksFilterNotifierHash();

  @$internal
  @override
  TvTracksFilterNotifier create() => TvTracksFilterNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TrackFilterQuery value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TrackFilterQuery>(value),
    );
  }
}

String _$tvTracksFilterNotifierHash() =>
    r'7594dc14b9e9415a29606252af30b2c9180e7f06';

abstract class _$TvTracksFilterNotifier extends $Notifier<TrackFilterQuery> {
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
