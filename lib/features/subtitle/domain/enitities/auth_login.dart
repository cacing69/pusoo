import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:pusoo/features/subtitle/domain/enitities/auth_user.dart';

part 'auth_login.freezed.dart';
part 'auth_login.g.dart';

@freezed
abstract class AuthLogin with _$AuthLogin {
    const factory AuthLogin({
        AuthUser? user,
        @JsonKey(name: "base_url")
        String? baseUrl,
        String? token,
        int? status,
    }) = _AuthLogin;

    factory AuthLogin.fromJson(Map<String, dynamic> json) => _$AuthLoginFromJson(json);
}

