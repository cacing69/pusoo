import 'package:drift/drift.dart';

// part 'playlist.g.dart';

class PlaylistDrift extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get name => text()();
  TextColumn get ulid => text()();
  TextColumn get type => text().nullable()();
  TextColumn get contentType => text().nullable()();
  TextColumn get filePath => text().nullable()();
  TextColumn get epgLink => text().nullable()();
  TextColumn get url => text()();
  BoolColumn get isActive => boolean().clientDefault(() => false)();

  DateTimeColumn get lastUpdated => dateTime().nullable()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {id};
}
