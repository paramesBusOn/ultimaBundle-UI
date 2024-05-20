part of '../product_page.dart';

class _ProductPriceAndRating extends StatelessWidget {
  const _ProductPriceAndRating({
    Key? key,
    required this.product,
  }) : super(key: key);

  final ProductDetailModel? product;
  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);

    return Row(
      children: [
        RichText(
          textAlign: TextAlign.right,
          text: TextSpan(
            children: [
              TextSpan(
                text: NumberFormat.currency(
                  symbol: 'Rp. ',
                  decimalDigits: 0,
                  locale: 'id-ID',
                ).format(product?.price ?? 0),
                style: _theme.textTheme.headline3,
              ),
              TextSpan(
                text: '/${product?.unit}',
                style: _theme.textTheme.headline4,
              )
            ],
          ),
        ),
        const SizedBox(width: Const.space8),
        Text(
          '|',
          style: _theme.textTheme.headline1!.copyWith(
            color: _theme.disabledColor,
          ),
        ),
        const SizedBox(width: Const.space8),
        CustomStarRating(rating: product?.rating?.toDouble() ?? 0),
        const SizedBox(width: Const.space8),
        Text(
          product?.rating.toString() ?? 0.toString(),
          style: _theme.textTheme.subtitle2,
        ),
      ],
    );
  }
}
