import 'package:drift/drift.dart';
import 'package:pusoo/features/playlist/data/models/playlist_drift.dart';

class TrackDrift extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get playlistId => integer().references(PlaylistDrift, #id)();
  TextColumn get title => text()();
  TextColumn get contentType => text().nullable()();
  TextColumn get links => text().nullable()();
  TextColumn get groupTitle => text().nullable()();
  TextColumn get imdbId => text().nullable()();
  TextColumn get tvgId => text().nullable()();
  TextColumn get tvgName => text().nullable()();
  TextColumn get tvgLogo => text().nullable()();
  TextColumn get desc => text().nullable()();
  IntColumn get duration => integer().nullable()();
  BoolColumn get isNsfw => boolean().withDefault(const Constant(false))();

  BoolColumn get isMovie => boolean().withDefault(const Constant(false))();
  BoolColumn get isLiveTv => boolean().withDefault(const Constant(false))();
  BoolColumn get isTvSerie => boolean().withDefault(const Constant(false))();

  TextColumn get attributes => text().nullable()();
  TextColumn get kodiProps => text().nullable()();
  TextColumn get extVlcOpts => text().nullable()();
  TextColumn get httpHeaders => text().nullable()();

  DateTimeColumn get lastUpdated => dateTime().nullable()();

  // extra field

  @override
  Set<Column> get primaryKey => {id};
}
