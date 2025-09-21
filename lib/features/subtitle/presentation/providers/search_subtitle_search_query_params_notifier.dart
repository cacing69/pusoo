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


import 'package:pusoo/shared/domain/entities/open_subtitles/search_subtitle_query_params.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'search_subtitle_search_query_params_notifier.g.dart';

@riverpod
class SearchSubtitleQueryParamsNotifier
    extends _$SearchSubtitleQueryParamsNotifier {
  @override
  SearchSubtitleQueryParams build() {
    return SearchSubtitleQueryParams(
      languages: 'id', // Default language
    );
  }

  void updateQuery(String query) {
    state = state.copyWith(query: query);
  }

  void updateLanguage(String language) {
    state = state.copyWith(languages: language);
  }

  void updatePage(int page) {
    state = state.copyWith(page: page);
  }
}
