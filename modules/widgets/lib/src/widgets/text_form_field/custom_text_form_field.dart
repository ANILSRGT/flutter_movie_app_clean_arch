import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// [CustomTextFormField] is a [TextFormField] with a label.
/// [isObscure] is default to false.
/// [obscuringCharacter] is default to ['*'].
/// [autovalidateMode] is default to [AutovalidateMode.onUserInteraction].
class CustomTextFormField extends StatelessWidget {
  /// [CustomTextFormField] constructor
  const CustomTextFormField({
    super.key,
    this.controller,
    this.labelText,
    this.hintText,
    this.validator,
    this.isObscure = false,
    this.obscuringCharacter = '*',
    this.autovalidateMode = AutovalidateMode.onUserInteraction,
    this.keyboardType,
    this.inputFormatters,
    this.prefixIcon,
    this.suffixIcon,
    this.focusNode,
    this.maxLength,
    this.maxLengthEnforcement,
    this.onChanged,
  });

  /// [labelText] is the label text of the [CustomTextFormField].
  final String? labelText;

  /// [hintText] is the hint text of the [CustomTextFormField].
  final String? hintText;

  /// [controller] is the controller of the [CustomTextFormField].
  final TextEditingController? controller;

  /// [validator] is validation function of the [CustomTextFormField].
  final String? Function(String?)? validator;

  /// [isObscure] is private variable to check if the text is obscured.
  final bool isObscure;

  /// [obscuringCharacter] is private variable to set the obscuring character.
  final String obscuringCharacter;

  /// [autovalidateMode] is private variable to set the autovalidate mode.
  final AutovalidateMode autovalidateMode;

  /// [keyboardType] is type of keyboard to be used.
  final TextInputType? keyboardType;

  /// [inputFormatters] is list of input formatters to be used.
  final List<TextInputFormatter>? inputFormatters;

  /// [prefixIcon] is the prefix icon of the [CustomTextFormField].
  final Widget? prefixIcon;

  /// [suffixIcon] is the suffix icon of the [CustomTextFormField].
  final Widget? suffixIcon;

  /// [focusNode] is the focus node of the [CustomTextFormField].
  final FocusNode? focusNode;

  /// [maxLength] is the max length of the [CustomTextFormField].
  final int? maxLength;

  /// [maxLengthEnforcement] is the max length enforcement
  /// of the [CustomTextFormField].
  final MaxLengthEnforcement? maxLengthEnforcement;

  /// [onChanged] is the on changed function of the [CustomTextFormField].
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      validator: validator,
      obscureText: isObscure,
      obscuringCharacter: obscuringCharacter,
      autovalidateMode: autovalidateMode,
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
      maxLength: maxLength,
      maxLengthEnforcement: maxLengthEnforcement,
      onChanged: onChanged,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
      ),
    );
  }
}
