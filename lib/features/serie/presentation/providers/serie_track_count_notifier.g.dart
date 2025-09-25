// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'serie_track_count_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(SerieTrackCountNotifier)
const serieTrackCountProvider = SerieTrackCountNotifierProvider._();

final class SerieTrackCountNotifierProvider
    extends $NotifierProvider<SerieTrackCountNotifier, AsyncValue<int?>> {
  const SerieTrackCountNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'serieTrackCountProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$serieTrackCountNotifierHash();

  @$internal
  @override
  SerieTrackCountNotifier create() => SerieTrackCountNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AsyncValue<int?> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AsyncValue<int?>>(value),
    );
  }
}

String _$serieTrackCountNotifierHash() =>
    r'9b7e3b83bd3e27961b3f9778e64fb771a65e291d';

abstract class _$SerieTrackCountNotifier extends $Notifier<AsyncValue<int?>> {
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
