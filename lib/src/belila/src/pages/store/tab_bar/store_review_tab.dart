part of '../store_page.dart';

class StoreReviewTab extends StatefulWidget {
  const StoreReviewTab({
    Key? key,
  }) : super(key: key);

  @override
  _StoreReviewTabState createState() => _StoreReviewTabState();
}

class _StoreReviewTabState extends State<StoreReviewTab>
    with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return ListView.builder(
      itemCount: reviewStoreList.length,
      physics: const ScrollPhysics(),
      shrinkWrap: true,
      padding: const EdgeInsets.symmetric(horizontal: Const.margin),
      itemBuilder: (BuildContext context, int index) {
        final _review = reviewStoreList[index];
        return _ReviewCard(review: _review);
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
