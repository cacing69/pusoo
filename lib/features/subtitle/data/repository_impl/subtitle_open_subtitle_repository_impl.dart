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

// import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:logger/logger.dart';
import 'package:pusoo/shared/errors/failure.dart';
import 'package:pusoo/shared/data/datasources/remote/open_subtitles_client.dart';
import 'package:pusoo/shared/domain/entities/open_subtitles/search_subtitle_query_params.dart';
import 'package:pusoo/shared/domain/entities/open_subtitles/subtitle.dart';
import 'package:pusoo/shared/domain/entities/open_subtitles/t_open_subtitle_search_response.dart';
import 'package:pusoo/shared/domain/repositories/open_subtitles/subtitle_repository.dart';
// import 'package:http/http.dart' as http;

class SubtitleOpenSubtitleRepositoryImpl implements SubtitleRepository {
  final OpenSubtitlesClient client;
  final Logger log;

  SubtitleOpenSubtitleRepositoryImpl(this.client, this.log);

  @override
  Future<Either<Failure, TOpenSubtitleSearchResponse<List<Subtitle>>>> search(
    SearchSubtitleQueryParams params,
  ) async {
    return Right(await client.search(params));
    // try {
    //   // final result = await client.searchSubtitle(params);

    //   // final url =
    //   //     'https://api.opensubtitles.com/api/v1/subtitles?page=1&User-Agent=Pusoo%20v1.0.0&query=el%20camino&languages=id';

    //   final url =
    //       'https://api.opensubtitles.com/api/v1/subtitles?page=1&User-Agent=Pusoo%20v1.0.0&query=el%20camino&languages=';

    //   // Headers yang diperlukan
    //   final headers = {
    //     'User-Agent': 'Pusoo v1.0.0',
    //     'Api-Key': '6CpnKXZPWSiJJl8sjzPb7id8taErmFlO',
    //     'Content-Type': 'application/json',
    //     'Accept': 'application/json',
    //   };

    //   final client = HttpClient();
    //   final request = await client.getUrl(Uri.parse(url));

    //   headers.forEach((key, value) {
    //     request.headers.set(key, value);
    //   });

    //   final response = await request.close();

    //   final responseBody = await response.transform(utf8.decoder).join();

    //   if (response.statusCode == 200) {
    //     try {
    //       final jsonData = json.decode(responseBody);

    //       // final data = jsonData['data'] as List<dynamic>? ?? [];

    //       // logger.d(data);

    //       // final subtitles = data.map((item) {
    //       //   try {
    //       //     return Subtitle.fromJson(item as Map<String, dynamic>);
    //       //   } catch (e) {
    //       //     logger.e('Error parsing subtitle item: $e');
    //       //     logger.e('Raw item data: $item');
    //       //     return Subtitle(
    //       //       id: item['id']?.toString(),
    //       //       type: item['type']?.toString(),
    //       //       attributes: null,
    //       //     );
    //       //   }
    //       // }).toList();

    //       final searchResponse =
    //           TOpenSubtitleSearchResponse<List<Subtitle>>.fromJson(jsonData, (
    //             json,
    //           ) {
    //             if (json is List) {
    //               return json.map((item) {
    //                 try {
    //                   return Subtitle.fromJson(item);
    //                 } catch (e) {
    //                   logger.e('Error parsing subtitle item: $e');
    //                   logger.e('Raw item data: $item');
    //                   return Subtitle(
    //                     id: item['id']?.toString(),
    //                     type: item['type']?.toString(),
    //                     attributes: null,
    //                   );
    //                 }
    //               }).toList();
    //             }
    //             return <Subtitle>[];
    //           });

    //       // final searchResponse =
    //       //     TOpenSubtitleSearchResponse<List<Subtitle>>.fromJson(jsonData, (
    //       //       json,
    //       //     ) {
    //       //       if (json is List) {
    //       //         return json.map((item) {
    //       //           try {
    //       //             return Subtitle.fromJson(item as Map<String, dynamic>);
    //       //           } catch (e) {
    //       //             logger.e('Error parsing subtitle item: $e');
    //       //             logger.e('Raw item data: $item');
    //       //             return Subtitle(
    //       //               id: item['id']?.toString(),
    //       //               type: item['type']?.toString(),
    //       //               attributes: null,
    //       //             );
    //       //           }
    //       //         }).toList();
    //       //       }
    //       //       return <Subtitle>[];
    //       //     });

    //       client.close();

    //       return Right(searchResponse);
    //     } catch (e) {
    //       client.close();
    //       logger.e('Error parsing response: $e');
    //       logger.e('Raw Response Body:');
    //       logger.e(responseBody);
    //     }
    //   }

    //   return Right(TOpenSubtitleSearchResponse(data: []));

    //   // final result = await client.(params);
    //   // return Right(result);

    //   // return  Right(client.searchSubtitle(queryParams));
    // } on Exception catch (e) {
    //   return Left(ClientRepositoryFailure(message: e.toString()));
    // } catch (e) {
    //   return Left(
    //     ServerFailure(message: 'An unexpected error occurred: ${e.toString()}'),
    //   );
    // }
  }
}
