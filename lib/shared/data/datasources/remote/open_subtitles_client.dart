import 'package:dio/dio.dart';
import 'package:pusoo/shared/domain/entities/open_subtitles/search_subtitle_query_params.dart';
import 'package:pusoo/shared/domain/entities/open_subtitles/subtitle.dart';
import 'package:pusoo/shared/domain/entities/open_subtitles/t_open_subtitle_search_response.dart';
import 'package:retrofit/retrofit.dart';

part 'open_subtitles_client.g.dart';

@RestApi()
abstract class OpenSubtitlesClient {
  factory OpenSubtitlesClient(Dio dio, {String baseUrl}) = _OpenSubtitlesClient;

  @GET("/api/v1/subtitles")
  Future<TOpenSubtitleSearchResponse<List<Subtitle>>> searchSubtitle(
    @Queries() SearchSubtitleQueryParams queryParams,
  );
}
