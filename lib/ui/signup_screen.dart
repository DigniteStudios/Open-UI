import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:phone_input/phone_input_package.dart';

import '../utils/form_validators.dart';
import '../utils/text_theme_extension.dart';
import '../widgets/input_fields.dart';
import '../widgets/phone_input.dart';
import '../widgets/touchable.dart';


class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  // Input fields controllers
  final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController phone = TextEditingController();
  late PhoneController phoneController;

  // Fields nodes
  final nameFocus = FocusNode();
  final emailFocus = FocusNode();
  final passFocus = FocusNode();
  final phoneFocus = FocusNode();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future<void> handleSubmit() async {
    if(formKey.currentState!.validate()) {

    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    phoneController = PhoneController(PhoneNumber(isoCode: IsoCode.US, nsn: phone.text));
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
              Text("Sign Up",
                style: context.displaySmall?.copyWith(
                    fontWeight: FontWeight.w600
                ),
              ),
              const SizedBox.square(dimension: 10,),
              Text("Enter the below details to sign up",
                style: context.bodyMedium?.copyWith(
                    color: Theme.of(context).colorScheme.secondary
                ),
              ),

              const SizedBox.square(dimension: 30,),

              InputField(
                controller: name,
                hintText: "Name",
                focusNode: nameFocus,
                nextFocus: emailFocus,
                validator: nameValidator,
              ),

              const SizedBox.square(dimension: 20,),

              InputField(
                controller: email,
                hintText: "Email",
                focusNode: emailFocus,
                nextFocus: phoneFocus,
                validator: emailValidator,
              ),

              const SizedBox.square(dimension: 20,),

              PhoneInputField(
                controller: phoneController,
                currentFocus: phoneFocus,
                nextFocus: passFocus,
              ),

              const SizedBox.square(dimension: 20,),

              InputField(
                controller: password,
                focusNode: passFocus,
                hintText: "Password",
                validator: passFieldValidator,
              ),


              const SizedBox.square(dimension: 30,),

              PushButton(
                onPressed: handleSubmit,
                label: "Submit",
              ),

              const SizedBox.square(dimension: 10,),

              Text.rich(
                  textAlign: TextAlign.center,
                  TextSpan(children: [
                    TextSpan(
                        text: "Already have an account? ",
                        style: context.bodySmall),
                    TextSpan(
                        text: "Log In",
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => null,
                        style: context.titleSmall
                    ),
                  ])),

              const SizedBox.square(dimension: 40,),

            ],
          ),
        ),
      ),
    );
  }
}
