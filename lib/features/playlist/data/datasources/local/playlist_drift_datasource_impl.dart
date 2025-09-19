import 'package:logger/logger.dart';
import 'package:pusoo/features/playlist/data/datasources/local/playlist_datasource.dart';
import 'package:pusoo/features/playlist/data/models/playlist_drift_data_ext.dart';
import 'package:pusoo/features/playlist/domain/models/playlist.dart';
import 'package:pusoo/shared/data/datasources/local/drift/drift_database.dart';

class PlaylistDriftDatasourceImpl implements PlaylistDatasource {
  final Logger _log;

  PlaylistDriftDatasourceImpl(this._log);

  @override
  Future<Playlist> getActive() async {
    try {
      final playlist = await (driftDb.select(
        driftDb.playlistDrift,
      )..where((tbl) => tbl.isActive.equals(true))).getSingle();

      _log.i(playlist);

      return playlist.toEntity();
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
