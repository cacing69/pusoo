import 'package:drift/drift.dart';
import 'package:ulid/ulid.dart';

// part 'playlist.g.dart';

class PlaylistDrift extends Table {
  TextColumn get id =>
      text().clientDefault(() => Ulid().toString())(); // ULID as primary key

  TextColumn get name => text()();
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
