import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_tv_tracks_params.g.dart';
part 'get_tv_tracks_params.freezed.dart';

@freezed
abstract class GetTvTracksParams with _$GetTvTracksParams {
  const factory GetTvTracksParams({
    List<int>? playlistIds,
    String? category,
    String? title,
    int? limit,
    int? offset,
    int? cursor,
  }) = _GetTvTracksParams;

  factory GetTvTracksParams.fromJson(Map<String, dynamic> json) =>
      _$GetTvTracksParamsFromJson(json);
}
