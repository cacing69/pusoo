/*
 * Pusoo - IPTV Player
 * Copyright (C) 2025 Ibnul Mutaki <ibnuul@gmail.com>
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
 * See the GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program. If not, see <https://www.gnu.org/licenses/>.
 */


// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(tmdbClient)
const tmdbClientProvider = TmdbClientProvider._();

final class TmdbClientProvider
    extends $FunctionalProvider<TMDBClient, TMDBClient, TMDBClient>
    with $Provider<TMDBClient> {
  const TmdbClientProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'tmdbClientProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$tmdbClientHash();

  @$internal
  @override
  $ProviderElement<TMDBClient> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  TMDBClient create(Ref ref) {
    return tmdbClient(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TMDBClient value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TMDBClient>(value),
    );
  }
}

String _$tmdbClientHash() => r'94c2cdcce211024d16b498d405d00d386bfd4cc4';

@ProviderFor(openSubtitlesClient)
const openSubtitlesClientProvider = OpenSubtitlesClientProvider._();

final class OpenSubtitlesClientProvider
    extends
        $FunctionalProvider<
          OpenSubtitlesClient,
          OpenSubtitlesClient,
          OpenSubtitlesClient
        >
    with $Provider<OpenSubtitlesClient> {
  const OpenSubtitlesClientProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'openSubtitlesClientProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$openSubtitlesClientHash();

  @$internal
  @override
  $ProviderElement<OpenSubtitlesClient> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  OpenSubtitlesClient create(Ref ref) {
    return openSubtitlesClient(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(OpenSubtitlesClient value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<OpenSubtitlesClient>(value),
    );
  }
}

String _$openSubtitlesClientHash() =>
    r'a804e01c24f769f86ae878c2ae81be15055c72cf';
