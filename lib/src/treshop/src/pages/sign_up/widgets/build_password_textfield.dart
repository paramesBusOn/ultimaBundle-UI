part of '../sign_up_page.dart';

class _BuildPasswordTextField extends StatelessWidget {
  const _BuildPasswordTextField({
    Key? key,
    required this.passwordController,
    required this.obscureText,
    required this.onObscureTextTap,
  }) : super(key: key);

  final TextEditingController? passwordController;
  final bool obscureText;
  final VoidCallback onObscureTextTap;

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);

    return CustomShakeTransition(
      duration: const Duration(milliseconds: 1200),
      child: CustomTextFormField(
        controller: passwordController,
        obscureText: obscureText,
        borderType: BorderType.outline,
        textFieldType: TextFieldType.password,
        hintText: AppLocalizations.of(context)!.password,
        prefixIcon: Icon(
          FeatherIcons.lock,
          color: _theme.primaryColor,
        ),
        suffixIcon: IconButton(
          icon: Icon((obscureText == true)
              ? FeatherIcons.eye
              : FeatherIcons.eyeOff),
          color: _theme.primaryColor,
          onPressed: onObscureTextTap,
        ),
      ),
    );
  }
}
