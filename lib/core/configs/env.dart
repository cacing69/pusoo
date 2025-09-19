// lib/core/configs/env.dart
import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env', obfuscate: true)
abstract class Env {
  @EnviedField(varName: 'TMDB_API_KEY')
  static String tmdbApiKey = _Env.tmdbApiKey;
  
  @EnviedField(varName: 'TMDB_READ_ACCESS_TOKEN')
  static String tmdbReadAccessToken = _Env.tmdbReadAccessToken;

  @EnviedField(varName: 'OPEN_SUBTITLES_API_KEY')
  static String openSubtitlesApiKey = _Env.openSubtitlesApiKey;

  @EnviedField(varName: 'OPEN_SUBTITLES_SHA1_MD5')
  static String openSubtitlesSha1Md5 = _Env.openSubtitlesSha1Md5;

  @EnviedField(varName: 'OPEN_SUBTITLES_SHA1_HASH')
  static String openSubtitlesSha1Hash = _Env.openSubtitlesSha1Hash;

  @EnviedField(varName: 'OPEN_SUBTITLES_BASE_URL')
  static String openSubtitlesBaseUrl = _Env.openSubtitlesBaseUrl;
}
