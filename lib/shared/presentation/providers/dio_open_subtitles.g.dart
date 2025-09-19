// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dio_open_subtitles.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(dioOpenSubtitles)
const dioOpenSubtitlesProvider = DioOpenSubtitlesProvider._();

final class DioOpenSubtitlesProvider extends $FunctionalProvider<Dio, Dio, Dio>
    with $Provider<Dio> {
  const DioOpenSubtitlesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'dioOpenSubtitlesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$dioOpenSubtitlesHash();

  @$internal
  @override
  $ProviderElement<Dio> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  Dio create(Ref ref) {
    return dioOpenSubtitles(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Dio value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Dio>(value),
    );
  }
}

String _$dioOpenSubtitlesHash() => r'0aa208cd5e7792b0c334988ca285da664a2a3e68';
