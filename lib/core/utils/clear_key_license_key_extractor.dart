// Copyright (c) 2025, Ibnul Mutaki (@cacing69)
// Licensed under the MIT License
// Pusoo - Open Source IPTV Player
// GitHub: https://github.com/cacing69/pusoo

import 'dart:convert';
import 'package:better_player_plus/better_player_plus.dart';
// import 'package:flutter/rendering.dart';
import 'package:http/http.dart' as http;

class ClearKeyLicenseKeyExtractor {
  static Future<Map<String, dynamic>> extract(
    String licenseKey, {
    Map<String, String>? headers,
  }) async {
    try {
      // Check if it's a URL (test 5)
      if (licenseKey.startsWith('http://') ||
          licenseKey.startsWith('https://')) {
        final client = http.Client();
        try {
          // Make HTTP request to get the license key with redirect following
          // final defaultHeaders = {};
          final requestHeaders = {...?headers};

          // debugPrint("request clear key : $licenseKey : $requestHeaders");

          final response = await client.get(
            Uri.parse(licenseKey),
            headers: requestHeaders,
          );

          if (response.statusCode == 200) {
            // debugPrint("request clear key response  : ${response.body}");
            final Map<String, dynamic> responseData = json.decode(
              response.body,
            );

            // First priority: Check if response has "keys" array
            if (responseData.containsKey('keys') &&
                responseData['keys'] is List) {
              // Return the original response data as-is
              return responseData;
            }
            // Second priority: Check for special pattern (test:6) - Developer = denver1769
            else if (responseData.containsKey('Developer') &&
                responseData['Developer']?.toString().toLowerCase() ==
                    'denver1769' &&
                responseData.containsKey('base64')) {
              final dynamic base64Data = responseData['base64'];

              // debugPrint("denver1769 response : $base64Data");
              // Check if base64 is an object with keys array
              if (base64Data is Map<String, dynamic> &&
                  base64Data.containsKey('keys') &&
                  base64Data['keys'] is List) {
                // Return the base64 object directly (same format as test:1 and test:3)
                return base64Data;
              }
              // Fallback: Process base64 as keyId:key string format
              else if (base64Data is String && base64Data.contains(':')) {
                final parts = base64Data.split(':');
                if (parts.length == 2) {
                  final String keyId = parts[0].trim();
                  final String key = parts[1].trim();

                  // Use BetterPlayerClearKeyUtils.generateKey to process the clearKeyHex
                  final Map<String, String> clearKeyHex = {keyId: key};
                  final String generatedKey =
                      BetterPlayerClearKeyUtils.generateKey(clearKeyHex);

                  return jsonDecode(generatedKey); // Same pattern as test:4
                }
              }
            }
            // Third priority: Check if response has "key" and "keyId" fields (format from better_player_notifier.dart)
            else if (responseData.containsKey('key') &&
                responseData.containsKey('keyId')) {
              final String key = responseData['key'];
              final String keyId = responseData['keyId'];

              // Use BetterPlayerClearKeyUtils.generateKey to process the clearKeyHex
              final Map<String, String> clearKeyHex = {keyId: key};
              final String generatedKey = BetterPlayerClearKeyUtils.generateKey(
                clearKeyHex,
              );

              return {
                'kty': 'oct', // Clear Key always uses oct type
                'k': generatedKey,
                'kid': keyId,
              };
            }
            // Fourth priority: Try to parse as direct key-value format
            else if (responseData.isNotEmpty) {
              final String keyId = responseData.keys.first;
              final String key = responseData[keyId]?.toString() ?? '';

              final Map<String, String> clearKeyHex = {keyId: key};
              final String generatedKey = BetterPlayerClearKeyUtils.generateKey(
                clearKeyHex,
              );

              return {'kty': 'oct', 'k': generatedKey, 'kid': keyId};
            }
          }
        } catch (e) {
          // If HTTP request fails, return empty map
          return {};
        } finally {
          client.close();
        }

        // If no valid response, return empty map
        return {};
      }

      // First check if it's a simple keyId:key format (test 4)
      if (licenseKey.contains(':') && !licenseKey.trim().startsWith('{')) {
        final parts = licenseKey.split(':');
        if (parts.length == 2) {
          final String keyId = parts[0].trim();
          final String key = parts[1].trim();

          // Use BetterPlayerClearKeyUtils.generateKey to process the clearKeyHex
          final Map<String, String> clearKeyHex = {keyId: key};
          final String generatedKey = BetterPlayerClearKeyUtils.generateKey(
            clearKeyHex,
          );

          return jsonDecode(
            generatedKey,
          ); // INI ADALAH RETURN ACUAN UNTUK YANG LAINNYA
        }
      }

      // Try to parse as JSON
      final Map<String, dynamic> jsonData = json.decode(licenseKey);

      // Check if it's the format with "keys" array (test 1)
      if (jsonData.containsKey('keys') && jsonData['keys'] is List) {
        // Return the original JSON data as-is
        return jsonData;
      }

      // Check if it's the direct key-value format (test 2)
      // This format has keyId as key and key as value - process with BetterPlayerClearKeyUtils
      // Pattern: {"keyId":"key"} - treat as keyId:key format
      if (jsonData.isNotEmpty && jsonData.length == 1) {
        final String keyId = jsonData.keys.first;
        final String key = jsonData[keyId]?.toString() ?? '';

        // Use BetterPlayerClearKeyUtils.generateKey to process the clearKeyHex
        final Map<String, String> clearKeyHex = {keyId: key};
        final String generatedKeyJson = BetterPlayerClearKeyUtils.generateKey(
          clearKeyHex,
        );

        // Parse the JSON string returned by BetterPlayerClearKeyUtils.generateKey
        final Map<String, dynamic> generatedKeyData = json.decode(
          generatedKeyJson,
        );

        return generatedKeyData;
      }

      // If no keys found, return empty map
      return {};
    } catch (e) {
      // If JSON parsing fails, return empty map
      return {};
    }
  }
}
