import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'core/navigation/app_router.dart';
import 'core/services/service_locator.dart';
import 'shared/themes/dark_theme.dart';
import 'shared/themes/light_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(
  //   // options: DefaultFirebaseOptions.currentPlatform,
  // );
  setupLocator();
  final appRouter = AppRouter();
  runApp(ProviderScope(child: MyApp(router: appRouter.router)));
}


class MyApp extends StatelessWidget {
  final GoRouter router;
  const MyApp({super.key, required this.router});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Open UI',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: lightTheme,
      darkTheme: darkTheme,
      routerConfig: router,
    );
  }
}
