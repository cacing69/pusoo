// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tv_tracks_search_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(TvTracksSearchNotifier)
const tvTracksSearchProvider = TvTracksSearchNotifierProvider._();

final class TvTracksSearchNotifierProvider
    extends $NotifierProvider<TvTracksSearchNotifier, String?> {
  const TvTracksSearchNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'tvTracksSearchProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$tvTracksSearchNotifierHash();

  @$internal
  @override
  TvTracksSearchNotifier create() => TvTracksSearchNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String?>(value),
    );
  }
}

String _$tvTracksSearchNotifierHash() =>
    r'773357d61ea50cbdbf21cd4f29ea9d7c5d5a89a1';

abstract class _$TvTracksSearchNotifier extends $Notifier<String?> {
  String? build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<String?, String?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<String?, String?>,
              String?,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
