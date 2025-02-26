import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  const InputField(
      {super.key,
        this.labelText,
        this.hintText,
        this.obscureText,
        this.inLineLabel = false,
        this.readOnly,
        this.disabled,
        this.filled = false,
        this.isDense = true,
        this.hideText,
        this.controller,
        this.suffixIcon,
        this.prefixIcon,
        this.validator,
        this.onChanged,
        this.onTap,
        this.textInputType,
        this.contentPadding,
        this.showBorder = true,
        this.radius,
        this.maxLines = 1,
        this.maxLength,
        this.minLines,
        this.labelColor,
        this.onFieldSubmitted,
        this.onEditingComplete,
        this.focusNode,
        this.nextFocus,
        this.textCapitalization = TextCapitalization.none});

  final TextEditingController? controller;
  final String? labelText;
  final String? hintText;
  final Color? labelColor;
  final bool inLineLabel;
  final bool? obscureText;
  final bool? readOnly;
  final bool? hideText;
  final bool filled;
  final bool? disabled;
  final bool isDense;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final EdgeInsets? contentPadding;
  final FormFieldValidator<String>? validator;
  final VoidCallback? onTap;
  final ValueChanged<String?>? onChanged;
  final ValueChanged<String?>? onFieldSubmitted;
  final TextInputType? textInputType;
  final bool showBorder;
  final double? radius;
  final int? maxLines;
  final int? maxLength;
  final int? minLines;
  final TextCapitalization textCapitalization;
  final void Function()? onEditingComplete;
  final FocusNode? focusNode;
  final FocusNode? nextFocus;

  @override
  Widget build(BuildContext context) {

    return  TextFormField(
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      obscureText: obscureText ?? false,
      focusNode: focusNode,
      controller: controller,
      validator: validator,
      keyboardType: textInputType,
      readOnly: readOnly ?? false,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      onTap: onTap,
      onChanged: onChanged,
      enabled: !(disabled ?? false),
      maxLines: obscureText == true ? 1 : maxLines,
      minLines: minLines,
      maxLength: maxLength,
      onEditingComplete: onEditingComplete ??
              () {
            focusNode?.unfocus();
            if (nextFocus != null) {
              nextFocus?.requestFocus();
            }
          },
      textCapitalization: textCapitalization,
      decoration: InputDecoration(
          isDense: false,
          hintText: hintText,
          // fillColor: Colors.grey.withOpacity(.2),
          // filled: true,
          // border: OutlineInputBorder(
          //     borderRadius: BorderRadius.circular(10)
          // ),
          // enabledBorder: OutlineInputBorder(
          //     borderSide: const BorderSide(
          //         color: Colors.black
          //     ),
          //     borderRadius: BorderRadius.circular(10)
          // )
      ),
    );
  }
}
