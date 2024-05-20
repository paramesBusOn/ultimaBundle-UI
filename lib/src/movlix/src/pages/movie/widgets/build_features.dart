part of '../movie_page.dart';



class _BuildFeatures extends StatelessWidget {
  const _BuildFeatures({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);

    return Column(
      children: [
        Divider(color: _theme.disabledColor),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                const Icon(FeatherIcons.plus),
                const SizedBox(height: Const.space8),
                Text(
                  AppLocalizations.of(context)!.add_to_list,
                  style: _theme.textTheme.subtitle1,
                ),
              ],
            ),
            Column(
              children: [
                const Icon(FeatherIcons.heart),
                const SizedBox(height: Const.space8),
                Text(
                  AppLocalizations.of(context)!.rate,
                  style: _theme.textTheme.subtitle1,
                ),
              ],
            ),
            Column(
              children: [
                const Icon(FeatherIcons.download),
                const SizedBox(height: Const.space8),
                Text(
                  AppLocalizations.of(context)!.download,
                  style: _theme.textTheme.subtitle1,
                ),
              ],
            ),
            Column(
              children: [
                const Icon(FeatherIcons.share2),
                const SizedBox(height: Const.space8),
                Text(
                  AppLocalizations.of(context)!.share,
                  style: _theme.textTheme.subtitle1,
                ),
              ],
            ),
          ],
        ),
        Divider(color: _theme.disabledColor),
      ],
    );
  }
}
