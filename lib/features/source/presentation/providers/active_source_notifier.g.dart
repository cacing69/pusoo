// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'active_source_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ActiveSourceNotifier)
const activeSourceProvider = ActiveSourceNotifierProvider._();

final class ActiveSourceNotifierProvider
    extends $NotifierProvider<ActiveSourceNotifier, AsyncValue<Source?>> {
  const ActiveSourceNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'activeSourceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$activeSourceNotifierHash();

  @$internal
  @override
  ActiveSourceNotifier create() => ActiveSourceNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AsyncValue<Source?> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AsyncValue<Source?>>(value),
    );
  }
}

String _$activeSourceNotifierHash() =>
    r'8d3a55f8eddfc6a4769f765f42ce40ff88ad6db0';

abstract class _$ActiveSourceNotifier extends $Notifier<AsyncValue<Source?>> {
  AsyncValue<Source?> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<Source?>, AsyncValue<Source?>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<Source?>, AsyncValue<Source?>>,
              AsyncValue<Source?>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
