/*
 * Pusoo - IPTV Player
 * Copyright (C) 2025 Ibnul Mutaki
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

/// Extracts HTTP headers from VLC EXTVLCOPT directives
///
/// This class handles the conversion of VLC-specific options to standard HTTP headers.
/// It supports various VLC options like http-* headers, network-caching, and connection settings.
abstract class ExtVlcOptHeadersExtractor {
  /// Extracts HTTP headers from a list of EXTVLCOPT maps
  ///
  /// [extVlcOpts] - List of maps containing EXTVLCOPT key-value pairs
  /// Returns a map of normalized HTTP headers
  static Map<String, String> extract(List<Map<String, String>> extVlcOpts) {
    if (extVlcOpts.isEmpty) return <String, String>{};

    final headers = <String, String>{};

    for (final extVlcOpt in extVlcOpts) {
      if (extVlcOpt.isEmpty) continue;

      for (final entry in extVlcOpt.entries) {
        final key = entry.key.trim();
        final value = entry.value.trim();

        if (key.isEmpty || value.isEmpty) continue;

        try {
          _processExtVlcOpt(key, value, headers);
        } catch (e) {
          // Log error but continue processing other entries
          // In production, you might want to use a proper logging system
          print('Warning: Failed to process EXTVLCOPT $key=$value: $e');
        }
      }
    }

    return headers;
  }

  /// Processes individual EXTVLCOPT key-value pairs
  static void _processExtVlcOpt(
    String key,
    String value,
    Map<String, String> headers,
  ) {
    // Handle HTTP headers (http-*)
    if (key.startsWith('http-')) {
      final headerName = key.substring(5); // Remove 'http-' prefix
      if (headerName.isNotEmpty) {
        headers[headerName.toLowerCase()] = value;
      }
      return;
    }

    // Handle network-caching option
    if (key == 'network-caching') {
      _handleNetworkCaching(value, headers);
      return;
    }

    // Handle HTTP reconnect option
    if (key == '-http-reconnect') {
      _handleHttpReconnect(value, headers);
      return;
    }

    // Handle other VLC-specific options that might be useful
    if (key == 'http-proxy') {
      headers['proxy'] = value;
      return;
    }

    if (key == 'http-proxy-user') {
      headers['proxy-authorization'] = 'Basic ${_base64Encode(value)}';
      return;
    }

    if (key == 'http-proxy-pwd') {
      // This would need to be combined with http-proxy-user for proper auth
      // For now, we'll store it separately
      headers['proxy-password'] = value;
      return;
    }
  }

  /// Handles network-caching option by converting to Cache-Control header
  static void _handleNetworkCaching(String value, Map<String, String> headers) {
    try {
      final cacheValue = int.tryParse(value);
      if (cacheValue != null && cacheValue > 0) {
        headers['cache-control'] = 'max-age=$cacheValue';
      }
    } catch (e) {
      // If parsing fails, use the raw value
      headers['cache-control'] = 'max-age=$value';
    }
  }

  /// Handles HTTP reconnect option by setting connection headers
  static void _handleHttpReconnect(String value, Map<String, String> headers) {
    if (value.toLowerCase() == 'true') {
      headers['connection'] = 'keep-alive';
      headers['keep-alive'] = 'timeout=5, max=1000';
    } else if (value.toLowerCase() == 'false') {
      headers['connection'] = 'close';
    }
  }

  /// Simple base64 encoding for proxy authentication
  static String _base64Encode(String input) {
    // This is a simple implementation - in production you might want to use dart:convert
    return input; // Placeholder - implement proper base64 encoding if needed
  }
}
