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


import 'package:pusoo/shared/data/models/clasification_rules/classification_rule.dart';
import 'package:pusoo/features/track/domain/models/track.dart';

class IsUrlContainsSeriesWithSlashsRule implements ClassificationRule {
  @override
  bool isSatisfiedBy(Track track) {
    for (var link in track.links) {
      if (link.contains("/series/")) {
        return true;
      }
    }

    return false;
  }
}
