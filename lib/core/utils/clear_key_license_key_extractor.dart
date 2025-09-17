import 'dart:convert';
import 'package:better_player_plus/better_player_plus.dart';
import 'package:http/http.dart' as http;

class ClearKeyLicenseKeyExtractor {
  static Future<Map<String, dynamic>> extract(String licenseKey, {Map<String, String>? headers}) async {
    try {
      // Check if it's a URL (test 5)
      if (licenseKey.startsWith('http://') || licenseKey.startsWith('https://')) {
        final client = http.Client();
        try {
          // Make HTTP request to get the license key with redirect following
          final defaultHeaders = {
            'User-Agent': 'Mozilla/5.0 (compatible; ClearKeyExtractor/1.0)',
          };
          final requestHeaders = {...defaultHeaders, ...?headers};
          
          final response = await client.get(Uri.parse(licenseKey), headers: requestHeaders);
          
          if (response.statusCode == 200) {
            final Map<String, dynamic> responseData = json.decode(response.body);
            
            // First priority: Check if response has "keys" array and take the first one
            if (responseData.containsKey('keys') && responseData['keys'] is List) {
              final List<dynamic> keys = responseData['keys'];
              if (keys.isNotEmpty) {
                final Map<String, dynamic> firstKey = keys[0];
                return {
                  'kty': firstKey['kty'] ?? '',
                  'k': firstKey['k'] ?? '',
                  'kid': firstKey['kid'] ?? '',
                };
              }
            }
            // Second priority: Check if response has "key" and "keyId" fields (format from better_player_notifier.dart)
            else if (responseData.containsKey('key') && responseData.containsKey('keyId')) {
              final String key = responseData['key'];
              final String keyId = responseData['keyId'];
              
              // Use BetterPlayerClearKeyUtils.generateKey to process the clearKeyHex
              final Map<String, String> clearKeyHex = {keyId: key};
              final String generatedKey = BetterPlayerClearKeyUtils.generateKey(clearKeyHex);
              
              return {
                'kty': 'oct', // Clear Key always uses oct type
                'k': generatedKey,
                'kid': keyId,
              };
            }
            // Third priority: Try to parse as direct key-value format
            else if (responseData.isNotEmpty) {
              final String keyId = responseData.keys.first;
              final String key = responseData[keyId]?.toString() ?? '';
              
              final Map<String, String> clearKeyHex = {keyId: key};
              final String generatedKey = BetterPlayerClearKeyUtils.generateKey(clearKeyHex);
              
              return {
                'kty': 'oct',
                'k': generatedKey,
                'kid': keyId,
              };
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
          final String generatedKey = BetterPlayerClearKeyUtils.generateKey(clearKeyHex);
          
          return {
            'kty': 'oct', // Clear Key always uses oct type
            'k': generatedKey,
            'kid': keyId,
          };
        }
      }
      
      // Try to parse as JSON
      final Map<String, dynamic> jsonData = json.decode(licenseKey);
      
      // Check if it's the format with "keys" array (test 1)
      if (jsonData.containsKey('keys') && jsonData['keys'] is List) {
        final List<dynamic> keys = jsonData['keys'];
        if (keys.isNotEmpty) {
          final Map<String, dynamic> firstKey = keys[0];
          return {
            'kty': firstKey['kty'] ?? '',
            'k': firstKey['k'] ?? '',
            'kid': firstKey['kid'] ?? '',
          };
        }
      }
      
      // Check if it's the direct key-value format (test 2)
      // This format has keyId as key and key as value
      if (jsonData.isNotEmpty) {
        final String keyId = jsonData.keys.first;
        final String key = jsonData[keyId]?.toString() ?? '';
        
        // Use BetterPlayerClearKeyUtils.generateKey to process the clearKeyHex
        final Map<String, String> clearKeyHex = {keyId: key};
        final String generatedKey = BetterPlayerClearKeyUtils.generateKey(clearKeyHex);
        
        return {
          'kty': 'oct', // Clear Key always uses oct type
          'k': generatedKey,
          'kid': keyId,
        };
      }
      
      // If no keys found, return empty map
      return {};
    } catch (e) {
      // If JSON parsing fails, return empty map
      return {};
    }
  }
}
