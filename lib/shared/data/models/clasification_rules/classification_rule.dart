import 'package:pusoo/shared/data/models/track.dart';

abstract class ClassificationRule {
  bool isSatisfiedBy(Track track);
}
