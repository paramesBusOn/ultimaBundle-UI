part of '../cart_page.dart';

class _BuildCartItem extends StatelessWidget {
  final String label;
  final bool isTotal;
  final int value;

  const _BuildCartItem(
      {Key? key,
      required this.label,
      this.isTotal = false,
      required this.value})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style:
              isTotal ? theme.textTheme.headline4 : theme.textTheme.subtitle1,
        ),
        CustomPriceText(value: value)
      ],
    );
  }
}
