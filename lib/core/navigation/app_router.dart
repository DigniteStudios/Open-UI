import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:open_ui/view/screens/forgot_pass_screen.dart';

import '../../view/screens/change_pass_screen.dart';
import '../../features/chat_feature/presentation/chat_screen.dart';
import '../../features/auth_feature/presentation/screens/login_screen.dart';
import '../../view/screens/otp_screen.dart';
import '../../features/auth_feature/presentation/screens/signup_screen.dart';
import '../../view/screens/splash_screen.dart';
import '../../view/screens/user_profile_screen.dart';
import 'route_names.dart';

final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

class AppRouter {
  final GoRouter router = GoRouter(
    navigatorKey: _navigatorKey,
    initialLocation: Routes.home,
    routes: [
      GoRoute(
        path: Routes.home,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        name: Routes.login,
        path: "/${Routes.login}",
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        name: Routes.register,
        path: "/${Routes.register}",
        builder: (context, state) => const SignUpScreen(),
      ),
      GoRoute(
        name: Routes.otp,
        path: "/${Routes.otp}",
        builder: (context, state) => const OTPScreen(),
      ),
      GoRoute(
        name: Routes.forgotPass,
        path: "/${Routes.forgotPass}",
        builder: (context, state) => const ForgotPassScreen(),
      ),
      GoRoute(
        name: Routes.changePass,
        path: "/${Routes.changePass}",
        builder: (context, state) => const ChangePassScreen(),
      ),
      GoRoute(
        name: Routes.profile,
        path: "/${Routes.profile}",
        builder: (context, state) => const UserProfileScreen(),
      ),
      GoRoute(
        name: Routes.chat,
        path: "/${Routes.chat}",
        builder: (context, state) => const ChatScreen(),
      ),
    ],
  );
}