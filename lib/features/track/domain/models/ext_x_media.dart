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

part 'ext_x_media.g.dart';
part 'ext_x_media.freezed.dart';

@freezed
abstract class ExtXMedia with _$ExtXMedia {
  const factory ExtXMedia({
    @Default("") String type,
    @Default("") String groupId,
    @Default("") String language,
    @Default("") String name,
    @Default(false) bool isDefault,
    @Default(false) bool autoSelect,
    @Default("") String uri,
  }) = _ExtXMedia;

  factory ExtXMedia.fromJson(Map<String, dynamic> json) =>
      _$ExtXMediaFromJson(json);

  factory ExtXMedia.fromMap(Map<String, String> map) {
    return ExtXMedia(
      type: map["TYPE"] ?? "",
      groupId: map["GROUP-ID"] ?? "",
      language: map["LANGUAGE"] ?? "",
      name: map["NAME"] ?? "",
      isDefault: map["DEFAULT"] == "YES",
      autoSelect: map["AUTOSELECT"] == "YES",
      uri: map["URI"] ?? "",
    );
  }
}
