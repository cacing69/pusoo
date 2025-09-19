import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pusoo/core/configs/env.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
// ignore: unnecessary_import
import 'package:flutter_riverpod/flutter_riverpod.dart';
// ignore: depend_on_referenced_packages
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

part 'dio_open_subtitles.g.dart';

@riverpod
Dio dioOpenSubtitles(Ref ref) {
  final dio = Dio(
    BaseOptions(
      baseUrl: "",
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Accept-Encoding': 'gzip, deflate',
        'Accept-Language': 'en-US',
        'Connection': 'keep-alive',
        'Api-Key': Env.openSubtitlesApiKey, // 41a97db583e09927f82691dea4c69876eeb5b270
        'User-Agent': 'Pusoo v1.0.0',
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
