import 'package:pusoo/shared/data/models/clasification_rules/classification_rule.dart';
import 'package:pusoo/features/track/domain/models/track.dart';

class Classificator {
  final List<ClassificationRule> rules;
  Classificator(this.rules);

  // Checks if ALL rules are satisfied.
  bool isSatisfiedByAll(Track track) =>
      rules.every((rule) => rule.isSatisfiedBy(track));

  // Checks if ANY of the rules are satisfied.
  bool isSatisfiedByAny(Track track) =>
      rules.any((rule) => rule.isSatisfiedBy(track));
}
