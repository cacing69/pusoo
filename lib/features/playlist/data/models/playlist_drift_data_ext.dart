import 'package:pusoo/features/playlist/domain/models/playlist.dart';
import 'package:pusoo/shared/data/datasources/local/drift/drift_database.dart';

extension PlaylistDriftDataExt on PlaylistDriftData {
  Playlist toEntity() {
    final json = toJson();
    return Playlist.fromJson(json);
  }
}
