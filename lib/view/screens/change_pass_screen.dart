import 'package:flutter/material.dart';

import '../../core/extensions/text_theme_extension.dart';
import '../../shared/widgets/input_fields.dart';
import '../../shared/widgets/touchable.dart';

class ChangePassScreen extends StatefulWidget {
  const ChangePassScreen({super.key});

  @override
  State<ChangePassScreen> createState() => _ChangePassScreenState();
}

class _ChangePassScreenState extends State<ChangePassScreen> {
  TextEditingController password = TextEditingController();
  TextEditingController newPassword = TextEditingController();

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
            Text("Reset Password",
              style: context.displaySmall?.copyWith(
                  fontWeight: FontWeight.w600
              ),
            ),
            const SizedBox.square(dimension: 10,),
            Text("Enter your new password",
              style: context.bodyMedium?.copyWith(
                  color: Theme.of(context).colorScheme.secondary
              ),
            ),

            const SizedBox.square(dimension: 30,),

            InputField(
              controller: password,
              hintText: "Password",
            ),

            const SizedBox.square(dimension: 10,),

            InputField(
              controller: newPassword,
              hintText: "Re-Enter Password",
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
