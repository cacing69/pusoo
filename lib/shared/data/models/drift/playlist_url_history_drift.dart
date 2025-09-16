import 'package:drift/drift.dart';

// part 'playlist.g.dart';

class PlaylistUrlHistoryDrift extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get url => text().nullable()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {id};
}
