// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'serie_tracks_paging_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(SerieTracksPagingNotifier)
const serieTracksPagingProvider = SerieTracksPagingNotifierProvider._();

final class SerieTracksPagingNotifierProvider
    extends
        $NotifierProvider<
          SerieTracksPagingNotifier,
          PagingController<int, Track>
        > {
  const SerieTracksPagingNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'serieTracksPagingProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$serieTracksPagingNotifierHash();

  @$internal
  @override
  SerieTracksPagingNotifier create() => SerieTracksPagingNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PagingController<int, Track> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PagingController<int, Track>>(value),
    );
  }
}

String _$serieTracksPagingNotifierHash() =>
    r'780b610b31beb2943f0294f0463a9a4b4d101e6f';

abstract class _$SerieTracksPagingNotifier
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
