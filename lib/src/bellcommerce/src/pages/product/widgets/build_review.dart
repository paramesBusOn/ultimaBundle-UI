part of '../product_page.dart';


class _BuildReview extends StatelessWidget {
  const _BuildReview({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Const.margin),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppLocalizations.of(context)!.reviews,
                style: Theme.of(context).textTheme.headline3,
              ),
              GestureDetector(
                onTap: () => Get.toNamed<dynamic>(BellcommerceRoutes.review),
                child: Text(
                  AppLocalizations.of(context)!.see_all,
                  style: Theme.of(context).textTheme.subtitle1,
                ),
              ),
            ],
          ),
          ListView.builder(
            itemCount: reviewList.length,
            shrinkWrap: true,
            physics: const ScrollPhysics(),
            itemBuilder: (context, index) {
              final _review = reviewList[index];
               return _ReviewCard(review: _review);
            },
          )
        ],
      ),
    );
  }
}
