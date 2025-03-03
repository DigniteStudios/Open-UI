class LoginParams {
  final String email;
  final String password;

  const LoginParams({
    required this.email,
    required this.password
  });

  Map<String, String> toJson() {
    return {
      'username': email,
      'password': password
    };
  }
}

class SignupParams {
  final String email;
  final String password;
  final String firstName;
  final String lastName;
  final String phone;

  const SignupParams({
    required this.email,
    required this.password,
    required this.firstName,
    required this.lastName,
    required this.phone,
  });

  Map<String, dynamic> toJson() {
    return{
      "email": email,
      "username": "${firstName}${lastName.split("").first}",
      "password": password,
      "name":{
        "firstname": firstName,
        "lastname": lastName
      },
      "phone": phone
    };
  }
}