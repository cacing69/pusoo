import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:forui_base/core/config/env.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'dio_tmdb.g.dart';

@riverpod
Dio dioTmdb(Ref ref) {
  final dio = Dio(
    BaseOptions(
      baseUrl: "https://api.themoviedb.org",
      headers: {
        'Accept': 'application/json',
        'Accept-Encoding': 'gzip, deflate',
        'Accept-Language': 'en-US',
        'User-Agent':
            'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36',
        'Content-Type': 'application/json',
        'connection': 'keep-alive',
        "Authorization":
            "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI5OGRiOTFmZjdmYjg1OGI5NThjYWJiMjIzYjYzNWY1YSIsIm5iZiI6MTc1NzczNTgyNS41ODUsInN1YiI6IjY4YzRlYjkxMTUzMzljYjRjZDg1NjI1NCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.JNfOMZqbQAVTt5u0UZhSNWgwfpvlwfwwRil5QMaHJXA",
      },
    ),
  );

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

  return dio;
}
