import 'dart:convert';

import '../../domain/entities/signup_entity.dart';

Signup signupFromJson(String str) => Signup.fromJson(json.decode(str));

String signupToJson(Signup data) => json.encode(data.toJson());

class Signup extends SignupEntity {
  const Signup({
    required String? token
  }) : super(
    id: token ?? "",
  );

  factory Signup.fromJson(Map<String, dynamic> json) => Signup(
    token: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
  };
}