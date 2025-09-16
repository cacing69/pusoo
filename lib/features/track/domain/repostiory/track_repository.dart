import 'package:dartz/dartz.dart';
import 'package:pusoo/core/errors/failure.dart';
import 'package:pusoo/features/track/domain/models/get_track_group_titles_params.dart';
import 'package:pusoo/features/track/domain/models/get_tracks_params.dart';
import 'package:pusoo/shared/data/models/track.dart';

abstract class TrackRepository {
  Future<Either<Failure, List<Track>>> get(GetTracksParams? params);
  Future<Either<Failure, List<String>>> getGroupTitle(
    GetTrackGroupTitlesParams? params,
  );
}
