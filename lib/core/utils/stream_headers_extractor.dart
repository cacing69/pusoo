// Copyright (c) 2024, Ibnul Mutaki (@cacing69)
// All rights reserved.
//
// This source code is licensed under the BSD-style license found in the
// LICENSE file in the root directory of this source tree.
//
// Pusoo - Open Source IPTV Player
// GitHub: https://github.com/cacing69/pusoo
// Developer: Ibnul Mutaki

import 'dart:convert';

abstract class StreamHeadersExtractor {

  static Map<String, String> extract(String kodiProp) {
    final headers = <String, String>{};
    
    // Split by newlines first, then process each line
    final lines = kodiProp.split('\n');
    
    for (final line in lines) {
      final trimmedLine = line.trim();
      if (trimmedLine.isEmpty) continue;
      
      // Check if the line is JSON format
      if (trimmedLine.startsWith('{') && trimmedLine.endsWith('}')) {
        try {
          final jsonMap = jsonDecode(trimmedLine) as Map<String, dynamic>;
          // Convert JSON map to headers map
          for (final entry in jsonMap.entries) {
            headers[entry.key] = entry.value.toString();
          }
        } catch (e) {
          // If JSON parsing fails, fall back to key-value parsing
          _parseKeyValuePairs(trimmedLine, headers);
        }
      } else {
        // Parse as key-value pairs separated by &
        _parseKeyValuePairs(trimmedLine, headers);
      }
    }
    
    return headers;
  }

  static void _parseKeyValuePairs(String line, Map<String, String> headers) {
    // Split by & to get individual key-value pairs
    final pairs = line.split('&');
    
    for (final pair in pairs) {
      final trimmedPair = pair.trim();
      if (trimmedPair.isEmpty) continue;
      
      final parts = trimmedPair.split('=');
      if (parts.length >= 2) {
        final key = parts[0].trim().toLowerCase(); // Convert key to lowercase
        final value = parts.sublist(1).join('=').trim(); // Join remaining parts in case value contains '='
        headers[key] = value;
      }
    }
  }
}