import 'package:dartz/dartz.dart';
import 'package:pusoo/core/errors/failure.dart';
import 'package:pusoo/shared/data/datasources/remote/open_subtitles_client.dart';
import 'package:pusoo/shared/domain/entities/open_subtitles/search_subtitle_query_params.dart';
import 'package:pusoo/shared/domain/entities/open_subtitles/subtitle.dart';
import 'package:pusoo/shared/domain/entities/open_subtitles/t_open_subtitle_search_response.dart';
import 'package:pusoo/shared/domain/repositories/open_subtitles/subtitle_repository.dart';

class SubtitleOpenSubtitleRepositoryImpl implements SubtitleRepository {
  final OpenSubtitlesClient client;

  SubtitleOpenSubtitleRepositoryImpl(this.client);

  @override
  Future<Either<Failure, TOpenSubtitleSearchResponse<List<Subtitle>>>> search(
    SearchSubtitleQueryParams params,
  ) async {
    try {
      final response = await client.searchSubtitle(params);
      return Right(response);
    } on Exception catch (e) {
      return Left(ClientRepositoryFailure(message: e.toString()));
    } catch (e) {
      return Left(
        ServerFailure(message: 'An unexpected error occurred: ${e.toString()}'),
      );
    }
  }
}
