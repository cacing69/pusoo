import 'package:pusoo/shared/data/datasources/remote/open_subtitles_client.dart';
import 'package:pusoo/shared/data/datasources/remote/tmdb_client.dart';
import 'package:pusoo/shared/presentation/providers/open_subtitles_http_client.dart';
import 'package:pusoo/shared/presentation/providers/tmdb_http_client.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

@riverpod
TMDBClient tmdbClient(Ref ref) {
  return TMDBClient(ref.read(tmdbHttpClientProvider));
}

@riverpod
OpenSubtitlesClient openSubtitleClient(Ref ref) {
  return OpenSubtitlesClient(ref.read(openSubtitlesHttpClientProvider));
}
