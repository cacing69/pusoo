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
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pusoo/shared/data/models/clasification_rules/classificator.dart';

part 'playlist_template.g.dart';
part 'playlist_template.freezed.dart';

@freezed
abstract class PlaylistTemplate with _$PlaylistTemplate {
  const factory PlaylistTemplate({
    String? name,
    String? label,
    List<String>? knownHosts,

    // @JsonKey(includeToJson: false, includeFromJson: false)
    // List<Function>? movieRules,

    // @JsonKey(includeToJson: false, includeFromJson: false)
    // List<Function>? seriesRules,

    // @JsonKey(includeToJson: false, includeFromJson: false)
    // List<Function>? liveTvRules,
    @JsonKey(includeToJson: false, includeFromJson: false)
    Classificator? movieClassifier,

    @JsonKey(includeToJson: false, includeFromJson: false)
    Classificator? liveTvClassifier,

    @JsonKey(includeToJson: false, includeFromJson: false)
    Classificator? tvSerieClassifier,
  }) = _PlaylistTemplate;

  factory PlaylistTemplate.fromJson(Map<String, dynamic> json) =>
      _$PlaylistTemplateFromJson(json);

  // Tambahkan getter untuk classifier
  // MovieClassifier get movieClassifier => MovieClassifier([
  //   // IsMovieTypeRule(),
  //   // HasGroupTitleRule(),
  //   // Anda bisa menambahkan aturan lain di sini
  // ]);

  // factory PlaylistTemplate.isMovie(Track trackDrift) {
  //   PlaylistTemplate();
  // }
}
