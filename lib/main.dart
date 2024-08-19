import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:open_ui/utils/text_theme_extension.dart';

import 'controllers/notification_controller.dart';
import 'ui/change_pass_screen.dart';
import 'ui/chat_screen.dart';
import 'ui/forgot_pass_screen.dart';
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
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.black,
          secondary: const Color(0xFF5E5F62),
          primary: Colors.black,
          primaryContainer: Colors.black12,
          shadow: const Color.fromRGBO(0, 0, 0, 0.05999999865889549),
          surface: const Color(0xFFD9D9D9)
        ),
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white
        ),
        inputDecorationTheme: InputDecorationTheme(
          hintStyle: context.titleSmall?.copyWith(
              fontSize: 14,
              fontWeight: FontWeight.w400
          ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10)
          ),
        ),
        scaffoldBackgroundColor: Colors.white
      ),
      darkTheme: ThemeData(
          colorScheme: ColorScheme.dark(
            primary: Color(0xFF5E4DB2),
            secondary: Colors.white,
            inversePrimary: Color(0xFFDFD8FD),
            // secondary: const Color(0xFF5E5F62),
            // primary: Colors.black,
            // primaryContainer: Colors.black12,
            shadow: Colors.black26,
            surface: Color(0xFF5E4DB2).withOpacity(.3)
            // onPrimary: Colors.white,
          ),
          textTheme: Theme.of(context).textTheme.apply(
            bodyColor: Colors.white,
            displayColor: Colors.white,
          ),
          useMaterial3: true,
          scaffoldBackgroundColor: const Color(0xFF2B273F),
          appBarTheme: const AppBarTheme(
              backgroundColor: Color(0xFF2B273F),
          ),
          inputDecorationTheme: InputDecorationTheme(
            hintStyle: context.titleSmall?.copyWith(
                fontSize: 14,
                fontWeight: FontWeight.w400,
              color: Colors.white
            ),
            border: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.white
              ),
                borderRadius: BorderRadius.circular(10)
            ),
          ),
      ),
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
