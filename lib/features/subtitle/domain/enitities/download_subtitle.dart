import 'package:freezed_annotation/freezed_annotation.dart';

part 'download_subtitle.freezed.dart';
part 'download_subtitle.g.dart';

@freezed
abstract class DownloadSubtitle with _$DownloadSubtitle {
    const factory DownloadSubtitle({
        String? link,
        @JsonKey(name: "file_name")
        String? fileName,
        int? requests,
        int? remaining,
        String? message,
        @JsonKey(name: "reset_time")
        String? resetTime,
        @JsonKey(name: "reset_time_utc")
        DateTime? resetTimeUtc,
    }) = _DownloadSubtitle;

    factory DownloadSubtitle.fromJson(Map<String, dynamic> json) => _$DownloadSubtitleFromJson(json);
}
