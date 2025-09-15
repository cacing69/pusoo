import 'package:dartz/dartz.dart';
import 'package:pusoo/core/errors/failure.dart';
import 'package:pusoo/features/tv/domain/models/get_tv_tracks_params.dart';
import 'package:pusoo/shared/data/models/track.dart';

abstract class TvLocalRepository {
  Future<Either<Failure, List<Track>>> getTvTracks(GetTvTracksParams? params);
}
