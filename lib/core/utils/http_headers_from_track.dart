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
    
    // Priority 3: Extract headers from httpHeaders (lowest priority)
    for (final httpHeader in track.httpHeaders) {
      for (final entry in httpHeader.entries) {
        final key = entry.key.toLowerCase();
        if (!headers.containsKey(key)) {
          headers[key] = entry.value;
        }
      }
    }
    
    // Priority 2: Extract headers from extVlcOpts (medium priority)
    // This will override httpHeaders
    final extVlcOptHeaders = ExtVlcOptHeadersExtractor.extract(track.extVlcOpts);
    for (final entry in extVlcOptHeaders.entries) {
      final key = entry.key.toLowerCase();
      headers[key] = entry.value; // Override with extVlcOpts
    }
    
    // Priority 1: Extract headers from kodiProps stream_headers (highest priority)
    // This will override any existing headers
    for (final kodiProp in track.kodiProps) {
      if (kodiProp.containsKey('inputstream.adaptive.stream_headers')) {
        final streamHeaders = kodiProp['inputstream.adaptive.stream_headers']!;
        final streamHeadersMap = StreamHeadersExtractor.extract(streamHeaders);
        for (final entry in streamHeadersMap.entries) {
          final key = entry.key.toLowerCase();
          headers[key] = entry.value; // Always override with stream_headers
          
          // Handle referer/referrer spelling difference
          if (key == 'referer') {
            headers['referrer'] = entry.value;
          } else if (key == 'referrer') {
            headers['referer'] = entry.value;
          }
        }
      }
    }
    
    return headers;
  }
}
