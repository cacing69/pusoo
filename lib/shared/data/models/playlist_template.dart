import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pusoo/shared/data/models/clasification_rules/classificator.dart';

part 'playlist_template.g.dart';
part 'playlist_template.freezed.dart';

@freezed
abstract class PlaylistTemplate with _$PlaylistTemplate {
  const factory PlaylistTemplate({
    String? name,
    String? label,
    List<String>? knownHosts,

    // @JsonKey(includeToJson: false, includeFromJson: false)
    // List<Function>? movieRules,

    // @JsonKey(includeToJson: false, includeFromJson: false)
    // List<Function>? seriesRules,

    // @JsonKey(includeToJson: false, includeFromJson: false)
    // List<Function>? liveTvRules,
    @JsonKey(includeToJson: false, includeFromJson: false)
    Classificator? movieClassifier,

    @JsonKey(includeToJson: false, includeFromJson: false)
    Classificator? liveTvClassifier,

    @JsonKey(includeToJson: false, includeFromJson: false)
    Classificator? tvSerieClassifier,
  }) = _PlaylistTemplate;

  factory PlaylistTemplate.fromJson(Map<String, dynamic> json) =>
      _$PlaylistTemplateFromJson(json);

  // Tambahkan getter untuk classifier
  // MovieClassifier get movieClassifier => MovieClassifier([
  //   // IsMovieTypeRule(),
  //   // HasGroupTitleRule(),
  //   // Anda bisa menambahkan aturan lain di sini
  // ]);

  // factory PlaylistTemplate.isMovie(Track trackDrift) {
  //   PlaylistTemplate();
  // }
}
