import 'package:pusoo/shared/data/models/playlist.dart';

abstract class PlaylistDriftDatasource {
  Future<Playlist> getActivePlaylist();
  Future<int> countAll();
}
