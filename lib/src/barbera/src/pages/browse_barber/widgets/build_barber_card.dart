part of '../browse_barber_page.dart';

class _BuildBarberCard extends StatelessWidget {
  const _BuildBarberCard({
    Key? key,
    required this.barber,
  }) : super(key: key);

  final BarberModel barber;

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    return Container(
      width: 80,
      margin: const EdgeInsets.only(right: Const.space12),
      child: InkWell(
        onTap: () => Get.toNamed<dynamic>(BarberaRoutes.barber, arguments: barber),
        borderRadius: BorderRadius.circular(Const.radius),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                border: Border.all(
                  color: _theme.primaryColor,
                  width: 2,
                ),
                shape: BoxShape.circle,
              ),
              child: CircleAvatar(
                radius: 35,
                backgroundColor: _theme.cardColor,
                backgroundImage: CachedNetworkImageProvider(
                  barber.photo ?? '',
                ),
              ),
            ),
            const SizedBox(height: Const.space8),
            Text(
              barber.name ?? '',
              style: _theme.textTheme.bodyText2,
              maxLines: 1,
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
