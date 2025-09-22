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


import 'package:pusoo/features/subtitle/presentation/providers/subtitle_providers.dart';
import 'package:pusoo/shared/domain/entities/open_subtitles/search_subtitle_query_params.dart';
import 'package:pusoo/shared/domain/entities/open_subtitles/subtitle.dart';
import 'package:pusoo/shared/domain/entities/open_subtitles/t_open_subtitle_search_response.dart';
import 'package:pusoo/shared/presentation/providers/logger_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'search_subtitle_notifier.g.dart';

@Riverpod(keepAlive: true)
class SearchSubtitleNotifier extends _$SearchSubtitleNotifier {
  @override
  AsyncValue<TOpenSubtitleSearchResponse<List<Subtitle>>?> build() {
    return AsyncValue.data(TOpenSubtitleSearchResponse(data: []));
  }

  Future<void> perform(SearchSubtitleQueryParams? params) async {
    final log = ref.read(loggerProvider);
    state = AsyncValue.loading();

    final result = await ref.read(searchSubtitleUsecaseProvider).call(params!);

    result.fold(
      (failure) {
        log.e("SearchSubtitleNotifier error: $failure");
        state = AsyncValue.error(failure, StackTrace.current);
      },
      (data) {
        log.i("SearchSubtitleNotifier success: ${data.data?.length} subtitles");
        state = AsyncValue.data(data);
      },
    );
  }
}
