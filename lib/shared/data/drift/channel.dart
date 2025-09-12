import 'package:drift/drift.dart';
// import 'package:pusoo/shared/data/drift/playlist.dart';
import 'package:ulid/ulid.dart';

class Channel extends Table {
  TextColumn get id => text().clientDefault(() => Ulid().toString())();
  TextColumn get playlistId =>
      text().customConstraint('REFERENCES playlist(id) NOT NULL')();
  // late final playlistId = integer().references(Playlist, #id)();
  TextColumn get name => text()(); // display name
  TextColumn get tvgId => text().nullable()();
  TextColumn get tvgName => text().nullable()();
  TextColumn get logo => text().nullable()();
  TextColumn get groupTitle => text().nullable()();
  TextColumn get streamUrl => text()();
  TextColumn get category => text().nullable()(); // movie / series
  BoolColumn get isFavorite => boolean().withDefault(const Constant(false))();
  BoolColumn get isWatched => boolean().withDefault(const Constant(false))();
  DateTimeColumn get lastUpdated => dateTime().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}
