import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
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
