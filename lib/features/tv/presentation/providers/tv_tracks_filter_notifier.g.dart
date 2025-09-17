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
    extends $NotifierProvider<TvTracksFilterNotifier, TrackDriftFilterQuery> {
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
  Override overrideWithValue(TrackDriftFilterQuery value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TrackDriftFilterQuery>(value),
    );
  }
}

String _$tvTracksFilterNotifierHash() =>
    r'1423d46c9c7ca6f639d6ecc5a5493dbdd32b1da6';

abstract class _$TvTracksFilterNotifier
    extends $Notifier<TrackDriftFilterQuery> {
  TrackDriftFilterQuery build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<TrackDriftFilterQuery, TrackDriftFilterQuery>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<TrackDriftFilterQuery, TrackDriftFilterQuery>,
              TrackDriftFilterQuery,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
