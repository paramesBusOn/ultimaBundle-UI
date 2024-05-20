import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ultimate_bundle/src/belila/src/helpers/constants.dart';

enum TextFieldType { alphabet, email, text, password, phoneNumber, number }

class CustomTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final TextFieldType textFieldType;
  final String? hintText;
  final String? labelText;
  final Widget? suffixIcon;
  final bool? obscureText;
  final int? maxLines;
  final int? maxLength;
  final TextAlign? textAlign;
  final List<TextInputFormatter>? inputFormatters;
  final bool enabled;

  const CustomTextFormField({
    Key? key,
    this.controller,
    this.textFieldType = TextFieldType.text,
    this.hintText,
    this.maxLength,
    this.labelText,
    this.suffixIcon,
    this.obscureText = false,
    this.maxLines = 1,
    this.textAlign = TextAlign.left,
    this.inputFormatters,
    this.enabled = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);

    TextInputType _keyboardType(TextFieldType textFieldType) {
      switch (textFieldType) {
        case TextFieldType.alphabet:
          return TextInputType.text;
        case TextFieldType.email:
          return TextInputType.emailAddress;
        case TextFieldType.number:
          return TextInputType.number;
        case TextFieldType.password:
          return TextInputType.text;
        case TextFieldType.phoneNumber:
          return TextInputType.phone;
        case TextFieldType.text:
          return TextInputType.text;
        default:
          return TextInputType.text;
      }
    }

    return TextFormField(
      controller: controller,
      maxLines: maxLines,
      maxLength: maxLength,
      enabled: enabled,
      textAlign: textAlign ?? TextAlign.left,
      obscureText: obscureText ?? false,
      style: _theme.textTheme.bodyText1,
      keyboardType: _keyboardType(textFieldType),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: _theme.textTheme.subtitle2,
        labelText: labelText,
        labelStyle: _theme.textTheme.subtitle1?.copyWith(
            // color: theme.primaryColor,
            ),
        suffixIcon: suffixIcon,
        contentPadding: const EdgeInsets.only(left: Const.margin),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(Const.radius),
          borderSide: BorderSide(color: _theme.primaryColor),
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
      ),
    );
  }
}
