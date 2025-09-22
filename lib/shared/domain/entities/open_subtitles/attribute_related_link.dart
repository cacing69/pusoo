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

part 'attribute_related_link.g.dart';
part 'attribute_related_link.freezed.dart';

@freezed
abstract class AttributeRelatedLink with _$AttributeRelatedLink {
  const factory AttributeRelatedLink({
    String? label,
    String? url,
    @JsonKey(name: "img_url") String? imgUrl,
  }) = _AttributeRelatedLink;

  factory AttributeRelatedLink.fromJson(Map<String, dynamic> json) =>
      _$AttributeRelatedLinkFromJson(json);
}
