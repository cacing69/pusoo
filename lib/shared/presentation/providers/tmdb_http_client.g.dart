// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tmdb_http_client.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(tmddbHttpClient)
const tmddbHttpClientProvider = TmddbHttpClientProvider._();

final class TmddbHttpClientProvider extends $FunctionalProvider<Dio, Dio, Dio>
    with $Provider<Dio> {
  const TmddbHttpClientProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'tmddbHttpClientProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$tmddbHttpClientHash();

  @$internal
  @override
  $ProviderElement<Dio> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  Dio create(Ref ref) {
    return tmddbHttpClient(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Dio value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Dio>(value),
    );
  }
}

String _$tmddbHttpClientHash() => r'8cd463307e9f21bea1ab633a5e6da82eeed225db';
