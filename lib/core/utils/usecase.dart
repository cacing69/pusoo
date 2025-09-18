// Copyright (c) 2025, Ibnul Mutaki (@cacing69)
// Licensed under the MIT License
// Pusoo - Open Source IPTV Player
// GitHub: https://github.com/cacing69/pusoo

import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pusoo/core/errors/failure.dart';

part 'usecase.freezed.dart';

abstract class UseCase<T, Params> {
  Future<Either<Failure, T>> call(Params params);
}

@freezed
class NoParams with _$NoParams {
  const factory NoParams() = _NoParams;
}
