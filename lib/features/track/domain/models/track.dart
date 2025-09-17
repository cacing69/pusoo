import 'dart:convert';

import 'package:drift/drift.dart' as drift;
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pusoo/features/playlist/domain/models/playlist.dart';
import 'package:pusoo/shared/data/datasources/local/drift/drift_database.dart';

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
    @Default("") String tvgLogo,
    @Default(null) Playlist? playlist,
    @Default(0) int duration,
    @Default(false) bool isNsfw,

    @Default(false) bool isMovie,
    @Default(false) bool isLiveTv,
    @Default(false) bool isTvSerie,

    @Default({}) Map<String, String> attributes,
    @Default([]) List<Map<String, String>> extVlcOpts,
    @Default([]) List<Map<String, String>> kodiProps,
    @Default([]) List<Map<String, String>> httpHeaders,
  }) = _Track;

  factory Track.fromJson(Map<String, dynamic> json) => _$TrackFromJson(json);

  factory Track.fromDrift(TrackDriftData trackDrift) {
    final json = trackDrift.toJson();

    void convertStringToList(String fieldName) {
      final dynamic fieldValue = json[fieldName];
      if (fieldValue is String) {
        if (fieldValue.isEmpty) {
          json[fieldName] = [];
        } else {
          try {
            final decoded = jsonDecode(fieldValue);
            if (decoded is List) {
              json[fieldName] = decoded;
            } else {
              json[fieldName] = [decoded];
            }
          } catch (e) {
            json[fieldName] = [fieldValue];
          }
        }
      } else if (fieldValue is! List) {
        json[fieldName] = [];
      }
    }

    convertStringToList('links');
    convertStringToList('extVlcOpts');
    convertStringToList('kodiProps');
    convertStringToList('httpHeaders');

    return Track.fromJson(json);
  }

  factory Track.fromDriftTypedResult(drift.TypedResult result) {
    dynamic json = result.readTable(driftDb.trackDrift).toJson();
    final playlistJson = result.readTable(driftDb.playlistDrift).toJson();

    void convertStringToList(String fieldName) {
      final dynamic fieldValue = json[fieldName];
      if (fieldValue is String) {
        if (fieldValue.isEmpty) {
          json[fieldName] = [];
        } else {
          try {
            final decoded = jsonDecode(fieldValue);
            if (decoded is List) {
              json[fieldName] = decoded;
            } else {
              json[fieldName] = [decoded];
            }
          } catch (e) {
            json[fieldName] = [fieldValue];
          }
        }
      } else if (fieldValue is! List) {
        json[fieldName] = [];
      }
    }

    convertStringToList('links');
    convertStringToList('extVlcOpts');
    convertStringToList('kodiProps');

    json['playlist'] = playlistJson;

    return Track.fromJson(json);
  }
}
