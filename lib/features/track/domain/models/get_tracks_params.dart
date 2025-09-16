import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_tracks_params.g.dart';
part 'get_tracks_params.freezed.dart';

@freezed
abstract class GetTracksParams with _$GetTracksParams {
  const factory GetTracksParams({
    List<int>? playlistIds,
    String? groupTitle,
    String? title,
    int? limit,
    int? offset,
    int? cursor,
    bool? isMovie,
    bool? isLiveTv,
    bool? isTvSerie,
  }) = _GetTracksParams;

  factory GetTracksParams.fromJson(Map<String, dynamic> json) =>
      _$GetTracksParamsFromJson(json);
}
