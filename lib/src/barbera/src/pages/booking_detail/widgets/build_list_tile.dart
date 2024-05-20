part of '../booking_detail_page.dart';

class _BuildListTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final int price;

  const _BuildListTile({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);

    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: Const.margin),
                    child: Text(
                      title,
                      style: _theme.textTheme.headline4,
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: Const.margin),
                    child: Row(
                      children: [
                        const Icon(
                          FeatherIcons.clock,
                          size: 12,
                        ),
                        const SizedBox(width: Const.space12),
                        Text(
                          subtitle,
                          style: _theme.textTheme.subtitle2,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: Const.margin),
              child: Text(
                NumberFormat.currency(
                  symbol: r'$',
                  decimalDigits: 0,
                ).format(price),
                style: _theme.textTheme.headline5,
              ),
            ),
          ],
        ),
        Divider(color: _theme.unselectedWidgetColor),
      ],
    );
  }
}
