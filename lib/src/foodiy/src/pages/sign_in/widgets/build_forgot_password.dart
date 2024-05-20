part of '../sign_in_page.dart';

class _BuildForgotPassword extends StatelessWidget {
  const _BuildForgotPassword({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    return TextButton(
      onPressed: () => Get.toNamed<dynamic>(FoodiyRoutes.forgotpassword),
      child: Text(
        AppLocalizations.of(context)!.forgot_password,
        style: _theme.textTheme.headline3!.copyWith(
          color: _theme.primaryColor,
        ),
      ),
    );
  }
}
