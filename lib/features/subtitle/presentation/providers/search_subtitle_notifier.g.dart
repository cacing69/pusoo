// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_subtitle_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(SearchSubtitleNotifier)
const searchSubtitleProvider = SearchSubtitleNotifierProvider._();

final class SearchSubtitleNotifierProvider
    extends
        $NotifierProvider<
          SearchSubtitleNotifier,
          AsyncValue<TOpenSubtitleSearchResponse<List<Subtitle>>?>
        > {
  const SearchSubtitleNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'searchSubtitleProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$searchSubtitleNotifierHash();

  @$internal
  @override
  SearchSubtitleNotifier create() => SearchSubtitleNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(
    AsyncValue<TOpenSubtitleSearchResponse<List<Subtitle>>?> value,
  ) {
    return $ProviderOverride(
      origin: this,
      providerOverride:
          $SyncValueProvider<
            AsyncValue<TOpenSubtitleSearchResponse<List<Subtitle>>?>
          >(value),
    );
  }
}

String _$searchSubtitleNotifierHash() =>
    r'1a600e15cc9ca2527958abcef45a29600c48f4fb';

abstract class _$SearchSubtitleNotifier
    extends
        $Notifier<AsyncValue<TOpenSubtitleSearchResponse<List<Subtitle>>?>> {
  AsyncValue<TOpenSubtitleSearchResponse<List<Subtitle>>?> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref
            as $Ref<
              AsyncValue<TOpenSubtitleSearchResponse<List<Subtitle>>?>,
              AsyncValue<TOpenSubtitleSearchResponse<List<Subtitle>>?>
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<TOpenSubtitleSearchResponse<List<Subtitle>>?>,
                AsyncValue<TOpenSubtitleSearchResponse<List<Subtitle>>?>
              >,
              AsyncValue<TOpenSubtitleSearchResponse<List<Subtitle>>?>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
