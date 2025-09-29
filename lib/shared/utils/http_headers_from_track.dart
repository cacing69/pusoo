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

import 'package:pusoo/features/track/domain/models/track.dart';
import 'package:pusoo/shared/utils/stream_headers_extractor.dart';
import 'package:pusoo/shared/utils/ext_vlc_opt_headers_extractor.dart';

/// Builds HTTP headers from track data using multiple extractors
///
/// This class provides a unified interface for extracting HTTP headers from various sources
/// in a track object. It uses a priority-based system where higher priority sources
/// override lower priority ones.
abstract class HttpHeadersFromTrack {
  /// Priority levels for header sources
  static const int _priorityHttpHeaders = 3; // Lowest priority
  static const int _priorityExtVlcOpts = 2; // Medium priority
  static const int _priorityStreamHeaders = 1; // Highest priority

  /// Builds HTTP headers from track data using priority-based extraction
  ///
  /// [track] - The track object containing various header sources
  /// Returns a map of normalized HTTP headers
  static Map<String, String> build(Track track) {
    // ignore: dead_code, unnecessary_null_comparison
    if (track == null) return <String, String>{};

    final Map<String, String> normalizedHeaders = {};

    try {
      // Priority 3: Extract headers from httpHeaders (lowest priority)
      _extractHttpHeaders(track, normalizedHeaders);

      // Priority 2: Extract headers from extVlcOpts (medium priority)
      _extractExtVlcOptHeaders(track, normalizedHeaders);

      // Priority 1: Extract headers from kodiProps stream_headers (highest priority)
      _extractStreamHeaders(track, normalizedHeaders);
    } catch (e) {
      // Log error but return what we have so far
      print('Warning: Failed to build HTTP headers from track: $e');
    }

    return normalizedHeaders;
  }

  /// Extracts headers from track.httpHeaders
  static void _extractHttpHeaders(
    Track track,
    Map<String, String> normalizedHeaders,
  ) {
    if (track.httpHeaders.isEmpty) return;

    for (final httpHeader in track.httpHeaders) {
      if (httpHeader.isEmpty) continue;

      for (final entry in httpHeader.entries) {
        final key = entry.key.trim();
        final value = entry.value.trim();

        if (key.isEmpty || value.isEmpty) continue;

        final normalizedKey = _normalizeHeaderName(key);
        if (!normalizedHeaders.containsKey(normalizedKey)) {
          normalizedHeaders[normalizedKey] = value;
        }
      }
    }
  }

  /// Extracts headers from track.extVlcOpts using ExtVlcOptHeadersExtractor
  static void _extractExtVlcOptHeaders(
    Track track,
    Map<String, String> normalizedHeaders,
  ) {
    if (track.extVlcOpts.isEmpty) return;

    try {
      final extVlcOptHeaders = ExtVlcOptHeadersExtractor.extract(
        track.extVlcOpts,
      );

      for (final entry in extVlcOptHeaders.entries) {
        final key = entry.key.trim();
        final value = entry.value.trim();

        if (key.isEmpty || value.isEmpty) continue;

        final normalizedKey = _normalizeHeaderName(key);
        normalizedHeaders[normalizedKey] = value; // Override with extVlcOpts
      }
    } catch (e) {
      print('Warning: Failed to extract EXTVLCOPT headers: $e');
    }
  }

  /// Extracts headers from track.kodiProps using StreamHeadersExtractor
  static void _extractStreamHeaders(
    Track track,
    Map<String, String> normalizedHeaders,
  ) {
    if (track.kodiProps.isEmpty) return;

    for (final kodiProp in track.kodiProps) {
      if (kodiProp.isEmpty) continue;

      if (kodiProp.containsKey('inputstream.adaptive.stream_headers')) {
        final streamHeaders = kodiProp['inputstream.adaptive.stream_headers']
            ?.toString();
        if (streamHeaders == null || streamHeaders.isEmpty) continue;

        try {
          final streamHeadersMap = StreamHeadersExtractor.extract(
            streamHeaders,
          );

          for (final entry in streamHeadersMap.entries) {
            final key = entry.key.trim();
            final value = entry.value.trim();

            if (key.isEmpty || value.isEmpty) continue;

            final normalizedKey = _normalizeHeaderName(key);
            normalizedHeaders[normalizedKey] =
                value; // Always override with stream_headers
          }
        } catch (e) {
          print('Warning: Failed to extract stream headers: $e');
        }
      }
    }
  }

  /// Normalizes header names to standard format (Title-Case)
  static String _normalizeHeaderName(String headerName) {
    if (headerName.isEmpty) return headerName;

    // Convert to lowercase first
    final lowerCase = headerName.toLowerCase();

    // Handle special cases for common headers
    switch (lowerCase) {
      case 'content-type':
        return 'Content-Type';
      case 'content-length':
        return 'Content-Length';
      case 'content-encoding':
        return 'Content-Encoding';
      case 'content-disposition':
        return 'Content-Disposition';
      case 'user-agent':
        return 'User-Agent';
      case 'authorization':
        return 'Authorization';
      case 'accept':
        return 'Accept';
      case 'accept-encoding':
        return 'Accept-Encoding';
      case 'accept-language':
        return 'Accept-Language';
      case 'cache-control':
        return 'Cache-Control';
      case 'connection':
        return 'Connection';
      case 'host':
        return 'Host';
      case 'referer':
      case 'referrer':
        return 'Referer';
      case 'origin':
        return 'Origin';
      case 'x-requested-with':
        return 'X-Requested-With';
      case 'x-forwarded-for':
        return 'X-Forwarded-For';
      case 'x-real-ip':
        return 'X-Real-IP';
      case 'x-forwarded-proto':
        return 'X-Forwarded-Proto';
      case 'x-forwarded-host':
        return 'X-Forwarded-Host';
      case 'x-forwarded-port':
        return 'X-Forwarded-Port';
      case 'x-frame-options':
        return 'X-Frame-Options';
      case 'x-content-type-options':
        return 'X-Content-Type-Options';
      case 'x-xss-protection':
        return 'X-XSS-Protection';
      case 'strict-transport-security':
        return 'Strict-Transport-Security';
      case 'access-control-allow-origin':
        return 'Access-Control-Allow-Origin';
      case 'access-control-allow-methods':
        return 'Access-Control-Allow-Methods';
      case 'access-control-allow-headers':
        return 'Access-Control-Allow-Headers';
      case 'access-control-allow-credentials':
        return 'Access-Control-Allow-Credentials';
      case 'access-control-expose-headers':
        return 'Access-Control-Expose-Headers';
      case 'access-control-max-age':
        return 'Access-Control-Max-Age';
      case 'access-control-request-method':
        return 'Access-Control-Request-Method';
      case 'access-control-request-headers':
        return 'Access-Control-Request-Headers';
      case 'www-authenticate':
        return 'WWW-Authenticate';
      case 'proxy-authenticate':
        return 'Proxy-Authenticate';
      case 'proxy-authorization':
        return 'Proxy-Authorization';
      case 'te':
        return 'TE';
      case 'trailer':
        return 'Trailer';
      case 'transfer-encoding':
        return 'Transfer-Encoding';
      case 'upgrade':
        return 'Upgrade';
      case 'via':
        return 'Via';
      case 'warning':
        return 'Warning';
      case 'date':
        return 'Date';
      case 'expires':
        return 'Expires';
      case 'last-modified':
        return 'Last-Modified';
      case 'etag':
        return 'ETag';
      case 'if-modified-since':
        return 'If-Modified-Since';
      case 'if-none-match':
        return 'If-None-Match';
      case 'if-range':
        return 'If-Range';
      case 'if-unmodified-since':
        return 'If-Unmodified-Since';
      case 'range':
        return 'Range';
      case 'if-match':
        return 'If-Match';
      case 'vary':
        return 'Vary';
      case 'age':
        return 'Age';
      case 'retry-after':
        return 'Retry-After';
      case 'server':
        return 'Server';
      case 'set-cookie':
        return 'Set-Cookie';
      case 'cookie':
        return 'Cookie';
      case 'location':
        return 'Location';
      case 'refresh':
        return 'Refresh';
      case 'expect':
        return 'Expect';
      case 'max-forwards':
        return 'Max-Forwards';
      case 'pragma':
        return 'Pragma';
      case 'proxy-connection':
        return 'Proxy-Connection';
      case 'upgrade-insecure-requests':
        return 'Upgrade-Insecure-Requests';
      case 'dnt':
        return 'DNT';
      case 'sec-fetch-dest':
        return 'Sec-Fetch-Dest';
      case 'sec-fetch-mode':
        return 'Sec-Fetch-Mode';
      case 'sec-fetch-site':
        return 'Sec-Fetch-Site';
      case 'sec-fetch-user':
        return 'Sec-Fetch-User';
      case 'sec-ch-ua':
        return 'Sec-CH-UA';
      case 'sec-ch-ua-mobile':
        return 'Sec-CH-UA-Mobile';
      case 'sec-ch-ua-platform':
        return 'Sec-CH-UA-Platform';
      case 'x-tcdn-token':
        return 'X-TCDN-token';
      default:
        // For custom headers, convert to Title-Case
        return _toTitleCase(lowerCase);
    }
  }

  /// Converts a string to Title-Case (e.g., "x-custom-header" -> "X-Custom-Header")
  static String _toTitleCase(String input) {
    if (input.isEmpty) return input;

    final parts = input.split('-');
    final titleCaseParts = parts.map((part) {
      if (part.isEmpty) return part;
      return part[0].toUpperCase() + part.substring(1).toLowerCase();
    });

    return titleCaseParts.join('-');
  }

  /// Gets the priority level for a header source
  static int getPriorityForSource(String source) {
    switch (source.toLowerCase()) {
      case 'httpheaders':
        return _priorityHttpHeaders;
      case 'extvlcopt':
        return _priorityExtVlcOpts;
      case 'streamheaders':
        return _priorityStreamHeaders;
      default:
        return 999; // Unknown source has lowest priority
    }
  }

  /// Merges headers from multiple sources with priority handling
  static Map<String, String> mergeHeaders(
    Map<String, String> baseHeaders,
    Map<String, String> newHeaders,
    int priority,
  ) {
    final merged = Map<String, String>.from(baseHeaders);

    for (final entry in newHeaders.entries) {
      final key = entry.key.trim();
      final value = entry.value.trim();

      if (key.isEmpty || value.isEmpty) continue;

      // Always override for higher priority sources
      merged[key] = value;
    }

    return merged;
  }

  /// Debug method to print header extraction details
  static void debugHeaders(Track track) {
    print('=== HTTP Headers Debug ===');
    print('Track ID: ${track.id}');
    print('HTTP Headers count: ${track.httpHeaders.length}');
    print('EXTVLCOPT count: ${track.extVlcOpts.length}');
    print('Kodi Props count: ${track.kodiProps.length}');

    final headers = build(track);
    print('Final headers count: ${headers.length}');
    headers.forEach((key, value) {
      print('  $key: $value');
    });
    print('========================');
  }
}
