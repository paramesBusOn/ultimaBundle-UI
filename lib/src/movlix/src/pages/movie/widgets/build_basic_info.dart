part of '../movie_page.dart';

class _BuildBasicInfo extends StatelessWidget {
  const _BuildBasicInfo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Const.margin),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: Const.space15),
          Text(AppLocalizations.of(context)!.summaries, style: _theme.textTheme.headline3),
          const SizedBox(height: Const.space12),
          Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequa',
            style: _theme.textTheme.bodyText2,
          ),
          const SizedBox(height: Const.space15),
          Text(
            'Director: Surya utama',
            style: _theme.textTheme.subtitle1,
          ),
          const SizedBox(height: Const.space8),
          Text(
            'Stars: Michael, Tresvor, Loris',
            style: _theme.textTheme.subtitle1,
          ),
        ],
      ),
    );
  }
}
