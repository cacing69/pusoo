import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:forui_base/core/config/env.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'open_subtitles_http_client.g.dart';

@riverpod
Dio openSubtitlesHttpClient(Ref ref) {
  final dio = Dio(
    BaseOptions(
      baseUrl: "https://api.opensubtitles.com",
      headers: {
        'Accept': 'application/json',
        'Accept-Encoding': 'gzip, deflate',
        'Accept-Language': 'en-US',
        'User-Agent': 'Pusoo v0.0.1',
        'Content-Type': 'application/json',
        'connection': 'keep-alive',
        "Api-Key": "6CpnKXZPWSiJJl8sjzPb7id8taErmFlO",
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
