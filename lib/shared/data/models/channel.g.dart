// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'channel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Channel _$ChannelFromJson(Map<String, dynamic> json) => _Channel(
  id: json['id'] as String? ?? null,
  playlistId: json['playlistId'] as String? ?? null,
  name: json['name'] as String? ?? null,
  tvgId: json['tvgId'] as String? ?? null,
  tmdbId: json['tmdbId'] as String? ?? null,
  tvgName: json['tvgName'] as String? ?? null,
  logo: json['logo'] as String? ?? null,
  groupTitle: json['groupTitle'] as String? ?? null,
  isFavorite: json['isFavorite'] as bool? ?? null,
  isLiveTv: json['isLiveTv'] as bool? ?? null,
  isMovie: json['isMovie'] as bool? ?? null,
  isTvSerie: json['isTvSerie'] as bool? ?? null,
  isWatched: json['isWatched'] as bool? ?? null,
  kodiprop:
      (json['kodiprop'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String),
      ) ??
      null,
  extvlcopt:
      (json['extvlcopt'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String),
      ) ??
      null,
);

Map<String, dynamic> _$ChannelToJson(_Channel instance) => <String, dynamic>{
  'id': instance.id,
  'playlistId': instance.playlistId,
  'name': instance.name,
  'tvgId': instance.tvgId,
  'tmdbId': instance.tmdbId,
  'tvgName': instance.tvgName,
  'logo': instance.logo,
  'groupTitle': instance.groupTitle,
  'isFavorite': instance.isFavorite,
  'isLiveTv': instance.isLiveTv,
  'isMovie': instance.isMovie,
  'isTvSerie': instance.isTvSerie,
  'isWatched': instance.isWatched,
  'kodiprop': instance.kodiprop,
  'extvlcopt': instance.extvlcopt,
};
