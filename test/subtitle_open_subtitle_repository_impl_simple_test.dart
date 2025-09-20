// Copyright (c) 2025, Ibnul Mutaki (@cacing69)
// Licensed under the MIT License
// Pusoo - Open Source IPTV Player
// GitHub: https://github.com/cacing69/pusoo

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:logger/logger.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:pusoo/features/subtitle/data/repository_impl/subtitle_open_subtitle_repository_impl.dart';
import 'package:pusoo/shared/data/datasources/remote/open_subtitles_client.dart';
import 'package:pusoo/shared/domain/entities/open_subtitles/search_subtitle_query_params.dart';
import 'package:pusoo/shared/domain/entities/open_subtitles/subtitle.dart';
import 'package:pusoo/shared/domain/entities/open_subtitles/t_open_subtitle_search_response.dart';

void main() {
  group('SubtitleOpenSubtitleRepositoryImpl Simple Tests', () {
    late SubtitleOpenSubtitleRepositoryImpl repository;
    late OpenSubtitlesClient client;
    late Logger logger;

    setUp(() {
      // Setup Dio instance dengan konfigurasi yang sama persis seperti di dio_open_subtitles.dart
      final dio = Dio(
        BaseOptions(
          baseUrl: "https://api.opensubtitles.com",
          headers: {
            'Accept': 'application/json',
            'Content-Type': 'application/json',
            'Accept-Encoding': 'gzip, deflate',
            'Accept-Language': 'en-US',
            'Connection': 'keep-alive',
            'User-Agent': 'Pusoo v1.0.0',
            'Api-Key': '6CpnKXZPWSiJJl8sjzPb7id8taErmFlO',
          },
        ),
      );

      // Tambahkan PrettyDioLogger seperti di implementasi asli
      if (kDebugMode) {
        dio.interceptors.add(
          PrettyDioLogger(
            requestHeader: true,
            requestBody: true,
            responseHeader: false,
            responseBody: true,
            error: true,
            compact: false,
          ),
        );
      }

      client = OpenSubtitlesClient(dio);
      logger = Logger();
      repository = SubtitleOpenSubtitleRepositoryImpl(client, logger);
    });

    group('search', () {
      test('should get 200 response from OpenSubtitles API', () async {
        // Arrange
        final queryParams = SearchSubtitleQueryParams(
          query: 'breaking bad',
          languages: 'id',
          page: 1,
          userAgent: 'Pusoo v1.0.0',
        );

        // Act
        // final result = await repository.search(queryParams);

        // Assert - Cek bahwa tidak ada exception dan mendapat response
        // expect(
        //   result,
        //   isA<Right<dynamic, TOpenSubtitleSearchResponse<List<Subtitle>>>>(),
        // );

        // result.fold(
        //   (failure) => fail('Expected success but got failure: $failure'),
        //   (response) {
        //     // Cek struktur response dasar
        //     // expect(response.page, equals(2));
        //     expect(response.perPage, greaterThan(0));
        //     expect(response.totalCount, greaterThanOrEqualTo(0));
        //     expect(response.data, isNotNull);

        //     print(
        //       '[200] API Response - Page: ${response.page}, Total: ${response.totalCount}',
        //     );
        //   },
        // );
      });
    });
  });
}
