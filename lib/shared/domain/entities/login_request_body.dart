import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_request_body.g.dart';
part 'login_request_body.freezed.dart';

@freezed
abstract class LoginRequestBody with _$LoginRequestBody {
  const factory LoginRequestBody({String? username, String? password}) =
      _LoginRequestBody;

  factory LoginRequestBody.fromJson(Map<String, dynamic> json) =>
      _$LoginRequestBodyFromJson(json);
}
