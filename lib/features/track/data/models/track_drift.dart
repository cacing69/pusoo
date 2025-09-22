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


import 'package:drift/drift.dart';
import 'package:pusoo/features/source/data/models/source_drift.dart';

class TrackDrift extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get sourceId => integer().references(SourceDrift, #id)();
  TextColumn get title => text()();
  TextColumn get contentType => text().nullable()();
  TextColumn get links => text().nullable()();
  TextColumn get groupTitle => text().nullable()();
  TextColumn get imdbId => text().nullable()();
  TextColumn get tvgId => text().nullable()();
  TextColumn get tvgName => text().nullable()();
  TextColumn get tvgLogo => text().nullable()();
  TextColumn get desc => text().nullable()();
  IntColumn get duration => integer().nullable()();
  BoolColumn get isNsfw => boolean().withDefault(const Constant(false))();

  BoolColumn get isMovie => boolean().withDefault(const Constant(false))();
  BoolColumn get isLiveTv => boolean().withDefault(const Constant(false))();
  BoolColumn get isTvSerie => boolean().withDefault(const Constant(false))();

  TextColumn get attributes => text().nullable()();
  TextColumn get kodiProps => text().nullable()();
  TextColumn get extVlcOpts => text().nullable()();
  TextColumn get httpHeaders => text().nullable()();

  DateTimeColumn get lastUpdated => dateTime().nullable()();

  // extra field

  @override
  Set<Column> get primaryKey => {id};
}
