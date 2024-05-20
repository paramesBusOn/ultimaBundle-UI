part of '../product_page.dart';

class _ReviewCard extends StatelessWidget {
  final ReviewModel review;

  const _ReviewCard({
    Key? key,
    required this.review,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);

    return Column(
      children: [
        ListTile(
          contentPadding: EdgeInsets.zero,
          leading: CircleAvatar(
            radius: 25,
            backgroundImage: CachedNetworkImageProvider(
              review.user?.image ?? '',
            ),
            backgroundColor: _theme.disabledColor,
          ),
          title: Text(
            review.user?.name ?? '',
            style: _theme.textTheme.bodyText1,
          ),
          subtitle: Row(
            children: [
              SmoothStarRating(
                color: Colors.yellow[700],
                spacing: 1,
                rating: review.rating ?? 0,
                size: 16,
                borderColor: _theme.disabledColor,
              ),
              const SizedBox(width: Const.space8),
              Text(
                review.rating.toString(),
                style: _theme.textTheme.subtitle2,
              ),
            ],
          ),
          trailing: IconButton(
            onPressed: () {
              showModalBottomSheet<dynamic>(
                backgroundColor: _theme.backgroundColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(Const.radius),
                ),
                context: context,
                builder: (context) {
                  return Container(
                    height: 100,
                  );
                },
              );
            },
            icon: const Icon(Icons.more_vert),
          ),
        ),
        Text(
          review.comment ?? '',
          style: _theme.textTheme.bodyText2,
        ),
        const SizedBox(height: Const.space8),
        Row(
          children: review.screenshoots!
              .map(
                (e) => Padding(
                  padding: const EdgeInsets.only(right: Const.space12),
                  child: InkWell(
                    onTap: () => Get.toNamed<dynamic>(
                      BellcommerceRoutes.photoListView,
                      arguments: review.screenshoots,
                    ),
                    borderRadius: BorderRadius.circular(Const.radius),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(Const.radius),
                      child: OctoImage(
                        width: 75,
                        height: 75,
                        image: CachedNetworkImageProvider(e),
                      ),
                    ),
                  ),
                ),
              )
              .toList(),
        )
      ],
    );
  }
}
