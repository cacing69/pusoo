import 'package:pusoo/features/track/domain/models/track.dart';

abstract class ClassificationRule {
  bool isSatisfiedBy(Track track);
}
