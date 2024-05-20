part of '../search_page.dart';

class _SearchResultCard extends StatelessWidget {
  const _SearchResultCard({
    Key? key,
    required this.product,
  }) : super(key: key);
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final _themeMode = Provider.of<ThemeProvider>(context);

    return InkWell(
      onTap: () {
        Get.toNamed<dynamic>(BelilaRoutes.product);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Const.radius),
          color: theme.cardColor,
        ),
        padding: const EdgeInsets.all(Const.space8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                CustomNetworkImage(
                  width: double.infinity,
                  image: product.image!,
                ),
                if (product.stock! <= 0)
                  Container(
                    width: double.infinity,
                    height: 150,
                    decoration: BoxDecoration(
                      color: Colors.black54,
                      borderRadius: BorderRadius.circular(Const.radius),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      AppLocalizations.of(context)!.out_of_stock,
                      style: theme.textTheme.bodyText2?.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  )
                else
                  const SizedBox(),
              ],
            ),
            const SizedBox(height: Const.space8),
            Text(
              product.name!,
              style: theme.textTheme.headline4?.copyWith(
                color: _themeMode.isDarkTheme
                    ? ColorDark.fontTitle
                    : ColorLight.fontTitle,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
              maxLines: 1,
              textAlign: TextAlign.left,
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.star,
                  size: 15,
                  color: Colors.amber,
                ),
                const SizedBox(width: 5),
                Expanded(
                  child: Text(
                    // ignore: lines_longer_than_80_chars
                    '${product.rating} • ${product.sold} ${AppLocalizations.of(context)!.sold}',
                    style: theme.textTheme.subtitle2?.copyWith(
                      color: _themeMode.isDarkTheme
                          ? ColorDark.fontSubtitle
                          : ColorLight.fontSubtitle,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 5),
            Text(
              product.storeName ?? 'error',
              style: theme.textTheme.subtitle2?.copyWith(
                color: _themeMode.isDarkTheme
                    ? ColorDark.fontSubtitle
                    : ColorLight.fontSubtitle,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              NumberFormat.currency(symbol: 'Rp. ').format(product.price),
              style: theme.textTheme.headline4?.copyWith(
                color: _themeMode.isDarkTheme
                    ? ColorDark.fontTitle
                    : ColorLight.fontTitle,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
