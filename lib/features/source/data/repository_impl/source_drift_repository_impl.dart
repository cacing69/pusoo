import 'package:dartz/dartz.dart';
import 'package:pusoo/core/errors/failure.dart';
import 'package:pusoo/features/source/data/datasource/source_datasource.dart';
import 'package:pusoo/features/source/domain/entities/source.dart';
import 'package:pusoo/features/source/domain/repository/source_repository.dart';

class SourceDriftRepositoryImpl implements SourceRepository {
  final SourceDatasource _datasource;

  SourceDriftRepositoryImpl(this._datasource);

  @override
  Future<Either<Failure, Source>> getActive() async {
    try {
      final result = await _datasource.getActive();
      return Right(result);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }
}
