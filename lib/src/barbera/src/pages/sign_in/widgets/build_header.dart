part of '../sign_in_page.dart';

class _BuildHeader extends StatelessWidget {
  const _BuildHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    
    return Column(
      children: [
        Text(
          AppLocalizations.of(context)!.welcome_back,
          style: _theme.textTheme.headline2?.copyWith(
            color: _theme.primaryColor,
          ),
        ),
        const SizedBox(height: Const.space5),
        Text(
          AppLocalizations.of(context)!.style_that_fit_your_lifestyle,
          style: _theme.textTheme.subtitle2,
        ),
      ],
    );
  }
}
