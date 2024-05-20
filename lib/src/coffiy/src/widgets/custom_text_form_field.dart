import 'package:flutter/material.dart';
import 'package:ultimate_bundle/src/coffiy/src/helpers/constants.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final TextInputType? textInputType;
  final bool obscureText;
  final Widget? suffixIcon;
  final ValueChanged<String>? onChanged;
  final int? maxLength;
  final IconData? preffixIcon;

  const CustomTextFormField({
    Key? key,
    required this.controller,
    required this.hintText,
    this.textInputType,
    this.obscureText = false,
    this.suffixIcon,
    this.onChanged,
    this.maxLength,
    this.preffixIcon,
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
        prefixIcon: (preffixIcon == null)
            ? null
            : Icon(
                preffixIcon,
                color: _theme.primaryColor,
              ),
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
