// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subtitle_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(subtitleOpenSubtitlesRepository)
const subtitleOpenSubtitlesRepositoryProvider =
    SubtitleOpenSubtitlesRepositoryProvider._();

final class SubtitleOpenSubtitlesRepositoryProvider
    extends
        $FunctionalProvider<
          SubtitleRepository,
          SubtitleRepository,
          SubtitleRepository
        >
    with $Provider<SubtitleRepository> {
  const SubtitleOpenSubtitlesRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'subtitleOpenSubtitlesRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$subtitleOpenSubtitlesRepositoryHash();

  @$internal
  @override
  $ProviderElement<SubtitleRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  SubtitleRepository create(Ref ref) {
    return subtitleOpenSubtitlesRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SubtitleRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SubtitleRepository>(value),
    );
  }
}

String _$subtitleOpenSubtitlesRepositoryHash() =>
    r'bcf38c759d129d6442f797d65bcf39ddf78ab49b';

@ProviderFor(searchSubtitleUsecase)
const searchSubtitleUsecaseProvider = SearchSubtitleUsecaseProvider._();

final class SearchSubtitleUsecaseProvider
    extends
        $FunctionalProvider<
          SearchSubtitleUsecase,
          SearchSubtitleUsecase,
          SearchSubtitleUsecase
        >
    with $Provider<SearchSubtitleUsecase> {
  const SearchSubtitleUsecaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'searchSubtitleUsecaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$searchSubtitleUsecaseHash();

  @$internal
  @override
  $ProviderElement<SearchSubtitleUsecase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  SearchSubtitleUsecase create(Ref ref) {
    return searchSubtitleUsecase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SearchSubtitleUsecase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SearchSubtitleUsecase>(value),
    );
  }
}

String _$searchSubtitleUsecaseHash() =>
    r'ac5cab0050bf16771186888895b2bf6b66c67741';
