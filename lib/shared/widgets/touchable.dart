import 'package:flutter/material.dart';

import '../../core/constants/image_constants.dart';

enum SocialButtonType {google, apple, facebook}

class PushButton extends StatelessWidget {
  final String label;
  final bool loading;
  final VoidCallback onPressed;
  final EdgeInsets? padding;
  const PushButton({super.key,
    required this.label,
    required this.onPressed,
    this.padding,
    this.loading = false
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
          backgroundColor: Theme.of(context).colorScheme.primary,
          foregroundColor: Theme.of(context).colorScheme.onPrimary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          padding: padding ?? const EdgeInsets.all(18)
      ),
      onPressed: loading ? null : onPressed,
      child: loading
          ? const SizedBox.square(
        dimension: 20,
        child: CircularProgressIndicator(
          strokeCap: StrokeCap.round,
          color: Colors.white,
          strokeWidth: 5,
        ),
      )
          : Text(label),
    );
  }
}

class SocialButton extends StatelessWidget {
  const SocialButton(
      {super.key, required this.type, required this.onTap, this.color});

  final SocialButtonType type;
  final Color? color;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    double iconSize = 60;
    return Material(
      color: Colors.transparent,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: const BorderSide(color: Color(0xFFD9D9D9), width: .5)),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(5),
        child: Ink(
          height: iconSize,
          width: iconSize,
          decoration: const BoxDecoration(
            color: Colors.transparent,
            // color: color ?? Colors.white,
          ),
          padding: const EdgeInsets.all(15),
          child: Image.asset(
            type == SocialButtonType.apple
                ? Assets.appleIcon
            : type == SocialButtonType.facebook
            ? Assets.fbIcon
            : Assets.googleIcon,
            color: color,
          ),
        ),
      ),
    );
  }
}
