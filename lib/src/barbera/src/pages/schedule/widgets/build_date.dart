part of '../schedule_page.dart';

class _BuildDate extends StatelessWidget {
  final VoidCallback onSelectDateTap;
  final String date;

  const _BuildDate({
    Key? key,
    required this.onSelectDateTap,
    required this.date,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: Const.margin,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppLocalizations.of(context)!.select_date,
            style: _theme.textTheme.headline4,
          ),
          const SizedBox(height: Const.space12),
          InkWell(
            onTap: onSelectDateTap,
            child: Container(
              width: Screens.width(context),
              height: 45,
              padding: const EdgeInsets.symmetric(
                horizontal: Const.margin,
              ),
              decoration: BoxDecoration(
                color: _theme.cardColor,
                borderRadius: BorderRadius.circular(Const.radius),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    (date == '')
                        ? AppLocalizations.of(context)!.select_date
                        : date,
                    style: _theme.textTheme.subtitle1,
                  ),
                  const Icon(Icons.date_range),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
