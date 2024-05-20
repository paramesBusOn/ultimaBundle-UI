part of '../sign_in_page.dart';



class _BuildRegisterButton extends StatelessWidget {
  const _BuildRegisterButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      // mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          AppLocalizations.of(context)!.dont_have_an_account,
          style: _theme.textTheme.headline4,
        ),
        const SizedBox(width: 5),
        InkWell(
          onTap: () => Get.toNamed<dynamic>(FoodiyRoutes.signup),
          child: Text(
            AppLocalizations.of(context)!.register,
            style: _theme.textTheme.headline4!.copyWith(
              color: ColorLight.primary,
            ),
          ),
        ),
      ],
    );
  }
}
