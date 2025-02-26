// To parse this JSON data, do
//
//     final login = loginFromJson(jsonString);

import 'dart:convert';

import '../../domain/entities/login_entity.dart';

Login loginFromJson(String str) => Login.fromJson(json.decode(str));

String loginToJson(Login data) => json.encode(data.toJson());

class Login extends LoginEntity {
  const Login({
    required String? token
  }) : super(
    token: token ?? "",
  );

  factory Login.fromJson(Map<String, dynamic> json) => Login(
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "token": token,
  };
}
