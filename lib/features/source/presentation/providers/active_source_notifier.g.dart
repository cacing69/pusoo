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

part of 'active_source_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ActiveSourceNotifier)
const activeSourceProvider = ActiveSourceNotifierProvider._();

final class ActiveSourceNotifierProvider
    extends $NotifierProvider<ActiveSourceNotifier, AsyncValue<Source?>> {
  const ActiveSourceNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'activeSourceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$activeSourceNotifierHash();

  @$internal
  @override
  ActiveSourceNotifier create() => ActiveSourceNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AsyncValue<Source?> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AsyncValue<Source?>>(value),
    );
  }
}

String _$activeSourceNotifierHash() =>
    r'8d3a55f8eddfc6a4769f765f42ce40ff88ad6db0';

abstract class _$ActiveSourceNotifier extends $Notifier<AsyncValue<Source?>> {
  AsyncValue<Source?> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<Source?>, AsyncValue<Source?>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<Source?>, AsyncValue<Source?>>,
              AsyncValue<Source?>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
