// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'serie_track_group_titles_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(SerieTrackGroupTitlesNotifier)
const serieTrackGroupTitlesProvider = SerieTrackGroupTitlesNotifierProvider._();

final class SerieTrackGroupTitlesNotifierProvider
    extends
        $NotifierProvider<
          SerieTrackGroupTitlesNotifier,
          AsyncValue<List<String>?>
        > {
  const SerieTrackGroupTitlesNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'serieTrackGroupTitlesProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$serieTrackGroupTitlesNotifierHash();

  @$internal
  @override
  SerieTrackGroupTitlesNotifier create() => SerieTrackGroupTitlesNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AsyncValue<List<String>?> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AsyncValue<List<String>?>>(value),
    );
  }
}

String _$serieTrackGroupTitlesNotifierHash() =>
    r'a374c88cccc483ba36b9fc5540a4e92b35a3ec68';

abstract class _$SerieTrackGroupTitlesNotifier
    extends $Notifier<AsyncValue<List<String>?>> {
  AsyncValue<List<String>?> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref as $Ref<AsyncValue<List<String>?>, AsyncValue<List<String>?>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<String>?>, AsyncValue<List<String>?>>,
              AsyncValue<List<String>?>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
