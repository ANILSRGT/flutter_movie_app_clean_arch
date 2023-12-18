import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/material_symbols.dart';
import 'package:widgets/src/widgets/text_form_field/custom_text_form_field.dart';

/// [PasswordCustomTextFormField] is a [CustomTextFormField]
/// with a label and obscure text.
/// isObscure is default to true.
/// [obscuringCharacter] is default to ['*'].
/// [autovalidateMode] is default to [AutovalidateMode.onUserInteraction].
/// [showEyeIcon] is default to [Icon(Icons.visibility_rounded)].
/// [hideEyeIcon] is default to [Icon(Icons.visibility_off_rounded)].
/// If press [showEyeIcon], the text will be visible.
/// If press [hideEyeIcon], the text will be obscured.
final class PasswordCustomTextFormField extends StatefulWidget {
  /// [PasswordCustomTextFormField] constructor
  const PasswordCustomTextFormField({
    super.key,
    this.labelText,
    this.hintText,
    this.controller,
    this.validator,
    this.obscuringCharacter = '*',
    this.autovalidateMode = AutovalidateMode.onUserInteraction,
    this.keyboardType,
    this.inputFormatters,
    this.prefixIcon,
    this.showEyeIcon = const Iconify(MaterialSymbols.visibility_rounded),
    this.hideEyeIcon = const Iconify(MaterialSymbols.visibility_off_rounded),
  });

  /// [labelText] is the label text of the [CustomTextFormField]
  final String? labelText;

  /// [hintText] is the hint text of the [CustomTextFormField]
  final String? hintText;

  /// [controller] is the controller of the [CustomTextFormField]
  final TextEditingController? controller;

  /// [validator] is validation function of the [CustomTextFormField]
  final String? Function(String?)? validator;

  /// [obscuringCharacter] is private variable to set the obscuring character
  final String obscuringCharacter;

  /// [autovalidateMode] is private variable to set the autovalidate mode
  final AutovalidateMode autovalidateMode;

  /// [keyboardType] is type of keyboard to be used
  final TextInputType? keyboardType;

  /// [inputFormatters] is list of input formatters to be used
  final List<TextInputFormatter>? inputFormatters;

  /// [prefixIcon] is the prefix icon of the [CustomTextFormField]
  final Widget? prefixIcon;

  /// [showEyeIcon] is the show obscure suffix icon of the [CustomTextFormField]
  final Widget showEyeIcon;

  /// [hideEyeIcon] is the hide obscure suffix icon of the [CustomTextFormField]
  final Widget hideEyeIcon;

  @override
  State<PasswordCustomTextFormField> createState() =>
      _PasswordCustomTextFormFieldState();
}

class _PasswordCustomTextFormFieldState
    extends State<PasswordCustomTextFormField> {
  bool isObscure = true;

  void toggleObscure() {
    setState(() {
      isObscure = !isObscure;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      labelText: widget.labelText,
      controller: widget.controller,
      validator: widget.validator,
      isObscure: isObscure,
      obscuringCharacter: widget.obscuringCharacter,
      autovalidateMode: widget.autovalidateMode,
      keyboardType: widget.keyboardType,
      inputFormatters: widget.inputFormatters,
      prefixIcon: widget.prefixIcon,
      suffixIcon: IconButton(
        icon: isObscure ? widget.showEyeIcon : widget.hideEyeIcon,
        onPressed: toggleObscure,
      ),
      hintText: widget.hintText,
    );
  }
}
