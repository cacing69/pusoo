import 'package:pusoo/features/track/domain/models/get_track_group_titles_params.dart';
import 'package:pusoo/features/track/domain/models/get_tracks_params.dart';
import 'package:pusoo/shared/data/models/track.dart';

abstract class TrackDriftDatasource {
  Future<List<Track>> get(GetTracksParams? params);
  Future<List<String>> getGroupTitle(GetTrackGroupTitlesParams? params);
  Future<int> count({List<int>? playlistIds});
}
