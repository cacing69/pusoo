// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dio_tmdb.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(dioTmdb)
const dioTmdbProvider = DioTmdbProvider._();

final class DioTmdbProvider extends $FunctionalProvider<Dio, Dio, Dio>
    with $Provider<Dio> {
  const DioTmdbProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'dioTmdbProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$dioTmdbHash();

  @$internal
  @override
  $ProviderElement<Dio> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  Dio create(Ref ref) {
    return dioTmdb(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Dio value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Dio>(value),
    );
  }
}

String _$dioTmdbHash() => r'bf36deb0c7a9dcb2ed8c97b9a9f6719828c5bfa2';
