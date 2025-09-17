import 'package:freezed_annotation/freezed_annotation.dart';

part 'track_drift_filter_query.g.dart';
part 'track_drift_filter_query.freezed.dart';

@freezed
abstract class TrackDriftFilterQuery with _$TrackDriftFilterQuery {
  const factory TrackDriftFilterQuery({
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
  }) = _TrackDriftFilterQuery;

  factory TrackDriftFilterQuery.fromJson(Map<String, dynamic> json) =>
      _$TrackDriftFilterQueryFromJson(json);
}
