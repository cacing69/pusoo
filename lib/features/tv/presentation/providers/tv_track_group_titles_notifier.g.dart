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

part of 'tv_track_group_titles_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(TvTrackGroupTitlesNotifier)
const tvTrackGroupTitlesProvider = TvTrackGroupTitlesNotifierProvider._();

final class TvTrackGroupTitlesNotifierProvider
    extends
        $NotifierProvider<
          TvTrackGroupTitlesNotifier,
          AsyncValue<List<String>?>
        > {
  const TvTrackGroupTitlesNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'tvTrackGroupTitlesProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$tvTrackGroupTitlesNotifierHash();

  @$internal
  @override
  TvTrackGroupTitlesNotifier create() => TvTrackGroupTitlesNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AsyncValue<List<String>?> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AsyncValue<List<String>?>>(value),
    );
  }
}

String _$tvTrackGroupTitlesNotifierHash() =>
    r'abe06a681c711bda120707fcd2baa3adce0c4cf5';

abstract class _$TvTrackGroupTitlesNotifier
    extends $Notifier<AsyncValue<List<String>?>> {
  AsyncValue<List<String>?> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref as $Ref<AsyncValue<List<String>?>, AsyncValue<List<String>?>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<String>?>, AsyncValue<List<String>?>>,
              AsyncValue<List<String>?>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
