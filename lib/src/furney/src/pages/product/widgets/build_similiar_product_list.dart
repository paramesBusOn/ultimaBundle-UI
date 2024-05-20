part of '../product_page.dart';

class _BuildSimiliarProductList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding:const EdgeInsets.symmetric(horizontal: Const.margin),
          child: AutoSizeText(
            AppLocalizations.of(context)!.similiar_product,
            style: theme.textTheme.headline3,
          ),
        ),
      const SizedBox(height: Const.space12),
        StaggeredGridView.countBuilder(
          itemCount: ProductList.bestSellerList.length,
          crossAxisCount: 4,
          staggeredTileBuilder: (int index) => const StaggeredTile.fit(2),
          mainAxisSpacing: 15,
          crossAxisSpacing: 15,
          shrinkWrap: true,
          physics:const ScrollPhysics(),
          padding:const EdgeInsets.symmetric(
            horizontal: 18,
          ),
          itemBuilder: (context, index) {
            final product = ProductList.bestSellerList[index];
            return ProductCard(
              product: product,
              cardType: ProductCardType.grid,
            );
          },
        ),
      ],
    );
  }
}
