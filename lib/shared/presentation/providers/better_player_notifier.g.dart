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

part of 'better_player_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(BetterPlayerNotifier)
const betterPlayerProvider = BetterPlayerNotifierProvider._();

final class BetterPlayerNotifierProvider
    extends $NotifierProvider<BetterPlayerNotifier, BetterPlayerController?> {
  const BetterPlayerNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'betterPlayerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$betterPlayerNotifierHash();

  @$internal
  @override
  BetterPlayerNotifier create() => BetterPlayerNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(BetterPlayerController? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<BetterPlayerController?>(value),
    );
  }
}

String _$betterPlayerNotifierHash() =>
    r'd208ee177ecc6b8e09094d69d4d2e33679dc239b';

abstract class _$BetterPlayerNotifier
    extends $Notifier<BetterPlayerController?> {
  BetterPlayerController? build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref as $Ref<BetterPlayerController?, BetterPlayerController?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<BetterPlayerController?, BetterPlayerController?>,
              BetterPlayerController?,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
