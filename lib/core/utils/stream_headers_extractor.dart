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

/// Extracts HTTP headers from Kodi stream headers property
///
/// This class handles the parsing of stream headers from Kodi's inputstream.adaptive.stream_headers
/// property. It supports both JSON format and key-value pair format.
abstract class StreamHeadersExtractor {
  /// Extracts HTTP headers from a Kodi stream headers property
  ///
  /// [kodiProp] - The stream headers string from Kodi properties
  /// Returns a map of normalized HTTP headers
  static Map<String, String> extract(String kodiProp) {
    if (kodiProp.isEmpty) return <String, String>{};

    final headers = <String, String>{};

    try {
      // Split by newlines first, then process each line
      final lines = kodiProp.split('\n');

      for (final line in lines) {
        final trimmedLine = line.trim();
        if (trimmedLine.isEmpty) continue;

        _processLine(trimmedLine, headers);
      }
    } catch (e) {
      // Log error but return what we have so far
      print('Warning: Failed to parse stream headers: $e');
    }

    return headers;
  }

  /// Processes a single line of stream headers
  static void _processLine(String line, Map<String, String> headers) {
    try {
      // Check if the line is JSON format
      if (_isJsonFormat(line)) {
        _parseJsonLine(line, headers);
      } else {
        // Parse as key-value pairs separated by &
        _parseKeyValuePairs(line, headers);
      }
    } catch (e) {
      // If parsing fails, try alternative parsing methods
      _parseAlternativeFormat(line, headers);
    }
  }

  /// Checks if a line is in JSON format
  static bool _isJsonFormat(String line) {
    return line.startsWith('{') && line.endsWith('}');
  }

  /// Parses a JSON formatted line
  static void _parseJsonLine(String line, Map<String, String> headers) {
    try {
      final jsonMap = jsonDecode(line) as Map<String, dynamic>;
      // Convert JSON map to headers map
      for (final entry in jsonMap.entries) {
        final key = entry.key.toString().trim();
        final value = entry.value.toString().trim();

        if (key.isNotEmpty && value.isNotEmpty) {
          headers[key] = value;
        }
      }
    } catch (e) {
      // If JSON parsing fails, fall back to key-value parsing
      _parseKeyValuePairs(line, headers);
    }
  }

  /// Parses key-value pairs separated by &
  static void _parseKeyValuePairs(String line, Map<String, String> headers) {
    // Split by & to get individual key-value pairs
    final pairs = line.split('&');

    for (final pair in pairs) {
      final trimmedPair = pair.trim();
      if (trimmedPair.isEmpty) continue;

      _parseKeyValuePair(trimmedPair, headers);
    }
  }

  /// Parses a single key-value pair
  static void _parseKeyValuePair(String pair, Map<String, String> headers) {
    final equalIndex = pair.indexOf('=');
    if (equalIndex == -1) return; // No equals sign found

    final key = pair.substring(0, equalIndex).trim();
    final value = pair.substring(equalIndex + 1).trim();

    if (key.isNotEmpty && value.isNotEmpty) {
      headers[key.toLowerCase()] = value;
    }
  }

  /// Alternative parsing method for different formats
  static void _parseAlternativeFormat(
    String line,
    Map<String, String> headers,
  ) {
    // Try parsing as semicolon-separated pairs
    if (line.contains(';')) {
      final pairs = line.split(';');
      for (final pair in pairs) {
        _parseKeyValuePair(pair.trim(), headers);
      }
      return;
    }

    // Try parsing as comma-separated pairs
    if (line.contains(',')) {
      final pairs = line.split(',');
      for (final pair in pairs) {
        _parseKeyValuePair(pair.trim(), headers);
      }
      return;
    }

    // Try parsing as space-separated pairs
    if (line.contains(' ')) {
      final pairs = line.split(' ');
      for (final pair in pairs) {
        _parseKeyValuePair(pair.trim(), headers);
      }
      return;
    }
  }
}
