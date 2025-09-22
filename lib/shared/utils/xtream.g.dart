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

part of 'xtream.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Xtream _$XtreamFromJson(Map<String, dynamic> json) => _Xtream(
  host: json['host'] as String? ?? "",
  username: json['username'] as String? ?? "",
  password: json['password'] as String? ?? "",
  port: (json['port'] as num?)?.toInt() ?? 0,
  type: json['type'] as String? ?? "",
  output: json['output'] as String? ?? "",
  isValid: json['isValid'] as bool? ?? false,
);

Map<String, dynamic> _$XtreamToJson(_Xtream instance) => <String, dynamic>{
  'host': instance.host,
  'username': instance.username,
  'password': instance.password,
  'port': instance.port,
  'type': instance.type,
  'output': instance.output,
  'isValid': instance.isValid,
};
