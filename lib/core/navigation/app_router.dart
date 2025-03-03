import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';

import '../../features/auth/presentation/screens/login_screen.dart';
import '../../features/auth/presentation/screens/signup_screen.dart';
import '../../features/chat/presentation/chat_screen.dart';
import '../../features/general/screens/splash_screen.dart';
import '../../features/home/presentation/screens/home_screen.dart';
import 'route_enums.dart';


class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: Routes.root.path,
    routerNeglect: true,
    debugLogDiagnostics: kDebugMode,
    routes: [
      GoRoute(
        name: Routes.root.name,
        path: Routes.root.path,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        name: Routes.login.name,
        path: Routes.login.path,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        name: Routes.register.name,
        path: Routes.register.path,
        builder: (context, state) => const SignUpScreen(),
      ),

      GoRoute(
        name: Routes.home.name,
        path: Routes.home.path,
        builder: (context, state) => const HomeScreen(),
      ),
      // GoRoute(
      //   name: Routes.otp.name,
      //   path: Routes.otp.path,
      //   builder: (context, state) => const OTPScreen(),
      // ),
      // GoRoute(
      //   name: Routes.forgotPass.name,
      //   path: Routes.forgotPass.path,
      //   builder: (context, state) => const ForgotPassScreen(),
      // ),
      // GoRoute(
      //   name: Routes.changePass.name,
      //   path: Routes.changePass.path,
      //   builder: (context, state) => const ChangePassScreen(),
      // ),
      // GoRoute(
      //   name: Routes.profile.name,
      //   path: Routes.profile.path,
      //   builder: (context, state) => const UserProfileScreen(),
      // ),
      GoRoute(
        name: Routes.chat.name,
        path: Routes.chat.path,
        builder: (context, state) => const ChatScreen(),
      ),
    ],
  );
}