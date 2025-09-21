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
    r'c8cb236ab9bcf608f5b7cc49cbd8530ef5ebe316';

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
