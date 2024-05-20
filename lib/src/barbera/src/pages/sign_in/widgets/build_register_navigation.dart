part of '../sign_in_page.dart';

class _BuildRegisterNavigation extends StatelessWidget {
  const _BuildRegisterNavigation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          AppLocalizations.of(context)!.dont_have_an_account,
          style: _theme.textTheme.subtitle1,
        ),
        const SizedBox(width: Const.space5),
        InkWell(
          onTap: ()=>Get.toNamed<dynamic>(BarberaRoutes.signUp),
          child: Text(
            AppLocalizations.of(context)!.sign_up,
            style: _theme.textTheme.bodyText2
                ?.copyWith(color: _theme.primaryColor),
          ),
        ),
      ],
    );
  }
}
