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

import 'package:freezed_annotation/freezed_annotation.dart';

part 'xtream.g.dart';
part 'xtream.freezed.dart';

@freezed
abstract class Xtream with _$Xtream {
  const factory Xtream({
    @Default("") String host,
    @Default("") String username,
    @Default("") String password,
    @Default(0) int port,
    @Default("") String type,
    @Default("") String output,
    @Default(false) bool isValid,
  }) = _Xtream;

  factory Xtream.fromJson(Map<String, dynamic> json) => _$XtreamFromJson(json);

  factory Xtream.fromUrl(String url) {
    try {
      final uri = Uri.parse(url);
      final queryParams = uri.queryParameters;

      final xtream = Xtream(
        host: '${uri.scheme}://${uri.host}',
        username: queryParams['username'] ?? '',
        password: queryParams['password'] ?? '',
        port: uri.port,
        type: queryParams['type'] ?? '',
        output: queryParams['output'] ?? '',
        isValid: false, // Will be set by validation
      );

      return xtream.copyWith(isValid: _isValidXtreamUrl(xtream));
    } catch (e) {
      return Xtream();
    }
  }

  /// Validates if an Xtream instance represents a valid Xtream URL
  static bool _isValidXtreamUrl(Xtream xtream) {
    // Check if all required fields are present and valid
    if (xtream.host.isEmpty ||
        xtream.username.isEmpty ||
        xtream.password.isEmpty ||
        xtream.type.isEmpty) {
      return false;
    }

    // Check if host has valid scheme
    if (!xtream.host.startsWith('http://') &&
        !xtream.host.startsWith('https://')) {
      return false;
    }

    // Check if port is valid (1-65535)
    if (xtream.port < 1 || xtream.port > 65535) {
      return false;
    }

    // Check if type is valid Xtream type
    const validTypes = ['m3u', 'm3u_plus'];
    if (!validTypes.contains(xtream.type)) {
      return false;
    }

    return true;
  }
}
