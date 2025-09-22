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

part of 'source.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Source _$SourceFromJson(Map<String, dynamic> json) => _Source(
  id: (json['id'] as num?)?.toInt(),
  name: json['name'] as String?,
  type: json['type'] as String? ?? "m3u",
  contentType: json['contentType'] as String?,
  filePath: json['filePath'] as String?,
  template: json['template'] as String?,
  epgLink: json['epgLink'] as String?,
  url: json['url'] as String?,
  isActive: json['isActive'] as bool? ?? false,
  isPersonal: json['isPersonal'] as bool? ?? false,
  isPublic: json['isPublic'] as bool? ?? false,
  isEmpty: json['isEmpty'] as bool? ?? false,
  homepage: json['homepage'] as String?,
  owner: json['owner'] as String?,
  description: json['description'] as String?,
  repository: json['repository'] as String?,
  tracks: (json['tracks'] as List<dynamic>?)
      ?.map((e) => Track.fromJson(e as Map<String, dynamic>))
      .toList(),
  username: json['username'] as String?,
  password: json['password'] as String?,
  serverUrl: json['serverUrl'] as String?,
);

Map<String, dynamic> _$SourceToJson(_Source instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'type': instance.type,
  'contentType': instance.contentType,
  'filePath': instance.filePath,
  'template': instance.template,
  'epgLink': instance.epgLink,
  'url': instance.url,
  'isActive': instance.isActive,
  'isPersonal': instance.isPersonal,
  'isPublic': instance.isPublic,
  'isEmpty': instance.isEmpty,
  'homepage': instance.homepage,
  'owner': instance.owner,
  'description': instance.description,
  'repository': instance.repository,
  'tracks': instance.tracks,
  'username': instance.username,
  'password': instance.password,
  'serverUrl': instance.serverUrl,
};
