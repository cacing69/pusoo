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


import 'package:pusoo/shared/data/models/clasification_rules/rules/is_url_contains_movie_with_slashs_rule.dart';
import 'package:pusoo/shared/data/models/clasification_rules/classificator.dart';
import 'package:pusoo/shared/data/models/clasification_rules/rules/is_url_contains_series_with_slashs_rule.dart';
import 'package:pusoo/shared/data/models/clasification_rules/rules/is_url_not_contains_movie_and_series_with_slashs_rule.dart';
import 'package:pusoo/shared/domain/entities/playlist_template.dart';

final xtreamPlaylistTemplate = PlaylistTemplate(
  name: "general",
  label: "General",
  movieClassifier: Classificator([IsUrlContainsMoviesWithSlashsRule()]),
  liveTvClassifier: Classificator([
    IsUrlNotContainsMovieAndSeriesWithSlashsRule(),
  ]),
  tvSerieClassifier: Classificator([IsUrlContainsSeriesWithSlashsRule()]),
);
