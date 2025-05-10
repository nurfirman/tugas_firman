import 'user_model.dart';

class AuthResponseModel {
  final User? user;
  final String? token;
  final String? tokenType;
  final int? expiresIn;

  AuthResponseModel({this.user, this.token, this.tokenType, this.expiresIn});

  factory AuthResponseModel.fromJson(Map<String, dynamic> json) =>
      AuthResponseModel(
        user: json["user"] == null ? null : User.fromJson(json["user"]),
        token: json["access_token"],
        tokenType: json["token_type"],
        expiresIn: json["expires_in"],
      );

  bool get success => token != null;

  get message => user?.name ?? "Login failed";

  Map<String, dynamic> toJson() => {
    "user": user?.toJson(),
    "access_token": token,
    "token_type": tokenType,
    "expires_in": expiresIn,
  };
}

