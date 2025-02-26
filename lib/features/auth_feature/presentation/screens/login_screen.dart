import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../controllers/login_controller.dart';
import '../../../../core/extensions/text_theme_extension.dart';
import '../../../../shared/widgets/input_fields.dart';
import '../../../../shared/widgets/touchable.dart';
import '../providers/login_provider.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final LoginController controller = LoginController();

  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void handleForgot() {

  }

  Future<void> handleSubmit() async {
    if(formKey.currentState!.validate()) {
      ref.read(loginProvider.notifier)
          .handleLogin(
          email: email.text,
          password: password.text
      );
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(kDebugMode) {
      email.text = "eve.holt@reqres.in";
      password.text = "cityslicka";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(15.0),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text("Log In",
                style: context.displaySmall?.copyWith(
                  fontWeight: FontWeight.w600
                ),
              ),
              const SizedBox.square(dimension: 10,),
              Text("Enter the below details to login",
                style: context.bodyMedium?.copyWith(
                    color: Theme.of(context).colorScheme.secondary
                ),
              ),

              const SizedBox.square(dimension: 30,),

              InputField(
                controller: email,
                hintText: "Email Address",
              ),

              const SizedBox.square(dimension: 20,),

              InputField(
                controller: password,
                hintText: "Password",
                obscureText: true,
              ),

              const SizedBox.square(dimension: 2,),

              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                    onPressed: handleForgot,
                    child: const Text("Forgot Password?")
                ),
              ),

              const SizedBox.square(dimension: 10,),

              PushButton(
                onPressed: handleSubmit,
                label: "Log In",
              ),

              const SizedBox.square(dimension: 10,),

              Text.rich(
                  textAlign: TextAlign.center,
                  TextSpan(children: [
                    TextSpan(
                        text: "Don’t have an account? ",
                        style: context.bodySmall),
                    TextSpan(
                        text: "Sign Up",
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => null,
                        style: context.titleSmall
                    ),
                  ])),

              const SizedBox.square(dimension: 40,),

              Row(
                mainAxisAlignment:
                MainAxisAlignment.spaceEvenly,
                children: [
                  // if (Platform.isIOS)
                    SocialButton(
                      onTap: controller.appleSignIn,
                      type: SocialButtonType.apple,
                    ),
                  SocialButton(
                    onTap: controller.googleSignIn,
                    type: SocialButtonType.google,
                  ),
                  SocialButton(
                    onTap: controller.facebookSignIn,
                    type: SocialButtonType.facebook,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
