part of '../estate_page.dart';


class _BuildFooter extends StatelessWidget {
  final EstateModel estate;

  const _BuildFooter({Key? key, required this.estate}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);

    return Container(
      width: double.infinity,
      height: 70,
      color: _theme.cardColor,
      padding: const EdgeInsets.symmetric(horizontal: Const.margin),
      child: Row(
        children: [
          Expanded(
            child: Row(
              children: [
                Text(
                  NumberFormat.currency(
                    symbol: r'$',
                    decimalDigits: 0,
                  ).format(estate.price),
                  style: _theme.textTheme.headline1?.copyWith(
                    color: Const.accentColor,
                  ),
                ),
                Text(
                  '/${AppLocalizations.of(context)!.month}'.toLowerCase(),
                  style: _theme.textTheme.subtitle2,
                ),
              ],
            ),
          ),
          Expanded(
            child: CustomElevatedButton(
              onTap: () => Get.toNamed<dynamic>(LestateRoutes.summary),
              label: AppLocalizations.of(context)!.book_now,
            ),
          )
        ],
      ),
    );
  }
}
