part of '../profile_page.dart';

Future _signOutDialog(BuildContext context) {
  final _theme = Theme.of(context);

  return showDialog<dynamic>(
    context: context,
    builder: (context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Const.margin),
        ),
        title: Center(
          child: Text(
            AppLocalizations.of(context)!.are_you_sure_you_want_to_sign_out,
            style: _theme.textTheme.headline3,
            textAlign: TextAlign.center,
          ),
        ),
        actions: [
          TextButton(
            onPressed: Get.back,
            child: Text(
              AppLocalizations.of(context)!.cancel,
              style: _theme.textTheme.bodyText2,
            ),
          ),
          TextButton(
            onPressed: () => Get.offAllNamed<dynamic>(
              BellcommerceRoutes.signIn,
            ),
            child: Text(
              AppLocalizations.of(context)!.logout,
              style: _theme.textTheme.bodyText2!.copyWith(
                color: _theme.primaryColor,
              ),
            ),
          ),
        ],
      );
    },
  );
}
