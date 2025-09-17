// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'active_playlist_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ActivePlaylistNotifier)
const activePlaylistProvider = ActivePlaylistNotifierProvider._();

final class ActivePlaylistNotifierProvider
    extends $NotifierProvider<ActivePlaylistNotifier, AsyncValue<Playlist?>> {
  const ActivePlaylistNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'activePlaylistProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$activePlaylistNotifierHash();

  @$internal
  @override
  ActivePlaylistNotifier create() => ActivePlaylistNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AsyncValue<Playlist?> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AsyncValue<Playlist?>>(value),
    );
  }
}

String _$activePlaylistNotifierHash() =>
    r'dacf43ad239f5eb4ed02499f77bf544f3641542a';

abstract class _$ActivePlaylistNotifier
    extends $Notifier<AsyncValue<Playlist?>> {
  AsyncValue<Playlist?> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<Playlist?>, AsyncValue<Playlist?>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<Playlist?>, AsyncValue<Playlist?>>,
              AsyncValue<Playlist?>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
