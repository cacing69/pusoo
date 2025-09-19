import 'package:freezed_annotation/freezed_annotation.dart';

part 'track_filter_query.g.dart';
part 'track_filter_query.freezed.dart';

@freezed
abstract class TrackFilterQuery with _$TrackFilterQuery {
  const factory TrackFilterQuery({
    List<int>? playlistIds,
    String? groupTitle,
    String? title,
    String? titleOrGroupTitle,
    int? limit,
    int? offset,
    int? cursor,
    bool? isMovie,
    bool? isLiveTv,
    bool? isTvSerie,
  }) = _TrackFilterQuery;

  factory TrackFilterQuery.fromJson(Map<String, dynamic> json) =>
      _$TrackFilterQueryFromJson(json);
}
