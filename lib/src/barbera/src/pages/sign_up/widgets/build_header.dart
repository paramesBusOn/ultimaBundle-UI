part of '../sign_up_page.dart';


class _BuildHeader extends StatelessWidget {
  const _BuildHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppLocalizations.of(context)!.create_an_account,
          style: _theme.textTheme.headline3,
        ),
        const SizedBox(height: Const.space5),
        Text(
          AppLocalizations.of(context)!.sign_up_to_continue,
          style: _theme.textTheme.subtitle2,
        ),
      ],
    );
  }
}
