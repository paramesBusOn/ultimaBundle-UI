part of '../nearby_page.dart';

class _BuildBarbershopCard extends StatelessWidget {
final BarbershopModel barbershop;

  const _BuildBarbershopCard({Key? key,required this.barbershop}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    
    return Container(
      width: 200,
      margin: const EdgeInsets.only(right: Const.space15),
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(Const.radius),
              child: OctoImage(
                width: 200,
                height: 130,
                fit: BoxFit.cover,
                image: CachedNetworkImageProvider(
                  barbershop.images?.first ?? '',
                ),
              ),
            ),
            const SizedBox(height: Const.space12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    barbershop.name ?? '',
                    maxLines: 1,
                    textAlign: TextAlign.left,
                    style: _theme.textTheme.headline4,
                  ),
                ),
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
                )
              ],
            ),
            const SizedBox(height: Const.space5),
            Text(
              barbershop.address ?? '',
              maxLines: 1,
              style: _theme.textTheme.subtitle2,
            ),
          ],
        ),
      ),
    );
  }
}
