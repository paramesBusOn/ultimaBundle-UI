import 'package:flutter/material.dart';
import 'package:ultimate_bundle/src/lestate/src/helpers/constants.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final TextInputType textInputType;
  final bool obscureText;
  final Widget? suffixIcon;
  final Widget? preffixIcon;
  final ValueChanged<String>? onChanged;
  final int? maxLength;

  const CustomTextFormField({
    Key? key,
    required this.controller,
    required this.hintText,
    this.textInputType = TextInputType.text,
    this.obscureText = false,
    this.suffixIcon,
    this.preffixIcon,
    this.onChanged,
    this.maxLength,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    
    return TextFormField(
      controller: controller,
      style: _theme.textTheme.bodyText2,
      keyboardType: textInputType,
      obscureText: obscureText,
      onChanged: onChanged,
      maxLength: maxLength,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: _theme.textTheme.subtitle1,
        suffixIcon: suffixIcon,
        prefixIcon: preffixIcon,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: Const.space12,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(Const.radius),
          borderSide: BorderSide(color: _theme.disabledColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(Const.radius),
          borderSide: BorderSide(color: _theme.primaryColor),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(Const.radius),
          borderSide: BorderSide(color: _theme.errorColor),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(Const.radius),
          borderSide: BorderSide(color: _theme.errorColor),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(Const.radius),
          borderSide: BorderSide(color: _theme.disabledColor),
        ),
      ),
    );
  }
}
