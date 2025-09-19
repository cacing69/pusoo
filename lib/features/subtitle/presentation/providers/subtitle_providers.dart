import 'package:pusoo/features/subtitle/domain/usecases/search_subtitle_usecase.dart';
import 'package:pusoo/shared/data/repositories_impl/subtitle_open_subtitle_repository_impl.dart';
import 'package:pusoo/shared/domain/repositories/open_subtitles/subtitle_repository.dart';
import 'package:pusoo/shared/presentation/providers/client_providers.dart';
import 'package:pusoo/shared/presentation/providers/logger_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'subtitle_providers.g.dart';

@riverpod
SubtitleRepository subtitleRepository(Ref ref) {
  return SubtitleOpenSubtitleRepositoryImpl(
    ref.read(openSubtitlesClientProvider),
  );
}

@riverpod
SearchSubtitleUsecase searcSubtitleUsecase(Ref ref) {
  return SearchSubtitleUsecase(
    ref.read(subtitleRepositoryProvider),
    ref.read(loggerProvider),
  );
}
