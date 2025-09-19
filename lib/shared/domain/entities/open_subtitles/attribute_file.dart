import 'package:freezed_annotation/freezed_annotation.dart';

part 'attribute_file.g.dart';
part 'attribute_file.freezed.dart';

@freezed
abstract class AttributeFile with _$AttributeFile {
  const factory AttributeFile({
    @JsonKey(name: "file_id") int? fileId,
    @JsonKey(name: "cd_number") int? cdNumber,
    @JsonKey(name: "file_name") String? fileName,
  }) = _AttributeFile;

  factory AttributeFile.fromJson(Map<String, dynamic> json) =>
      _$AttributeFileFromJson(json);
}
