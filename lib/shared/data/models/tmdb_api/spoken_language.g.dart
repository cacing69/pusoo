// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'spoken_language.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SpokenLanguage _$SpokenLanguageFromJson(Map<String, dynamic> json) =>
    _SpokenLanguage(
      iso6391: json['iso_639_1'] as String? ?? null,
      name: json['name'] as String? ?? null,
      englishName: json['english_name'] as String? ?? null,
    );

Map<String, dynamic> _$SpokenLanguageToJson(_SpokenLanguage instance) =>
    <String, dynamic>{
      'iso_639_1': instance.iso6391,
      'name': instance.name,
      'english_name': instance.englishName,
    };
