import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_track_group_titles_params.g.dart';
part 'get_track_group_titles_params.freezed.dart';

@freezed
abstract class GetTrackGroupTitlesParams with _$GetTrackGroupTitlesParams {
  const factory GetTrackGroupTitlesParams({
    List<int>? playlistIds,
    bool? isMovie,
    bool? isLiveTv,
    bool? isTvSerie,
  }) = _GetTrackGroupTitlesParams;

  factory GetTrackGroupTitlesParams.fromJson(Map<String, dynamic> json) =>
      _$GetTrackGroupTitlesParamsFromJson(json);
}
