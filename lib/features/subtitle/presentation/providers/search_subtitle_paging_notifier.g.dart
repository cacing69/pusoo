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
