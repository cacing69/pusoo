import 'package:dartz/dartz.dart';
import 'package:pusoo/core/errors/failure.dart';
import 'package:pusoo/shared/domain/entities/open_subtitles/search_subtitle_query_params.dart';
import 'package:pusoo/shared/domain/entities/open_subtitles/subtitle.dart';
import 'package:pusoo/shared/domain/entities/open_subtitles/t_open_subtitle_search_response.dart';

abstract class SubtitleRepository {
  Future<Either<Failure, TOpenSubtitleSearchResponse<List<Subtitle>>>> search(
    SearchSubtitleQueryParams params,
  );
}
