import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:pusoo/features/track/domain/models/track.dart';
import 'package:pusoo/shared/data/datasources/local/drift/drift_database.dart';

extension TrackDriftDataExt on TrackDriftData {
  toEntity() {
    // fromDrift(TrackDriftData trackDrift) {
    final json = toJson();

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
}

extension TrackTypedResultExt on TypedResult {
  Track toEntity() {
    dynamic json = readTable(driftDb.trackDrift).toJson();

    final playlistJson = readTable(driftDb.playlistDrift).toJson();

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
