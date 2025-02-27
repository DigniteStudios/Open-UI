import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
  runApp(const ProviderScope(child: MyApp()));
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Open UI',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: lightTheme,
      darkTheme: darkTheme,
      routerConfig: AppRouter.router,
    );
  }
}
