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

part of 'tv_tracks_filter_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(TvTracksFilterNotifier)
const tvTracksFilterProvider = TvTracksFilterNotifierProvider._();

final class TvTracksFilterNotifierProvider
    extends $NotifierProvider<TvTracksFilterNotifier, TrackFilterQuery> {
  const TvTracksFilterNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'tvTracksFilterProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$tvTracksFilterNotifierHash();

  @$internal
  @override
  TvTracksFilterNotifier create() => TvTracksFilterNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TrackFilterQuery value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TrackFilterQuery>(value),
    );
  }
}

String _$tvTracksFilterNotifierHash() =>
    r'7594dc14b9e9415a29606252af30b2c9180e7f06';

abstract class _$TvTracksFilterNotifier extends $Notifier<TrackFilterQuery> {
  TrackFilterQuery build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<TrackFilterQuery, TrackFilterQuery>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<TrackFilterQuery, TrackFilterQuery>,
              TrackFilterQuery,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
