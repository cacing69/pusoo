// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tv_tracks_paging_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(TvTracksPagingNotifier)
const tvTracksPagingProvider = TvTracksPagingNotifierProvider._();

final class TvTracksPagingNotifierProvider
    extends
        $NotifierProvider<
          TvTracksPagingNotifier,
          PagingController<int, Track>
        > {
  const TvTracksPagingNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'tvTracksPagingProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$tvTracksPagingNotifierHash();

  @$internal
  @override
  TvTracksPagingNotifier create() => TvTracksPagingNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PagingController<int, Track> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PagingController<int, Track>>(value),
    );
  }
}

String _$tvTracksPagingNotifierHash() =>
    r'e09c950c387a0595082db65e170e82f2c5c4a661';

abstract class _$TvTracksPagingNotifier
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
