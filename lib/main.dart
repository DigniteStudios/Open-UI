import 'package:flutter/material.dart';

import 'controllers/notification_controller.dart';
import 'themes/dark_theme.dart';
import 'themes/light_theme.dart';
import 'ui/change_pass_screen.dart';
import 'ui/chat_screen.dart';
import 'ui/forgot_pass_screen.dart';
import 'ui/image_uploader_screen.dart';
import 'ui/login_screen.dart';
import 'ui/otp_screen.dart';
import 'ui/signup_screen.dart';
import 'ui/user_profile_screen.dart';
import 'utils/network.dart';
import 'utils/storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Prefs.init();

  // await Firebase.initializeApp(
  //   // options: DefaultFirebaseOptions.currentPlatform,
  // );
  Network.instance.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Open UI',
      themeMode: ThemeMode.system,
      theme: lightTheme,
      darkTheme: darkTheme,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // NotificationController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Open UI"),
      ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ListTile(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                  builder: (context) => const LoginScreen(),
              ));
            },
            title: const Text(
              'Log In',
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                  builder: (context) => const SignUpScreen(),
              ));
            },
            title: const Text(
              'Sign Up',
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                  builder: (context) => const OTPScreen(),
              ));
            },
            title: const Text(
              'OTP',
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                  builder: (context) => const ForgotPassScreen(),
              ));
            },
            title: const Text(
              'Forgot Password',
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                  builder: (context) => const ChangePassScreen(),
              ));
            },
            title: const Text(
              'Change Password',
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                  builder: (context) => const ImageUploaderScreen(),
              ));
            },
            title: const Text(
              'Image Uploader',
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                  builder: (context) => const UserProfileScreen(),
              ));
            },
            title: const Text(
              'User Profile',
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                  builder: (context) => const ChatScreen(),
              ));
            },
            title: const Text(
              'Chat',
            ),
          ),
        ],
      ),
    );
  }
}
