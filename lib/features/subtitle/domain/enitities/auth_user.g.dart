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
