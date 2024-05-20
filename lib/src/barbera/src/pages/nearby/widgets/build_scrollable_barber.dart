part of '../nearby_page.dart';

class _BuildScrollableBarber extends StatelessWidget {
  final List<BarberModel> itemList;
  final String label;
  final VoidCallback onSeeAllTap;

  const _BuildScrollableBarber({
    Key? key,
    required this.itemList,
    required this.label,
    required this.onSeeAllTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: Const.margin),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                label,
                style: _theme.textTheme.headline3,
              ),
              InkWell(
                onTap: onSeeAllTap,
                child: Text(
                  AppLocalizations.of(context)!.see_all,
                  style: _theme.textTheme.subtitle1,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: Const.space12),
        SizedBox(
          width: Screens.width(context),
          height: 110,
          child: ListView.builder(
            itemCount: itemList.length,
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: Const.margin),
            itemBuilder: (context, index) {
              final barber = itemList[index];
              return _BuildBarberCard(barber: barber);
            },
          ),
        ),
      ],
    );
  }
}
