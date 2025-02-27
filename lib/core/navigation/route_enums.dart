// lib/core/constants/route_enums.dart
enum Routes {

  root("/"),

 // Auth routes
  login('/auth/login'),
  register('/auth/register'),
  otp('/auth/otp'),
  forgotPass('/auth/forgot_pass'),
  changePass('/auth/change_pass'),

 // User routes
  profile('/user/profile'),

  chat('/chat'),
  ;

  final String path;
  const Routes(this.path);
}