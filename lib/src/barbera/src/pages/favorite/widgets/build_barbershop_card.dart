part of '../favorite_page.dart';

class _BuildBarbershopCard extends StatelessWidget {
  final BarbershopModel barbershop;

  const _BuildBarbershopCard({Key? key, required this.barbershop})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);

    return Container(
      width: 200,
      height: 110,
      margin: const EdgeInsets.only(bottom: Const.space15),
      padding: const EdgeInsets.all(Const.space8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Const.radius),
        color: _theme.cardColor,
      ),
      child: InkWell(
        onTap: () => Get.toNamed<dynamic>(
          BarberaRoutes.barbershop,
          arguments: barbershop,
        ),
        borderRadius: BorderRadius.circular(Const.radius),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(Const.radius),
              child: OctoImage(
                width: 80,
                height: 80,
                fit: BoxFit.cover,
                image: CachedNetworkImageProvider(
                  barbershop.images?.first ?? '',
                ),
              ),
            ),
            const SizedBox(width: Const.space12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    barbershop.name ?? '',
                    maxLines: 1,
                    textAlign: TextAlign.left,
                    style: _theme.textTheme.headline4,
                  ),
                  const SizedBox(height: Const.space5),
                  Text(
                    barbershop.address ?? '',
                    maxLines: 1,
                    style: _theme.textTheme.subtitle2?.copyWith(
                      height: 1,
                    ),
                  ),
                  const SizedBox(height: Const.space5),
                  Text(
                    '${barbershop.open} - ${barbershop.close}',
                    maxLines: 1,
                    style: _theme.textTheme.subtitle2,
                  ),
                  const SizedBox(height: Const.space5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.star,
                            color: Colors.amber,
                            size: 14,
                          ),
                          const SizedBox(width: Const.space5),
                          Text(
                            barbershop.rating.toString(),
                            style: _theme.textTheme.subtitle2,
                          )
                        ],
                      ),
                      const SizedBox(width: Const.space25),
                      CustomElevatedButton(
                        onTap: () =>
                            Get.toNamed<dynamic>(BarberaRoutes.bookingService),
                        width: 100,
                        height: 25,
                        labelSize: 10,
                        label: AppLocalizations.of(context)!.book_now,
                      )
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
