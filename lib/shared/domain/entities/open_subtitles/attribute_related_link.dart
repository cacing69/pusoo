import 'package:freezed_annotation/freezed_annotation.dart';

part 'attribute_related_link.g.dart';
part 'attribute_related_link.freezed.dart';

@freezed
abstract class AttributeRelatedLink with _$AttributeRelatedLink {
  const factory AttributeRelatedLink({
    String? label,
    String? url,
    @JsonKey(name: "img_url") String? imgUrl,
  }) = _AttributeRelatedLink;

  factory AttributeRelatedLink.fromJson(Map<String, dynamic> json) =>
      _$AttributeRelatedLinkFromJson(json);
}
