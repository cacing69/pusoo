// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'track_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(TracksNotifier)
const tracksProvider = TracksNotifierProvider._();

final class TracksNotifierProvider
    extends $NotifierProvider<TracksNotifier, AsyncValue<List<Track>?>> {
  const TracksNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'tracksProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$tracksNotifierHash();

  @$internal
  @override
  TracksNotifier create() => TracksNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AsyncValue<List<Track>?> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AsyncValue<List<Track>?>>(value),
    );
  }
}

String _$tracksNotifierHash() => r'ef06323036cdbd253764951613d7b791c2c09550';

abstract class _$TracksNotifier extends $Notifier<AsyncValue<List<Track>?>> {
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
