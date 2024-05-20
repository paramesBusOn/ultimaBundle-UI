part of '../cart_page.dart';


class _BuildTransactionTile extends StatelessWidget {
  final String label;
  final int value;

  const _BuildTransactionTile({
    Key? key,
    required this.label,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);

    return Row(
      children: [
        Expanded(
          child: Text(
            label,
            style: _theme.textTheme.bodyText1,
            textAlign: TextAlign.left,
          ),
        ),
        Text(
          NumberFormat.currency(
            symbol: r'$',
            decimalDigits: 0,
          ).format(value),
          style: _theme.textTheme.headline3,
          textAlign: TextAlign.left,
        ),
      ],
    );
  }
}
