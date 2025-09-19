import 'package:freezed_annotation/freezed_annotation.dart';

part 'attribute_uploader.g.dart';
part 'attribute_uploader.freezed.dart';

@freezed
abstract class AttributeUploader with _$AttributeUploader {
  const factory AttributeUploader({
    @JsonKey(name: "uploader_id") int? uploaderId,
    String? name,
    String? rank,
  }) = _AttributeUploader;

  factory AttributeUploader.fromJson(Map<String, dynamic> json) =>
      _$AttributeUploaderFromJson(json);
}
