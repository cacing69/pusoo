// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_subtitle_paging_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(SearchSubtitlePagingNotifier)
const searchSubtitlePagingProvider = SearchSubtitlePagingNotifierProvider._();

final class SearchSubtitlePagingNotifierProvider
    extends
        $NotifierProvider<
          SearchSubtitlePagingNotifier,
          PagingController<int, Subtitle>
        > {
  const SearchSubtitlePagingNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'searchSubtitlePagingProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$searchSubtitlePagingNotifierHash();

  @$internal
  @override
  SearchSubtitlePagingNotifier create() => SearchSubtitlePagingNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PagingController<int, Subtitle> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PagingController<int, Subtitle>>(
        value,
      ),
    );
  }
}

String _$searchSubtitlePagingNotifierHash() =>
    r'e5f926b0d89665acafd91350445c08f88535d755';

abstract class _$SearchSubtitlePagingNotifier
    extends $Notifier<PagingController<int, Subtitle>> {
  PagingController<int, Subtitle> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref
            as $Ref<
              PagingController<int, Subtitle>,
              PagingController<int, Subtitle>
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                PagingController<int, Subtitle>,
                PagingController<int, Subtitle>
              >,
              PagingController<int, Subtitle>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
