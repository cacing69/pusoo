import 'package:pusoo/features/track/domain/models/track_drift_filter_query.dart';
import 'package:pusoo/features/track/domain/models/track.dart';

abstract class TrackDatasource {
  Future<List<Track>> get(TrackDriftFilterQuery? params);
  Future<List<String>> getGroupTitle(TrackDriftFilterQuery? params);
  Future<int> count(TrackDriftFilterQuery? params);
}
