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

part 'attribute_uploader.g.dart';
part 'attribute_uploader.freezed.dart';

@freezed
abstract class AttributeUploader with _$AttributeUploader {
  const factory AttributeUploader({
    @JsonKey(name: "uploader_id") int? uploaderId,
    String? name,
    String? rank,
  }) = _AttributeUploader;

  factory AttributeUploader.fromJson(Map<String, dynamic> json) =>
      _$AttributeUploaderFromJson(json);
}
