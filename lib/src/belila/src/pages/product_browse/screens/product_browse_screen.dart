part of '../product_browse_page.dart';

class BelilaProductBrowseScreen extends StatelessWidget {
  const BelilaProductBrowseScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: CustomAppBar(
        context,
        actions: [
          IconButton(
            icon: const Icon(FeatherIcons.search),
            onPressed: () => showSearch<dynamic>(
              context: context,
              delegate: BelilaSearchAllProductScreen(),
            ),
          )
        ],
      ),
      body: StaggeredGridView.countBuilder(
        crossAxisCount: 4,
        itemCount: popularProductList.length,
        physics: const ScrollPhysics(),
        shrinkWrap: true,
        padding: const EdgeInsets.all(Const.margin),
        itemBuilder: (BuildContext context, int index) {
          final product = popularProductList[index];
          return _ProductCard(product: product);
        },
        staggeredTileBuilder: (int index) => const StaggeredTile.fit(2),
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: theme.primaryColor,
        onPressed: () async {
        },
        child: const Icon(FeatherIcons.sliders),
      ),
    );
  }
}
