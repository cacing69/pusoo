import 'package:pusoo/features/source/domain/entities/source.dart';

abstract class SourceDatasource {
  Future<Source> getActive();
  // Future<List<Playlist>> get();
  // Future<Playlist> find();
  // Future<int> create();
  // Future<void> delete();
  // Future<void> update();
  // Future<int> count();
}
