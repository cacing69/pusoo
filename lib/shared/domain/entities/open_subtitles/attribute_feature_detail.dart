import 'package:freezed_annotation/freezed_annotation.dart';

part 'attribute_feature_detail.g.dart';
part 'attribute_feature_detail.freezed.dart';

@freezed
abstract class AttributeFeatureDetail with _$AttributeFeatureDetail {
  const factory AttributeFeatureDetail({
    @JsonKey(name: "feature_id") int? featureId,
    @JsonKey(name: "feature_type") String? featureType,
    int? year,
    String? title,
    @JsonKey(name: "movie_name") String? movieName,
    @JsonKey(name: "imdb_id") int? imdbId,
    @JsonKey(name: "tmdb_id") int? tmdbId,
    @JsonKey(name: "season_number") int? seasonNumber,
    @JsonKey(name: "episode_number") int? episodeNumber,
    @JsonKey(name: "parent_imdb_id") int? parentImdbId,
    @JsonKey(name: "parent_title") String? parentTitle,
    @JsonKey(name: "parent_tmdb_id") int? parentTmdbId,
    @JsonKey(name: "parent_feature_id") int? parentFeatureId,
  }) = _AttributeFeatureDetail;

  factory AttributeFeatureDetail.fromJson(Map<String, dynamic> json) =>
      _$AttributeFeatureDetailFromJson(json);
}
