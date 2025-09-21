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


import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pusoo/features/source/domain/entities/source.dart';
import 'package:pusoo/features/track/domain/models/ext_x_media.dart';

part 'track.g.dart';
part 'track.freezed.dart';

@freezed
abstract class Track with _$Track {
  const factory Track({
    @Default(0) int id,
    @Default("") String title,
    @Default("unknown") String contentType,
    @Default([]) List<String> links,
    @Default("") String groupTitle,
    @Default("") String imdbId,
    @Default("") String tvgId,
    @Default("") String tvgName,
    @Default("") String desc,
    @Default("") String tvgLogo,
    @Default(null) Source? source,
    @Default(0) int duration,
    @Default(false) bool isNsfw,

    @Default([]) List<ExtXMedia> extXMedias,
    @Default(false) bool isMovie,
    @Default(false) bool isLiveTv,
    @Default(false) bool isTvSerie,

    @Default({}) Map<String, String> attributes,
    @Default([]) List<Map<String, String>> extVlcOpts,
    @Default([]) List<Map<String, String>> kodiProps,
    @Default([]) List<Map<String, String>> httpHeaders,
  }) = _Track;

  factory Track.fromJson(Map<String, dynamic> json) => _$TrackFromJson(json);

  // factory Track.fromDrift(TrackDriftData trackDrift) {
  //   final json = trackDrift.toJson();

  //   void convertStringToList(String fieldName) {
  //     final dynamic fieldValue = json[fieldName];
  //     if (fieldValue is String) {
  //       if (fieldValue.isEmpty) {
  //         json[fieldName] = [];
  //       } else {
  //         try {
  //           final decoded = jsonDecode(fieldValue);
  //           if (decoded is List) {
  //             json[fieldName] = decoded;
  //           } else {
  //             json[fieldName] = [decoded];
  //           }
  //         } catch (e) {
  //           json[fieldName] = [fieldValue];
  //         }
  //       }
  //     } else if (fieldValue is! List) {
  //       json[fieldName] = [];
  //     }
  //   }

  //   convertStringToList('links');
  //   convertStringToList('extVlcOpts');
  //   convertStringToList('kodiProps');
  //   convertStringToList('httpHeaders');

  //   return Track.fromJson(json);
  // }

  // factory Track.fromDriftTypedResult(drift.TypedResult result) {
  //   dynamic json = result.readTable(driftDb.trackDrift).toJson();
  //   final playlistJson = result.readTable(driftDb.playlistDrift).toJson();

  //   void convertStringToList(String fieldName) {
  //     final dynamic fieldValue = json[fieldName];
  //     if (fieldValue is String) {
  //       if (fieldValue.isEmpty) {
  //         json[fieldName] = [];
  //       } else {
  //         try {
  //           final decoded = jsonDecode(fieldValue);
  //           if (decoded is List) {
  //             json[fieldName] = decoded;
  //           } else {
  //             json[fieldName] = [decoded];
  //           }
  //         } catch (e) {
  //           json[fieldName] = [fieldValue];
  //         }
  //       }
  //     } else if (fieldValue is! List) {
  //       json[fieldName] = [];
  //     }
  //   }

  //   convertStringToList('links');
  //   convertStringToList('extVlcOpts');
  //   convertStringToList('kodiProps');

  //   json['playlist'] = playlistJson;

  //   print(
  //     "track.fromDriftTypedResult.toString:[convert]: ${result.readTable(driftDb.trackDrift).toString()}",
  //   );

  //   return Track.fromJson(json);
  // }
}
