import 'package:pusoo/features/track/domain/models/track_filter_query.dart';
import 'package:pusoo/features/track/domain/models/track.dart';

abstract class TrackDatasource {
  Future<List<Track>> get(TrackFilterQuery? params);
  Future<List<String>> getGroupTitle(TrackFilterQuery? params);
  Future<int> count(TrackFilterQuery? params);
}
