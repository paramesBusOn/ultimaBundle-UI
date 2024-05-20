part of '../on_boarding_page.dart';

class _BuildSkipButton extends StatelessWidget {
  const _BuildSkipButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);

    return Positioned(
      top: 50,
      right: Const.margin,
      child: InkWell(
        onTap: () => Get.offAllNamed<dynamic>(FoodiyRoutes.signin),
        child: Text(
          '${AppLocalizations.of(context)!.skip} >>',
          style: _theme.textTheme.bodyText1!.copyWith(
            color: _theme.primaryColor,
          ),
        ),
      ),
    );
  }
}
