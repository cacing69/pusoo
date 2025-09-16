// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'better_player_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(BetterPlayerNotifier)
const betterPlayerProvider = BetterPlayerNotifierProvider._();

final class BetterPlayerNotifierProvider
    extends $NotifierProvider<BetterPlayerNotifier, BetterPlayerController?> {
  const BetterPlayerNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'betterPlayerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$betterPlayerNotifierHash();

  @$internal
  @override
  BetterPlayerNotifier create() => BetterPlayerNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(BetterPlayerController? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<BetterPlayerController?>(value),
    );
  }
}

String _$betterPlayerNotifierHash() =>
    r'da29a8b864b8d1694caa3d0bdc0f2170f1ec3ead';

abstract class _$BetterPlayerNotifier
    extends $Notifier<BetterPlayerController?> {
  BetterPlayerController? build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref as $Ref<BetterPlayerController?, BetterPlayerController?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<BetterPlayerController?, BetterPlayerController?>,
              BetterPlayerController?,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
