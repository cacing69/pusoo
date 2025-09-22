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
import 'package:pusoo/features/track/domain/models/track.dart';

part 'source.g.dart';
part 'source.freezed.dart';

@freezed
abstract class Source with _$Source {
  const factory Source({
    int? id,
    String? name,
    @Default("m3u") String type,
    String? contentType,
    String? filePath,
    String? template,
    String? epgLink,
    String? url,
    @Default(false) bool? isActive,
    @Default(false) bool? isPersonal,
    @Default(false) bool? isPublic,

    @Default(false) bool isEmpty,

    String? homepage,
    String? owner,
    String? description,
    String? repository,

    List<Track>? tracks,

    //>? isEmpty,

    // Atribut untuk Xtream Codes
    String? username,
    String? password,
    String? serverUrl,
  }) = _Source;

  factory Source.fromJson(Map<String, dynamic> json) => _$SourceFromJson(json);
}
