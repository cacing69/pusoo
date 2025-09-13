import 'package:drift/drift.dart';
import 'package:ulid/ulid.dart';

// part 'playlist.g.dart';

class Playlist extends Table {
  TextColumn get id =>
      text().clientDefault(() => Ulid().toString())(); // ULID as primary key

  TextColumn get name => text()();
  TextColumn get type => text().nullable()();
  TextColumn get epgLink => text().nullable()();
  TextColumn get url => text()();
  DateTimeColumn get lastUpdated => dateTime().nullable()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();

  BoolColumn get isSelected => boolean().clientDefault(() => false)();

  @override
  Set<Column> get primaryKey => {id};
}
