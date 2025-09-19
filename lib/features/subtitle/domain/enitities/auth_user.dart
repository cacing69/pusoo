import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_user.freezed.dart';
part 'auth_user.g.dart';

@freezed
abstract class AuthUser with _$AuthUser {
    const factory AuthUser({
        @JsonKey(name: "allowed_downloads")
        int? allowedDownloads,
        @JsonKey(name: "allowed_translations")
        int? allowedTranslations,
        String? level,
        @JsonKey(name: "user_id")
        int? userId,
        @JsonKey(name: "ext_installed")
        bool? extInstalled,
        bool? vip,
    }) = _AuthUser;

    factory AuthUser.fromJson(Map<String, dynamic> json) => _$AuthUserFromJson(json);
}
