import 'package:pusoo/shared/data/models/clasification_rules/maksin/maksin_is_url_contains_movie_with_slashs_rule.dart';
import 'package:pusoo/shared/data/models/clasification_rules/classificator.dart';
import 'package:pusoo/shared/data/models/clasification_rules/maksin/maksin_is_url_contains_series_with_slashs_rule.dart';
import 'package:pusoo/shared/data/models/clasification_rules/maksin/maksin_is_url_not_contains_movie_and_series_with_slashs_rule.dart';
import 'package:pusoo/shared/data/models/playlist_template.dart';

final unknown = PlaylistTemplate(
  name: "uknown",
  label: "Unknown",
  knownHosts: [],
  movieClassifier: null,
  liveTvClassifier: null,
  tvSerieClassifier: null,
);

final maksinTemplate = PlaylistTemplate(
  name: "maksin",
  label: "Maksin",
  knownHosts: ["http://ogietv.biz.id:80"],
  movieClassifier: Classificator([MaksinIsUrlContainsMoviesWithSlashsRule()]),
  liveTvClassifier: Classificator([
    MaksinIsUrlNotContainsMovieAndSeriesWithSlashsRule(),
  ]),
  tvSerieClassifier: Classificator([MaksinIsUrlContainsSeriesWithSlashsRule()]),
);

final Map<String, PlaylistTemplate> mapPlaylistTemplate = {
  "maksin": maksinTemplate,
};

final List<PlaylistTemplate> listPlaylistTemplate = [unknown, maksinTemplate];
