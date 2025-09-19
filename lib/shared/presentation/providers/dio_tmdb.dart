import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:pusoo/core/configs/env.dart';
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
            "Bearer ${Env.tmdbReadAccessToken}",
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
