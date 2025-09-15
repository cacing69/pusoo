import 'package:pusoo/features/tv/domain/models/get_tv_tracks_params.dart';
import 'package:pusoo/shared/data/models/track.dart';

abstract class TvLocalDatasource {
  Future<List<Track>> getTvTracks(GetTvTracksParams? params);
  Future<List<String>> getTvCategories({
    List<int>? playlistIds,
    String? category,
  });
  Future<int> countAll({List<int>? playlistIds});
}
