import 'package:freezed_annotation/freezed_annotation.dart';

part 'production_country.g.dart';
part 'production_country.freezed.dart';

@freezed
abstract class ProductionCountry with _$ProductionCountry {
  const factory ProductionCountry({
    @Default(null) String? name,
    @Default(null) @JsonKey(name: "iso_3166_1") String? iso31661,
  }) = _ProductionCountry;

  factory ProductionCountry.fromJson(Map<String, dynamic> json) =>
      _$ProductionCountryFromJson(json);
}
