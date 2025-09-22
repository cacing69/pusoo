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
import 'package:pusoo/features/subtitle/domain/enitities/auth_login.dart';
import 'package:pusoo/features/subtitle/domain/enitities/download_subtitle.dart';
import 'package:pusoo/shared/domain/entities/login_request_body.dart';
import 'package:pusoo/shared/domain/entities/open_subtitles/search_subtitle_query_params.dart';
import 'package:pusoo/shared/domain/entities/open_subtitles/subtitle.dart';
import 'package:pusoo/shared/domain/entities/open_subtitles/t_open_subtitle_search_response.dart';
import 'package:retrofit/retrofit.dart';

part 'open_subtitles_client.g.dart';

@RestApi()
abstract class OpenSubtitlesClient {
  factory OpenSubtitlesClient(Dio dio, {String baseUrl}) = _OpenSubtitlesClient;

  @POST("/api/v1/login")
  Future<AuthLogin> login(
    @Body() LoginRequestBody requestBody,
  );

  @GET("/api/v1/subtitles")
  Future<TOpenSubtitleSearchResponse<List<Subtitle>>> search(
    @Queries() SearchSubtitleQueryParams queryParams,
  );

  @POST("/api/v1/download")
  Future<DownloadSubtitle> download(
    @Queries() SearchSubtitleQueryParams queryParams,
  );
}
