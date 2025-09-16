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
    extends $NotifierProvider<TvTracksFilterNotifier, GetTracksParams> {
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
  Override overrideWithValue(GetTracksParams value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetTracksParams>(value),
    );
  }
}

String _$tvTracksFilterNotifierHash() =>
    r'a217adae701de7620e60cb69368b38a236ea01be';

abstract class _$TvTracksFilterNotifier extends $Notifier<GetTracksParams> {
  GetTracksParams build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<GetTracksParams, GetTracksParams>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<GetTracksParams, GetTracksParams>,
              GetTracksParams,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
