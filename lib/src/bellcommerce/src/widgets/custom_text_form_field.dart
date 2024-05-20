import 'package:flutter/material.dart';
import 'package:ultimate_bundle/src/bellcommerce/src/helpers/constants.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final TextInputType keyboardType;
  final bool obscureText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final ValueChanged<String>? onChanged;

  const CustomTextFormField({
    Key? key,
    required this.controller,
    required this.hintText,
     this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.prefixIcon,
    this.suffixIcon,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);

    return TextFormField(
      controller: controller,
      cursorColor: _theme.primaryColor,
      obscureText: obscureText,
      keyboardType: keyboardType,
      style: _theme.textTheme.bodyText2,
      autocorrect: false,
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: _theme.textTheme.subtitle2,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: Const.margin,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(Const.radius),
          borderSide: BorderSide(
            color: _theme.primaryColor.withOpacity(.4),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(Const.radius),
          borderSide: BorderSide(
            color: _theme.primaryColor,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(Const.radius),
            borderSide: BorderSide(
              color: _theme.errorColor,
            )),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(Const.radius),
          borderSide: BorderSide(
            color: _theme.errorColor,
          ),
        ),
      ),
    );
  }
}
