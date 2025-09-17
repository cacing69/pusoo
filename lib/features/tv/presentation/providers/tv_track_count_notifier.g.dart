// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tv_track_count_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(TvTrackCountNotifier)
const tvTrackCountProvider = TvTrackCountNotifierProvider._();

final class TvTrackCountNotifierProvider
    extends $NotifierProvider<TvTrackCountNotifier, AsyncValue<int?>> {
  const TvTrackCountNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'tvTrackCountProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$tvTrackCountNotifierHash();

  @$internal
  @override
  TvTrackCountNotifier create() => TvTrackCountNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AsyncValue<int?> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AsyncValue<int?>>(value),
    );
  }
}

String _$tvTrackCountNotifierHash() =>
    r'b842060e338f0e01ea35b9434b60ef94ce73af9c';

abstract class _$TvTrackCountNotifier extends $Notifier<AsyncValue<int?>> {
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
