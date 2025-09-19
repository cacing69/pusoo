// Copyright (c) 2025, Ibnul Mutaki (@cacing69)
// Licensed under the MIT License
// Pusoo - Open Source IPTV Player
// GitHub: https://github.com/cacing69/pusoo

import 'package:pusoo/features/track/domain/models/track.dart';
import 'package:pusoo/core/utils/stream_headers_extractor.dart';
import 'package:pusoo/core/utils/ext_vlc_opt_headers_extractor.dart';

abstract class HttpHeadersFromTrack {
  static Map<String, String> build(Track track) {
    final Map<String, String> headers = {};
    final Map<String, String> normalizedHeaders = {};
    
    // Priority 3: Extract headers from httpHeaders (lowest priority)
    for (final httpHeader in track.httpHeaders) {
      for (final entry in httpHeader.entries) {
        final normalizedKey = _normalizeHeaderName(entry.key);
        if (!normalizedHeaders.containsKey(normalizedKey)) {
          normalizedHeaders[normalizedKey] = entry.value;
        }
      }
    }
    
    // Priority 2: Extract headers from extVlcOpts (medium priority)
    // This will override httpHeaders
    final extVlcOptHeaders = ExtVlcOptHeadersExtractor.extract(track.extVlcOpts);
    for (final entry in extVlcOptHeaders.entries) {
      final normalizedKey = _normalizeHeaderName(entry.key);
      normalizedHeaders[normalizedKey] = entry.value; // Override with extVlcOpts
    }
    
    // Priority 1: Extract headers from kodiProps stream_headers (highest priority)
    // This will override any existing headers
    for (final kodiProp in track.kodiProps) {
      if (kodiProp.containsKey('inputstream.adaptive.stream_headers')) {
        final streamHeaders = kodiProp['inputstream.adaptive.stream_headers']!;
        final streamHeadersMap = StreamHeadersExtractor.extract(streamHeaders);
        for (final entry in streamHeadersMap.entries) {
          final normalizedKey = _normalizeHeaderName(entry.key);
          normalizedHeaders[normalizedKey] = entry.value; // Always override with stream_headers
        }
      }
    }
    
    return normalizedHeaders;
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
      case 'if-none-match':
        return 'If-None-Match';
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
      case 'www-authenticate':
        return 'WWW-Authenticate';
      case 'proxy-authenticate':
        return 'Proxy-Authenticate';
      case 'proxy-authorization':
        return 'Proxy-Authorization';
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
}
