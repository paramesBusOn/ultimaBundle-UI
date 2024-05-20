part of '../change_password_page.dart';

class _BuildNewPasswordTextField extends StatelessWidget {
  const _BuildNewPasswordTextField({
    Key? key,
    required this.controller,
    required this.obscureText,
    required this.onObscureTextTap,
  }) : super(key: key);

  final TextEditingController controller;
  final bool obscureText;
  final VoidCallback onObscureTextTap;

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);

    return CustomTextFormField(
      controller: controller,
      obscureText: obscureText,
      textInputType: TextInputType.text,
      hintText: AppLocalizations.of(context)!.new_password,
      suffixIcon: IconButton(
        color: _theme.primaryColor,
        onPressed: onObscureTextTap,
        icon: Icon(
          (obscureText == true) ? FeatherIcons.eye : FeatherIcons.eyeOff,
        ),
      ),
    );
  }
}
