import 'package:freezed_annotation/freezed_annotation.dart';

part 'download_request_body.freezed.dart';
part 'download_request_body.g.dart';

@freezed
abstract class DownloadRequestBody with _$DownloadRequestBody {
    const factory DownloadRequestBody({
        @JsonKey(name: "file_id") required String fileId,
    }) = _DownloadRequestBody;

    factory DownloadRequestBody.fromJson(Map<String, dynamic> json) => _$DownloadRequestBodyFromJson(json);
}

