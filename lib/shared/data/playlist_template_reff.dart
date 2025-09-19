import 'package:pusoo/shared/data/models/clasification_rules/rules/is_url_contains_movie_with_slashs_rule.dart';
import 'package:pusoo/shared/data/models/clasification_rules/classificator.dart';
import 'package:pusoo/shared/data/models/clasification_rules/rules/is_url_contains_series_with_slashs_rule.dart';
import 'package:pusoo/shared/data/models/clasification_rules/rules/is_url_not_contains_movie_and_series_with_slashs_rule.dart';
import 'package:pusoo/shared/domain/entities/playlist_template.dart';

final playlistTemplate = PlaylistTemplate(
  name: "general",
  label: "General",
  knownHosts: ["http://ogietv.biz.id:80"],
  movieClassifier: Classificator([IsUrlContainsMoviesWithSlashsRule()]),
  liveTvClassifier: Classificator([
    IsUrlNotContainsMovieAndSeriesWithSlashsRule(),
  ]),
  tvSerieClassifier: Classificator([IsUrlContainsSeriesWithSlashsRule()]),
);

final Map<String, PlaylistTemplate> mapPlaylistTemplate = {
  "general": playlistTemplate,
};

final List<PlaylistTemplate> listPlaylistTemplate = [playlistTemplate];
