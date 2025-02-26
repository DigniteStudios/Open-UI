import 'package:flutter/material.dart';

import '../../core/extensions/text_theme_extension.dart';
import '../../shared/widgets/input_fields.dart';
import '../../shared/widgets/touchable.dart';


class ForgotPassScreen extends StatefulWidget {
  const ForgotPassScreen({super.key});

  @override
  State<ForgotPassScreen> createState() => _ForgotPassScreenState();
}

class _ForgotPassScreenState extends State<ForgotPassScreen> {
  TextEditingController email = TextEditingController();

  Future<void> handleSubmit() async {

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text("Forgot Password",
              style: context.displaySmall?.copyWith(
                  fontWeight: FontWeight.w600
              ),
            ),
            const SizedBox.square(dimension: 10,),
            Text("Enter registered email address",
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

            PushButton(
              onPressed: handleSubmit,
              label: "Next",
            ),
          ],
        ),
      ),
    );
  }
}
