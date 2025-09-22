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

part 'movie_video.g.dart';
part 'movie_video.freezed.dart';

@freezed
abstract class MovieVideo with _$MovieVideo {
  const factory MovieVideo({
    @JsonKey(name: "iso_639_1") String? iso6391,
    @JsonKey(name: "iso_3166_1") String? iso31661,
    @Default(null) String? name,
    @Default(null) String? key,
    @Default(null) String? site,
    @Default(null) int? size,
    @Default(null) String? type,
    @Default(false) bool? oficial,
    @JsonKey(name: "published_at") String? publishedAt,
  }) = _MovieVideo;

  factory MovieVideo.fromJson(Map<String, dynamic> json) =>
      _$MovieVideoFromJson(json);
}
