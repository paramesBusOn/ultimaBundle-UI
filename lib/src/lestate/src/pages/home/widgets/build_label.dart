part of '../home_page.dart';


class _BuildLabel extends StatelessWidget {
  final String label;
  final VoidCallback? onSeeAllTap;

  const _BuildLabel({
    Key? key,
    required this.label,
    this.onSeeAllTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Const.margin),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: _theme.textTheme.headline1,
          ),
          if (onSeeAllTap == null)
            const SizedBox()
          else
            InkWell(
              onTap: onSeeAllTap,
              child: Text(
                AppLocalizations.of(context)!.see_all,
                style: _theme.textTheme.subtitle1?.copyWith(
                  color: Const.accentColor,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
