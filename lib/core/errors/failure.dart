/*
 * Pusoo - IPTV Player
 * Copyright (C) 2025 Ibnul Mutaki <ibnuul@gmail.com>
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
 * See the GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program. If not, see <https://www.gnu.org/licenses/>.
 */

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

class ClientRepositoryFailure extends Failure {
  const ClientRepositoryFailure({required super.message, super.data});
}

class UsecaseFailure extends Failure {
  const UsecaseFailure({required super.message, super.data});
}

class CacheFailure extends Failure {
  const CacheFailure({required super.message, super.data});
}
