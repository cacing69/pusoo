import 'package:pusoo/shared/data/models/clasification_rules/classification_rule.dart';
import 'package:pusoo/shared/data/models/track.dart';

class MovieClassifier {
  final List<ClassificationRule> rules;
  MovieClassifier(this.rules);
  bool isMovie(Track track) => rules.every((rule) => rule.isSatisfiedBy(track));
}
