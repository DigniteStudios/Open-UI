import 'package:flutter/material.dart';

import '../../core/extensions/text_theme_extension.dart';

class OptionTile extends StatelessWidget {
  final VoidCallback? onTap;
  final String title;
  final Color? textColor;
  final bool? hideTrailing;
  const OptionTile({super.key, this.onTap, required this.title, this.textColor, this.hideTrailing});

  @override
  Widget build(BuildContext context) {
    var brightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;

    return DecoratedBox(
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
      child: Material(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(8),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: ListTile(
          onTap: onTap,
          title: Text(title, style: context.bodySmall?.copyWith(
            color: textColor
          ),),
          trailing: (hideTrailing ?? false)
              ? null
              : Icon(Icons.arrow_forward_ios_rounded,
            color: Theme.of(context).colorScheme.primaryContainer,
          ),
        ),
      ),
    );
  }
}
