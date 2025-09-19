// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'open_subtitles_http_client.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(openSubtitlesHttpClient)
const openSubtitlesHttpClientProvider = OpenSubtitlesHttpClientProvider._();

final class OpenSubtitlesHttpClientProvider
    extends $FunctionalProvider<Dio, Dio, Dio>
    with $Provider<Dio> {
  const OpenSubtitlesHttpClientProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'openSubtitlesHttpClientProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$openSubtitlesHttpClientHash();

  @$internal
  @override
  $ProviderElement<Dio> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  Dio create(Ref ref) {
    return openSubtitlesHttpClient(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Dio value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Dio>(value),
    );
  }
}

String _$openSubtitlesHttpClientHash() =>
    r'c28c4aac2c24f28fa9f05c0464215076b7f12a93';
