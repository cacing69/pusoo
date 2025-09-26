// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_subtitle_search_query_params_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(SearchSubtitleQueryParamsNotifier)
const searchSubtitleQueryParamsProvider =
    SearchSubtitleQueryParamsNotifierProvider._();

final class SearchSubtitleQueryParamsNotifierProvider
    extends
        $NotifierProvider<
          SearchSubtitleQueryParamsNotifier,
          SearchSubtitleQueryParams
        > {
  const SearchSubtitleQueryParamsNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'searchSubtitleQueryParamsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() =>
      _$searchSubtitleQueryParamsNotifierHash();

  @$internal
  @override
  SearchSubtitleQueryParamsNotifier create() =>
      SearchSubtitleQueryParamsNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SearchSubtitleQueryParams value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SearchSubtitleQueryParams>(value),
    );
  }
}

String _$searchSubtitleQueryParamsNotifierHash() =>
    r'fe040578593d58d6f8d70139da2f531449317b26';

abstract class _$SearchSubtitleQueryParamsNotifier
    extends $Notifier<SearchSubtitleQueryParams> {
  SearchSubtitleQueryParams build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref as $Ref<SearchSubtitleQueryParams, SearchSubtitleQueryParams>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<SearchSubtitleQueryParams, SearchSubtitleQueryParams>,
              SearchSubtitleQueryParams,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
