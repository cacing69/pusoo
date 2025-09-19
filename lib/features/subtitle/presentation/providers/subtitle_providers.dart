import 'package:pusoo/features/subtitle/domain/usecases/search_subtitle_usecase.dart';
import 'package:pusoo/features/subtitle/data/repository_impl/subtitle_open_subtitle_repository_impl.dart';
import 'package:pusoo/shared/domain/repositories/open_subtitles/subtitle_repository.dart';
import 'package:pusoo/shared/presentation/providers/client_providers.dart';
import 'package:pusoo/shared/presentation/providers/logger_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'subtitle_providers.g.dart';

@riverpod
SubtitleRepository subtitleOpenSubtitlesRepository(Ref ref) {
  return SubtitleOpenSubtitleRepositoryImpl(
    ref.read(openSubtitlesClientProvider),
    ref.read(loggerProvider),
  );
}

@riverpod
SearchSubtitleUsecase searchSubtitleUsecase(Ref ref) {
  return SearchSubtitleUsecase(
    ref.read(subtitleOpenSubtitlesRepositoryProvider),
    ref.read(loggerProvider),
  );
}
