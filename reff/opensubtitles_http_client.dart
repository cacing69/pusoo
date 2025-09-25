import 'dart:io';
import 'dart:convert';

class OpenSubtitlesHttpClient {
  static const String baseUrl = 'https://api.opensubtitles.com/api/v1';
  static const String userAgent = 'Pusoo v1.0.0';
  static const String apiKey = 'ZxzUfxjeQLZu93mRD8gqYKNzO9UJqrrf';

  // Headers default untuk semua request
  static Map<String, String> get defaultHeaders => {
    'User-Agent': userAgent,
    'Content-Type': 'application/json',
    'Api-Key': apiKey,
    'Accept': 'application/json',
  };

  // Method untuk search subtitles
  static Future<Map<String, dynamic>> searchSubtitles({
    required String query,
    int page = 1,
    String languages = 'id',
    int? year,
    String? season,
    String? episode,
  }) async {
    final Map<String, String> queryParams = {
      'query': query,
      'page': page.toString(),
      'languages': languages,
    };

    if (year != null) queryParams['year'] = year.toString();
    if (season != null) queryParams['season'] = season;
    if (episode != null) queryParams['episode'] = episode;

    return await _makeGetRequest('/subtitles', queryParams);
  }

  // Method untuk get subtitle details
  static Future<Map<String, dynamic>> getSubtitleDetails(
    String subtitleId,
  ) async {
    return await _makeGetRequest('/subtitles/$subtitleId');
  }

  // Method untuk download subtitle
  static Future<Map<String, dynamic>> downloadSubtitle(String fileId) async {
    return await _makeGetRequest('/subtitles/$fileId/download');
  }

  // Method untuk get languages
  static Future<Map<String, dynamic>> getLanguages() async {
    return await _makeGetRequest('/infos/languages');
  }

  // Method untuk get user info
  static Future<Map<String, dynamic>> getUserInfo() async {
    return await _makeGetRequest('/infos/user');
  }

  // Private method untuk membuat GET request
  static Future<Map<String, dynamic>> _makeGetRequest(
    String endpoint, [
    Map<String, String>? queryParams,
  ]) async {
    try {
      // Build URL
      String url = '$baseUrl$endpoint';
      if (queryParams != null && queryParams.isNotEmpty) {
        final uri = Uri.parse(url).replace(queryParameters: queryParams);
        url = uri.toString();
      }

      print('Making GET request to: $url');
      print('Headers: $defaultHeaders');

      // Create HTTP client
      final HttpClient httpClient = HttpClient();
      final HttpClientRequest request = await httpClient.getUrl(Uri.parse(url));

      // Add headers
      defaultHeaders.forEach((key, value) {
        request.headers.set(key, value);
      });

      // Send request
      final HttpClientResponse response = await request.close();
      final String responseBody = await response.transform(utf8.decoder).join();

      print('Response Status: ${response.statusCode}');
      print('Response Body: $responseBody');

      // Parse response
      if (response.statusCode == 200) {
        try {
          final Map<String, dynamic> jsonResponse = json.decode(responseBody);
          return {
            'success': true,
            'data': jsonResponse,
            'statusCode': response.statusCode,
          };
        } catch (e) {
          return {
            'success': false,
            'error': 'Failed to parse JSON: $e',
            'statusCode': response.statusCode,
            'rawResponse': responseBody,
          };
        }
      } else {
        return {
          'success': false,
          'error': 'HTTP ${response.statusCode}: $responseBody',
          'statusCode': response.statusCode,
          'rawResponse': responseBody,
        };
      }
    } catch (e) {
      return {'success': false, 'error': 'Exception: $e', 'statusCode': 0};
    }
  }

  // Method untuk membuat POST request
  static Future<Map<String, dynamic>> _makePostRequest(
    String endpoint,
    Map<String, dynamic> body,
  ) async {
    try {
      final String url = '$baseUrl$endpoint';

      print('Making POST request to: $url');
      print('Headers: $defaultHeaders');
      print('Body: $body');

      final HttpClient httpClient = HttpClient();
      final HttpClientRequest request = await httpClient.postUrl(
        Uri.parse(url),
      );

      // Add headers
      defaultHeaders.forEach((key, value) {
        request.headers.set(key, value);
      });

      // Write body
      request.write(json.encode(body));

      final HttpClientResponse response = await request.close();
      final String responseBody = await response.transform(utf8.decoder).join();

      print('Response Status: ${response.statusCode}');
      print('Response Body: $responseBody');

      if (response.statusCode >= 200 && response.statusCode < 300) {
        try {
          final Map<String, dynamic> jsonResponse = json.decode(responseBody);
          return {
            'success': true,
            'data': jsonResponse,
            'statusCode': response.statusCode,
          };
        } catch (e) {
          return {
            'success': false,
            'error': 'Failed to parse JSON: $e',
            'statusCode': response.statusCode,
            'rawResponse': responseBody,
          };
        }
      } else {
        return {
          'success': false,
          'error': 'HTTP ${response.statusCode}: $responseBody',
          'statusCode': response.statusCode,
          'rawResponse': responseBody,
        };
      }
    } catch (e) {
      return {'success': false, 'error': 'Exception: $e', 'statusCode': 0};
    }
  }

  // Method untuk login (jika diperlukan)
  static Future<Map<String, dynamic>> login({
    required String username,
    required String password,
  }) async {
    final Map<String, dynamic> loginData = {
      'username': username,
      'password': password,
    };

    return await _makePostRequest('/login', loginData);
  }
}

// Test function
void main() async {
  print('=== OpenSubtitles HTTP Client Test ===\n');

  // Test 1: Search subtitles
  print('Test 1: Search subtitles for "breaking bad"');
  final searchResult = await OpenSubtitlesHttpClient.searchSubtitles(
    query: 'nobody 2',
    page: 3,
    languages: 'id',
  );

  if (searchResult['success']) {
    print('SUCCESS: Search completed');
    final data = searchResult['data'];

    print('Data keys: ${data.keys.toList()}');

    if (data.containsKey('data')) {
      print('Subtitles found: ${data['data']?.length ?? 0}');
    }
    if (data.containsKey('total_pages')) {
      print('Total pages: ${data['total_pages']}');
    }
    if (data.containsKey('total_count')) {
      print('Total count: ${data['total_count']}');
    }
  } else {
    print('ERROR: ${searchResult['error']}');
    print('Status Code: ${searchResult['statusCode']}');
  }

  // print('\n' + '=' * 50 + '\n');

  // // Test 2: Get languages
  // print('Test 2: Get available languages');
  // final languagesResult = await OpenSubtitlesHttpClient.getLanguages();

  // if (languagesResult['success']) {
  //   print('SUCCESS: Languages retrieved');
  //   final data = languagesResult['data'];
  //   print('Languages data: $data');
  // } else {
  //   print('ERROR: ${languagesResult['error']}');
  //   print('Status Code: ${languagesResult['statusCode']}');
  // }

  print('\n=== Test Completed ===');
}
