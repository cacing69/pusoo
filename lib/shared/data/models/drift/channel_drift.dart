import 'package:drift/drift.dart';
import 'package:pusoo/features/playlist/data/models/playlist_drift.dart';
// import 'package:pusoo/shared/data/drift/playlist.dart';

class ChannelDrift extends Table {
  IntColumn get id => integer().autoIncrement()();
  // TextColumn get playlistId =>
  //     text().customConstraint('REFERENCES playlist_drift(id) NOT NULL')();
  TextColumn get playlistId => text().references(PlaylistDrift, #id)();
  TextColumn get name => text()(); // display name
  TextColumn get tvgId => text().nullable()();
  TextColumn get tmdbId => text().nullable()();
  TextColumn get tvgName => text().nullable()();
  TextColumn get logo => text().nullable()();
  TextColumn get groupTitle => text().nullable()();
  TextColumn get streamUrl => text()();
  // TextColumn get category => text().nullable()(); // movie / series
  BoolColumn get isFavorite => boolean().withDefault(const Constant(false))();
  BoolColumn get isLiveTv => boolean().withDefault(const Constant(false))();
  BoolColumn get isMovie => boolean().withDefault(const Constant(false))();
  BoolColumn get isTvSerie => boolean().withDefault(const Constant(false))();
  BoolColumn get isWatched => boolean().withDefault(const Constant(false))();
  DateTimeColumn get lastUpdated => dateTime().nullable()();

  // extra field
  TextColumn get kodiprop => text().nullable()();
  TextColumn get extvlcopt => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}
