part of '../order_detail_page.dart';

class _BuildProductCard extends StatelessWidget {
  final ProductModel product;

  const _BuildProductCard({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    return Container(
      width: double.infinity,
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Const.radius),
        border: Border.all(color: _theme.disabledColor),
      ),
      padding: const EdgeInsets.all(Const.space12),
      margin: const EdgeInsets.only(bottom: Const.space8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(Const.radius),
            child: OctoImage(
              image: CachedNetworkImageProvider(product.image ?? ''),
              width: 80,
              height: 80,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: Const.space12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.title ?? '',
                  style: _theme.textTheme.headline4,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const Spacer(),
                Text(
                  '\$ ${product.normalPrice}',
                  style: _theme.textTheme.headline3!
                      .copyWith(color: _theme.primaryColor),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
