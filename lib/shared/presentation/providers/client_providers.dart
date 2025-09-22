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

import 'package:pusoo/shared/data/datasources/remote/open_subtitles_client.dart';
import 'package:pusoo/shared/data/datasources/remote/tmdb_client.dart';
import 'package:pusoo/shared/presentation/providers/dio_open_subtitles.dart';
import 'package:pusoo/shared/presentation/providers/dio_tmdb.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'client_providers.g.dart';

@riverpod
TMDBClient tmdbClient(Ref ref) {
  return TMDBClient(ref.read(dioTmdbProvider));
}

@riverpod
OpenSubtitlesClient openSubtitlesClient(Ref ref) {
  return OpenSubtitlesClient(ref.read(dioOpenSubtitlesProvider));
}
