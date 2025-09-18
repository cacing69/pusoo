// Drift Database
import 'package:drift/drift.dart';
import 'package:pusoo/shared/data/models/drift/channel_drift.dart';
import 'package:pusoo/features/playlist/domain/models/playlist_drift.dart';
import 'package:pusoo/shared/data/models/drift/playlist_url_history_drift.dart';
import 'package:pusoo/features/track/domain/models/track_drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:path_provider/path_provider.dart';

part 'drift_database.g.dart';

@DriftDatabase(
  tables: [PlaylistDrift, PlaylistUrlHistoryDrift, TrackDrift, ChannelDrift],
)
class AppDatabase extends _$AppDatabase {
  // After generating code, this class needs to define a `schemaVersion` getter
  // and a constructor telling drift where the database should be stored.
  // These are described in the getting started guide: https://drift.simonbinder.eu/setup/
  AppDatabase([QueryExecutor? executor]) : super(executor ?? _openConnection());

  @override
  int get schemaVersion => 16;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (Migrator m) {
        return m.createAll();
      },
      onUpgrade: (Migrator m, int from, int to) async {
        // Hapus semua tabel jika ada perubahan skema
        // Ini adalah cara untuk "reset" database
        for (final table in allTables) {
          await m.deleteTable(table.actualTableName);
        }
        await m.createAll();
      },
    );
  }

  static QueryExecutor _openConnection() {
    return driftDatabase(
      name: 'pusoo_db',
      native: DriftNativeOptions(
        // By default, `driftDatabase` from `package:drift_flutter` stores the
        // database files in `getApplicationDocumentsDirectory()`.
        databaseDirectory: getApplicationSupportDirectory,
      ),
      // If you need web support, see https://drift.simonbinder.eu/platforms/web/
    );
  }
}

final AppDatabase driftDb = AppDatabase();
