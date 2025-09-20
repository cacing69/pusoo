import 'package:pusoo/features/source/domain/entities/source.dart';
import 'package:pusoo/shared/data/datasources/local/drift/drift_database.dart';

extension SourceDriftDataExtentsion on SourceDriftData {
  Source toEntity() {
    final json = toJson();
    return Source.fromJson(json);
  }
}
