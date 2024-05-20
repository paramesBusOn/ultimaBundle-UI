part of '../sign_in_page.dart';


class _BuildDivider extends StatelessWidget {
  const _BuildDivider({
    Key? key, 
  }) : super(key: key);
 

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    return Row(
      children: [
        Expanded(child: Divider(color: _theme.disabledColor)),
        const SizedBox(width: Const.space15),
        Text(
          AppLocalizations.of(context)!.or,
          style: _theme.textTheme.subtitle1,
        ),
        const SizedBox(width: Const.space15),
        Expanded(child: Divider(color: _theme.disabledColor)),
      ],
    );
  }
}
