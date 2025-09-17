// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tv_track_group_titles_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(TvTrackGroupTitlesNotifier)
const tvTrackGroupTitlesProvider = TvTrackGroupTitlesNotifierProvider._();

final class TvTrackGroupTitlesNotifierProvider
    extends
        $NotifierProvider<
          TvTrackGroupTitlesNotifier,
          AsyncValue<List<String>?>
        > {
  const TvTrackGroupTitlesNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'tvTrackGroupTitlesProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$tvTrackGroupTitlesNotifierHash();

  @$internal
  @override
  TvTrackGroupTitlesNotifier create() => TvTrackGroupTitlesNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AsyncValue<List<String>?> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AsyncValue<List<String>?>>(value),
    );
  }
}

String _$tvTrackGroupTitlesNotifierHash() =>
    r'cc1c531a5fed4a95174d2fe1eac685d00c61bc72';

abstract class _$TvTrackGroupTitlesNotifier
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
