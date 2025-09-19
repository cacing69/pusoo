import 'package:pusoo/shared/data/datasources/remote/open_subtitles_client.dart';
import 'package:pusoo/shared/data/datasources/remote/tmdb_client.dart';
import 'package:pusoo/shared/presentation/providers/dio_open_subtitles.dart';
import 'package:pusoo/shared/presentation/providers/dio_tmdb.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'client_providers.g.dart';

@riverpod
TMDBClient tmdbClient(Ref ref) {
  return TMDBClient(ref.read(dioTmdbProvider));
}

@riverpod
OpenSubtitlesClient openSubtitlesClient(Ref ref) {
  return OpenSubtitlesClient(ref.read(dioOpenSubtitlesProvider));
}
