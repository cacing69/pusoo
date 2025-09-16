import 'package:pusoo/shared/data/models/clasification_rules/classification_rule.dart';
import 'package:pusoo/shared/data/models/track.dart';

class MaksinIsUrlNotContainsMovieAndSeriesWithSlashsRule
    implements ClassificationRule {
  @override
  bool isSatisfiedBy(Track track) {
    for (var link in track.links) {
      if (link.contains("/series/") || link.contains("/movie/")) {
        return true;
      }
    }

    return false;
  }
}
