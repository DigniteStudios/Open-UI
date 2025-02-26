import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/navigation/route_names.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Durations.extralong1, () => context.goNamed(Routes.login),);
  }


  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(
          strokeCap: StrokeCap.round,
          strokeWidth: 8,
        ),
      ),
    );
  }
}
