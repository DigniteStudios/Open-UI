import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

import '../utils/text_theme_extension.dart';
import '../widgets/touchable.dart';


class OTPScreen extends StatefulWidget {
  const OTPScreen({super.key});

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  final controller = TextEditingController();
  final focusNode = FocusNode();

  Future<void> handleSubmit() async {

  }

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 60,
      height: 64,
      textStyle: context.headlineMedium,
      decoration: BoxDecoration(
        border: Border.all(
          // color: Colors.white
          color: Theme.of(context).inputDecorationTheme.border!.borderSide.color
        ),
        // color: const Color.fromRGBO(232, 235, 241, 0.37),
        borderRadius: BorderRadius.circular(10),
      ),
    );

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text("Enter OTP",
              textAlign: TextAlign.center,
              style: context.displaySmall?.copyWith(
                  fontWeight: FontWeight.w600
              ),
            ),

            const SizedBox.square(dimension: 10,),

            Text("Enter the OTP code sent to your number",
              textAlign: TextAlign.center,
              style: context.bodyMedium?.copyWith(
                color: Theme.of(context).colorScheme.secondary
              ),
            ),

            const SizedBox.square(dimension: 30,),

            Pinput(
              length: 4,
              controller: controller,
              focusNode: focusNode,
              defaultPinTheme: defaultPinTheme,
              separatorBuilder: (index) => const SizedBox(width: 16),
              focusedPinTheme: defaultPinTheme.copyWith(
                decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Theme.of(context).colorScheme.shadow,
                      offset: const Offset(0, 3),
                      blurRadius: 16,
                    ),
                  ],
                ),
              ),
              // onClipboardFound: (value) {
              //   debugPrint('onClipboardFound: $value');
              //   controller.setText(value);
              // },
              showCursor: true,
            ),

            const SizedBox.square(dimension: 30,),

            Text.rich(
                textAlign: TextAlign.center,
                TextSpan(children: [
                  TextSpan(
                      text: "Already have an account? ",
                      style: context.bodySmall?.copyWith(
                          color: Theme.of(context).colorScheme.secondary
                      )),
                  TextSpan(
                      text: "Resend Now",
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => null,
                      style: context.titleSmall
                  ),
                ])),

            const SizedBox.square(dimension: 30,),

            PushButton(
              onPressed: handleSubmit,
              label: "Verify",
            ),

            const SizedBox.square(dimension: 10,),



            const SizedBox.square(dimension: 40,),

          ],
        ),
      ),
    );
  }
}
