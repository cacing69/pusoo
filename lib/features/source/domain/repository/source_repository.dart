import 'package:dartz/dartz.dart';
import 'package:pusoo/core/errors/failure.dart';
import 'package:pusoo/features/source/domain/entities/source.dart';

abstract class SourceRepository {
  Future<Either<Failure, Source>> getActive();
}
