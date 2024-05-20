part of '../sign_in_page.dart';

class _BuildDivider extends StatelessWidget {
  const _BuildDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    return Row(
      children: <Widget>[
        Expanded(
          child: Container(
            width: double.infinity,
            height: .5,
            color: _theme.disabledColor,
          ),
        ),
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              AppLocalizations.of(context)!.or_log_in_with,
              style: _theme.textTheme.subtitle2,
            )),
        Expanded(
          child: Container(
            width: double.infinity,
            height: .5,
            color: _theme.disabledColor,
          ),
        ),
      ],
    );
  }
}
