part of '../store_page.dart';

class StoreProductTab extends StatefulWidget {
  final int? storeId;

  const StoreProductTab({
    Key? key,
    this.storeId,
  }) : super(key: key);

  @override
  _StoreProductTabState createState() => _StoreProductTabState();
}

class _StoreProductTabState extends State<StoreProductTab>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return StaggeredGridView.countBuilder(
      crossAxisCount: 4,
      itemCount: popularProductList.length,
      physics: const ScrollPhysics(),
      shrinkWrap: true,
      padding: const EdgeInsets.symmetric(horizontal: 18),
      itemBuilder: (BuildContext context, int index) {
        return _ProductCard(
          product: popularProductList[index],
        );
      },
      staggeredTileBuilder: (int index) => const StaggeredTile.fit(2),
      mainAxisSpacing: 4,
      crossAxisSpacing: 4,
    );
  }

  @override
  bool get wantKeepAlive => true;
}
