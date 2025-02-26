import 'package:flutter/material.dart';
import 'package:phone_input/phone_input_package.dart';

class PhoneInputField extends StatefulWidget {
  const PhoneInputField({super.key,
        required this.controller,
        this.currentFocus,
        this.nextFocus,
        this.enabled,
        this.isCountrySelectionEnabled
      });
  final PhoneController controller;
  final FocusNode? currentFocus;
  final FocusNode? nextFocus;
  final bool? enabled;
  final bool? isCountrySelectionEnabled;

  @override
  State<PhoneInputField> createState() => _PhoneInputFieldState();
}

class _PhoneInputFieldState extends State<PhoneInputField> {
  LayerLink layerLink = LayerLink();
  final bool _shouldFormat = true;
  final bool _isFlagCircle = true;
  final bool _showFlagInInput = true;
  final bool _showArrow = true;
  late List<CountrySelectorNavigator> navigators;
  late CountrySelectorNavigator selectorNavigator;

  @override
  void initState() {
    super.initState();
    navigators = <CountrySelectorNavigator>[
      const CountrySelectorNavigator.searchDelegate(),
      const CountrySelectorNavigator.dialog(),
      // const CountrySelectorNavigator.bottomSheet(),
      // const CountrySelectorNavigator.modalBottomSheet(),
      // const CountrySelectorNavigator.draggableBottomSheet(),
      // CountrySelectorNavigator.dropdown(
      //   backgroundColor: const Color(0xFFE7DEF6),
      //   borderRadius: BorderRadius.circular(5),
      //   layerLink: layerLink,
      //   showSearchInput: true,
      // ),
    ];
    selectorNavigator = navigators.first;
  }

  @override
  Widget build(BuildContext context) {
    EdgeInsets densePadding =
    const EdgeInsets.symmetric(vertical: 12, horizontal: 12);
    return PhoneInput(
      controller: widget.controller,
      focusNode: widget.currentFocus,
      onEditingComplete: () {
        widget.currentFocus?.unfocus();
        if (widget.nextFocus != null) {
          widget.nextFocus?.requestFocus();
        }
      },
      enabled: widget.enabled ?? true,
      isCountrySelectionEnabled: widget.isCountrySelectionEnabled ?? true,
      showArrow: _showArrow,
      shouldFormat: _shouldFormat,
      validator: PhoneValidator.compose(
          [PhoneValidator.required(), PhoneValidator.valid()]),
      flagShape: _isFlagCircle ? BoxShape.circle : BoxShape.rectangle,
      showFlagInInput: _showFlagInInput,
      decoration: InputDecoration(
          // contentPadding: densePadding,
          // filled: widget.readOnly,
          // fillColor: AppColors.filled,
          // border: OutlineInputBorder(
          //     borderRadius: BorderRadius.circular(15),
          //     borderSide:
          //     const BorderSide(width: 0.50, color: AppColors.border)),
          // focusedBorder: OutlineInputBorder(
          //     borderRadius: BorderRadius.circular(15),
          //     borderSide:
          //     const BorderSide(width: 0.50, color: AppColors.primary)),
          // enabledBorder: OutlineInputBorder(
          //     borderRadius: BorderRadius.circular(15),
          //     borderSide:
          //     const BorderSide(width: 0.50, color: AppColors.border)),
          // disabledBorder: OutlineInputBorder(
          //     borderRadius: BorderRadius.circular(15),
          //     borderSide: const BorderSide(width: 0.50, color: Colors.grey)),
          hintText: 'Phone Number'
        // border: switch (fieldType) {
        //   FieldType.outlined => const OutlineInputBorder(),
        //   FieldType.underlined => const UnderlineInputBorder(),
        // },
      ),
      countrySelectorNavigator: selectorNavigator,
    );
  }
}