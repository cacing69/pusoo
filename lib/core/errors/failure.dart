import 'package:equatable/equatable.dart';

class Failure extends Equatable implements Exception {
  final String message;
  final dynamic data;

  const Failure({required this.message, this.data = const {}});

  @override
  String toString() => message;

  @override
  List<Object?> get props => [message, data];
}

class ConnectionFailure extends Failure {
  const ConnectionFailure({required super.message, super.data});
}

class ServerFailure extends Failure {
  const ServerFailure({required super.message, super.data});
}

class CacheFailure extends Failure {
  const CacheFailure({required super.message, super.data});
}
