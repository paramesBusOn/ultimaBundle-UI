part of '../estate_page.dart';


class _BuildDescription extends StatelessWidget {
  const _BuildDescription({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    const _description = 'This neat 2 bedroom unit is walking distance to Eastland and Target Square, it is also only a few minutes away from Eastlink. The unit features gas appliances, kitchen with separate dining/meals area, spacious lounge, bedrooms with built in robes, single lock up garage.';
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Const.margin),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppLocalizations.of(context)!.description,
            style: _theme.textTheme.headline3,
          ),
          const SizedBox(height: Const.space12),
          ReadMoreText(
            _description,
            style: _theme.textTheme.bodyText2,
            trimMode: TrimMode.Line,
            trimLines: 3,
            trimCollapsedText: AppLocalizations.of(context)!.read_more,
            trimExpandedText: AppLocalizations.of(context)!.show_less,
            lessStyle: _theme.textTheme.bodyText2!.copyWith(
              color: _theme.primaryColor,
            ),
            moreStyle: _theme.textTheme.bodyText2!.copyWith(
              color: _theme.primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
