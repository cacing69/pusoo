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

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pusoo/shared/configs/env.dart';
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
        'Api-Key':
            Env.openSubtitlesApiKey, // 41a97db583e09927f82691dea4c69876eeb5b270
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
