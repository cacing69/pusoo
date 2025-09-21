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

import 'dart:convert';
import 'package:dio/dio.dart';

// Import entities yang diperlukan
import '../lib/shared/domain/entities/open_subtitles/t_open_subtitle_search_response.dart';
import '../lib/shared/domain/entities/open_subtitles/subtitle.dart';

void main() async {
  print('🚀 Testing OpenSubtitles API with Dio Instance...\n');

  try {
    // Membuat Dio instance seperti di proyek
    final dio = Dio(
      BaseOptions(
        baseUrl: "https://api.opensubtitles.com",
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
          'Accept-Encoding': 'gzip, deflate',
          'Accept-Language': 'en-US',
          'User-Agent': 'Pusoo v1.0.0',
          'connection': 'keep-alive',
          "Api-Key": "6CpnKXZPWSiJJl8sjzPb7id8taErmFlO",
        },
      ),
    );

    // Menambahkan custom logger interceptor untuk testing
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          print('📤 REQUEST: ${options.method} ${options.uri}');
          print('📋 Headers: ${options.headers}');
          print('📋 Query Params: ${options.queryParameters}');
          handler.next(options);
        },
        onResponse: (response, handler) {
          print(
            '📥 RESPONSE: ${response.statusCode} ${response.statusMessage}',
          );
          print('📋 Response Headers: ${response.headers}');
          handler.next(response);
        },
        onError: (error, handler) {
          print('❌ ERROR: ${error.message}');
          handler.next(error);
        },
      ),
    );

    // Query parameters
    final queryParams = {
      'page': 1,
      'User-Agent': 'Pusoo v1.0.0',
      'query': 'el camino',
      'languages': 'id',
    };

    print('📡 Making request to: ${dio.options.baseUrl}/api/v1/subtitles');
    print('📋 Headers:');
    dio.options.headers.forEach((key, value) {
      print('   $key: $value');
    });
    print('📋 Query Parameters:');
    queryParams.forEach((key, value) {
      print('   $key: $value');
    });
    print('');

    // Mengirim request dengan Dio instance
    final response = await dio.get(
      '/api/v1/subtitles',
      queryParameters: queryParams,
      options: Options(
        validateStatus: (status) {
          // Accept all status codes for testing
          return true;
        },
      ),
    );

    print('📊 Response Status: ${response.statusCode}');
    print('📊 Response Headers:');
    response.headers.forEach((name, values) {
      print('   $name: ${values.join(', ')}');
    });
    print('');

    // Response body sudah dalam bentuk Map<String, dynamic>
    final responseBody = response.data;

    if (response.statusCode == 200) {
      print('✅ SUCCESS! Response 200 received');
      print('📄 Response Body:');

      try {
        // Response body sudah dalam bentuk Map<String, dynamic> dari Dio
        final jsonData = responseBody as Map<String, dynamic>;

        // Parse menggunakan TOpenSubtitleSearchResponse<List<Subtitle>>
        final searchResponse =
            TOpenSubtitleSearchResponse<List<Subtitle>>.fromJson(jsonData, (
              json,
            ) {
              // json parameter adalah data field dari response
              if (json is List) {
                return json.map((item) {
                  try {
                    return Subtitle.fromJson(item as Map<String, dynamic>);
                  } catch (e) {
                    print('Error parsing subtitle: $e');
                    // Return subtitle dengan data minimal jika parsing gagal
                    return Subtitle(
                      id: item['id']?.toString(),
                      type: item['type']?.toString(),
                      attributes: null,
                    );
                  }
                }).toList();
              }
              return <Subtitle>[];
            });

        print('🎯 Parsed using TOpenSubtitleSearchResponse<List<Subtitle>>:');
        print('   Page: ${searchResponse.page}');
        print('   Total Pages: ${searchResponse.totalPages}');
        print('   Total Count: ${searchResponse.totalCount}');
        print('   Per Page: ${searchResponse.perPage}');
        print('   Data Length: ${searchResponse.data?.length ?? 0}');

        if (searchResponse.data != null && searchResponse.data!.isNotEmpty) {
          print('\n📝 First subtitle:');
          final firstSubtitle = searchResponse.data!.first;
          print('   ID: ${firstSubtitle.id}');
          print('   Type: ${firstSubtitle.type}');
          if (firstSubtitle.attributes != null) {
            print('   Language: ${firstSubtitle.attributes!.language}');
            print(
              '   Download Count: ${firstSubtitle.attributes!.downloadCount}',
            );
            print('   Upload Date: ${firstSubtitle.attributes!.uploadDate}');
            print('   Release: ${firstSubtitle.attributes!.release}');
            print('   HD: ${firstSubtitle.attributes!.hd}');
            print(
              '   Hearing Impaired: ${firstSubtitle.attributes!.hearingImpaired}',
            );
            print(
              '   Machine Translated: ${firstSubtitle.attributes!.machineTranslated}',
            );
          }
        }

        // Tampilkan raw JSON juga untuk referensi
        print('\n📄 Raw JSON Response:');
        final prettyJson = const JsonEncoder.withIndent('  ').convert(jsonData);
        print(prettyJson);
      } catch (e) {
        print('❌ Error parsing response: $e');
        print('📄 Raw Response Body:');
        print(responseBody);
      }
    } else {
      print('❌ ERROR! Expected status 200, got ${response.statusCode}');
      print('📄 Response Body:');
      print(responseBody);
    }

    // Dio tidak perlu di-close secara manual
  } catch (e) {
    print('❌ ERROR occurred: $e');
  }

  print('\n🏁 Test completed!');
}
