part of '../search_page.dart';

class _BuildProductGridCard extends StatelessWidget {
  final ProductModel? product;
  final void Function() onPressed;

  const _BuildProductGridCard({
    Key? key,
    required this.onPressed,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(8),
      child: SizedBox(
        width: 150,
        child: Column(
          children: [
            CustomNetworkImage(image: product!.images!.first),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product!.name!,
                    overflow: TextOverflow.clip,
                    maxLines: 2,
                    textAlign: TextAlign.left,
                    style: theme.textTheme.bodyText2!.copyWith(height: 1.2),
                  ),
               const     SizedBox(height: 3),
                  Text(
                    NumberFormat.currency(
                      symbol: r'$ ',
                    ).format(product!.price),
                    overflow: TextOverflow.clip,
                    textAlign: TextAlign.left,
                    style: theme.textTheme.headline4!
                        .copyWith(color: theme.primaryColor),
                  ),
              const      SizedBox(height: 3),
                  Row(
                    children: [
                      CustomStarRating(rating: product!.rating!),
                    const    SizedBox(width: 5),
                      Text(
                        product!.rating.toString(),
                        overflow: TextOverflow.clip,
                        textAlign: TextAlign.left,
                        style:
                            theme.textTheme.subtitle2!.copyWith(fontSize: 10),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
