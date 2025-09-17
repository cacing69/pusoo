import 'package:pusoo/features/playlist/domain/models/playlist.dart';

abstract class PlaylistDatasource {
  Future<Playlist> getActive();
  // Future<List<Playlist>> get();
  // Future<Playlist> find();
  // Future<int> create();
  // Future<void> delete();
  // Future<void> update();
  // Future<int> count();
}
