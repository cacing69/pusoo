import 'package:pusoo/shared/data/models/clasification_rules/classification_rule.dart';
import 'package:pusoo/shared/data/models/track.dart';

class MaksinIsUrlNotContainsMovieAndSeriesWithSlashsRule
    implements ClassificationRule {
  @override
  bool isSatisfiedBy(Track track) {
    // Memeriksa apakah ada SATU SAJA link yang tidak mengandung "/series/" DAN "/movie/".
    return track.links.any(
      (link) => !link.contains("/series/") && !link.contains("/movie/"),
    );
  }
}
