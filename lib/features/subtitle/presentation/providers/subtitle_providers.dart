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


import 'package:pusoo/features/subtitle/domain/usecases/search_subtitle_usecase.dart';
import 'package:pusoo/features/subtitle/data/repository_impl/subtitle_open_subtitle_repository_impl.dart';
import 'package:pusoo/shared/domain/repositories/open_subtitles/subtitle_repository.dart';
import 'package:pusoo/shared/presentation/providers/client_providers.dart';
import 'package:pusoo/shared/presentation/providers/logger_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'subtitle_providers.g.dart';

@riverpod
SubtitleRepository subtitleOpenSubtitlesRepository(Ref ref) {
  return SubtitleOpenSubtitleRepositoryImpl(
    ref.read(openSubtitlesClientProvider),
    ref.read(loggerProvider),
  );
}

@riverpod
SearchSubtitleUsecase searchSubtitleUsecase(Ref ref) {
  return SearchSubtitleUsecase(
    ref.read(subtitleOpenSubtitlesRepositoryProvider),
    ref.read(loggerProvider),
  );
}
