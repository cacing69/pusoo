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


// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'playlist_template.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PlaylistTemplate _$PlaylistTemplateFromJson(Map<String, dynamic> json) =>
    _PlaylistTemplate(
      name: json['name'] as String?,
      label: json['label'] as String?,
      knownHosts: (json['knownHosts'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$PlaylistTemplateToJson(_PlaylistTemplate instance) =>
    <String, dynamic>{
      'name': instance.name,
      'label': instance.label,
      'knownHosts': instance.knownHosts,
    };
