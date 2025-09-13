import 'package:freezed_annotation/freezed_annotation.dart';

part 'production_company.g.dart';
part 'production_company.freezed.dart';

@freezed
abstract class ProductionCompany with _$ProductionCompany {
  const factory ProductionCompany({
    @Default(null) int? id,
    @Default(null) String? name,
    @Default(null) @JsonKey(name: "logo_path") String? logoPath,
    @Default(null) @JsonKey(name: "production_companies") String? originCountry,
  }) = _ProductionCompany;

  factory ProductionCompany.fromJson(Map<String, dynamic> json) =>
      _$ProductionCompanyFromJson(json);
}
