import 'package:logger/logger.dart';
import 'package:pusoo/features/source/data/datasource/source_datasource.dart';
import 'package:pusoo/features/source/data/models/source_drift_data_extension.dart';
import 'package:pusoo/features/source/domain/entities/source.dart';
import 'package:pusoo/shared/data/datasources/local/drift/drift_database.dart';

class SourceDriftDatasourceImpl implements SourceDatasource {
  final Logger _log;

  SourceDriftDatasourceImpl(this._log);

  @override
  Future<Source> getActive() async {
    try {
      final source = await (driftDb.select(
        driftDb.sourceDrift,
      )..where((tbl) => tbl.isActive.equals(true))).getSingle();

      _log.i(source);

      return source.toEntity();
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
