part of '../sign_up_page.dart';

class _BuildTermsAndCondition extends StatelessWidget {
  const _BuildTermsAndCondition({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          AppLocalizations.of(context)!.by_sign_in_you_agree_to_the,
          style: _theme.textTheme.subtitle2?.copyWith(),
        ),
        GestureDetector(
          onTap: () {
            showToast(msg: AppLocalizations.of(context)!.terms_clicked);
          },
          child: Text(
            AppLocalizations.of(context)!.terms,
            style: _theme.textTheme.subtitle2?.copyWith(
              color: _theme.primaryColor,
            ),
          ),
        ),
        Text(
          AppLocalizations.of(context)!.and_the,
          style: _theme.textTheme.subtitle2?.copyWith(),
        ),
        GestureDetector(
          onTap: () {
            showToast(msg: AppLocalizations.of(context)!.conditions_clicked);
          },
          child: Text(
            AppLocalizations.of(context)!.conditions,
            style: _theme.textTheme.subtitle2?.copyWith(
              color: _theme.primaryColor,
            ),
          ),
        ),
      ],
    );
  }
}
