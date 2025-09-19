// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subtitle_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(subtitleRepository)
const subtitleRepositoryProvider = SubtitleRepositoryProvider._();

final class SubtitleRepositoryProvider
    extends
        $FunctionalProvider<
          SubtitleRepository,
          SubtitleRepository,
          SubtitleRepository
        >
    with $Provider<SubtitleRepository> {
  const SubtitleRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'subtitleRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$subtitleRepositoryHash();

  @$internal
  @override
  $ProviderElement<SubtitleRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  SubtitleRepository create(Ref ref) {
    return subtitleRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SubtitleRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SubtitleRepository>(value),
    );
  }
}

String _$subtitleRepositoryHash() =>
    r'a3f3e8a639b4fc60731d12f39ef96508f3b95d72';

@ProviderFor(searcSubtitleUsecase)
const searcSubtitleUsecaseProvider = SearcSubtitleUsecaseProvider._();

final class SearcSubtitleUsecaseProvider
    extends
        $FunctionalProvider<
          SearchSubtitleUsecase,
          SearchSubtitleUsecase,
          SearchSubtitleUsecase
        >
    with $Provider<SearchSubtitleUsecase> {
  const SearcSubtitleUsecaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'searcSubtitleUsecaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$searcSubtitleUsecaseHash();

  @$internal
  @override
  $ProviderElement<SearchSubtitleUsecase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  SearchSubtitleUsecase create(Ref ref) {
    return searcSubtitleUsecase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SearchSubtitleUsecase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SearchSubtitleUsecase>(value),
    );
  }
}

String _$searcSubtitleUsecaseHash() =>
    r'c31970064cc501f2403575f7ac743cb7d831a44e';
