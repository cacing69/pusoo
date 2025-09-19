import 'package:dartz/dartz.dart';
import 'package:logger/logger.dart';
import 'package:pusoo/core/errors/failure.dart';
import 'package:pusoo/core/utils/usecase.dart';
import 'package:pusoo/shared/domain/entities/open_subtitles/search_subtitle_query_params.dart';
import 'package:pusoo/shared/domain/entities/open_subtitles/subtitle.dart';
import 'package:pusoo/shared/domain/entities/open_subtitles/t_open_subtitle_search_response.dart';
import 'package:pusoo/shared/domain/repositories/open_subtitles/subtitle_repository.dart';

class SearchSubtitleUsecase
    implements
        UseCase<
          TOpenSubtitleSearchResponse<List<Subtitle>>,
          SearchSubtitleQueryParams
        > {
  final SubtitleRepository repository;
  final Logger logger;

  SearchSubtitleUsecase(this.repository, this.logger);

  @override
  Future<Either<Failure, TOpenSubtitleSearchResponse<List<Subtitle>>>> call(
    SearchSubtitleQueryParams params,
  ) async {
    try {
      return await repository.search(params);
    } catch (e) {
      return Left(UsecaseFailure(message: e.toString()));
    }
  }
}
