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

part of 'auth_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AuthUser _$AuthUserFromJson(Map<String, dynamic> json) => _AuthUser(
  allowedDownloads: (json['allowed_downloads'] as num?)?.toInt(),
  allowedTranslations: (json['allowed_translations'] as num?)?.toInt(),
  level: json['level'] as String?,
  userId: (json['user_id'] as num?)?.toInt(),
  extInstalled: json['ext_installed'] as bool?,
  vip: json['vip'] as bool?,
);

Map<String, dynamic> _$AuthUserToJson(_AuthUser instance) => <String, dynamic>{
  'allowed_downloads': instance.allowedDownloads,
  'allowed_translations': instance.allowedTranslations,
  'level': instance.level,
  'user_id': instance.userId,
  'ext_installed': instance.extInstalled,
  'vip': instance.vip,
};
