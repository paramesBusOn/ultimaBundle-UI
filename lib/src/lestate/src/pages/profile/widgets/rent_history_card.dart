part of '../profile_page.dart';

class _RentHistoryCard extends StatelessWidget {
  const _RentHistoryCard({
    Key? key,
    required this.rent,
  }) : super(key: key);

  final RentHistoryModel rent;

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    return Card(
      margin: const EdgeInsets.only(bottom: Const.space15),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Const.radius),
      ),
      child: Container(
        padding: const EdgeInsets.all(Const.space8),
        child: Row(
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Const.radius),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: CachedNetworkImageProvider(rent.estate?.image ?? ''),
                ),
              ),
            ),
            const SizedBox(width: Const.space12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    rent.estate?.name ?? '',
                    maxLines: 1,
                    style: _theme.textTheme.headline3,
                  ),
                  const SizedBox(height: Const.space8),
                  Row(
                    children: [
                      Icon(
                        IconlyBold.location,
                        color: _theme.disabledColor,
                        size: 15,
                      ),
                      const SizedBox(width: Const.space8),
                      Expanded(
                        child: Text(
                          rent.estate?.location ?? '',
                          style: _theme.textTheme.subtitle2,
                          maxLines: 1,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: Const.space8),
                  Divider(color: _theme.primaryColor),
                  const SizedBox(height: Const.space8),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  AppLocalizations.of(context)!.check_in,
                                  style: _theme.textTheme.bodyText2,
                                ),
                                const SizedBox(width: Const.space5),
                                const Icon(
                                  IconlyBold.arrowUp,
                                  color: Colors.green,
                                  size: 15,
                                ),
                              ],
                            ),
                            const SizedBox(height: Const.space5),
                            Text(
                              DateFormat('dd/mm/yyyy').format(rent.checkIn!),
                              style: _theme.textTheme.subtitle1,
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  AppLocalizations.of(context)!.check_out,
                                  style: _theme.textTheme.bodyText2,
                                ),
                                const SizedBox(width: Const.space5),
                                const Icon(
                                  IconlyBold.arrowDown,
                                  color: Colors.red,
                                  size: 15,
                                ),
                              ],
                            ),
                            const SizedBox(height: Const.space5),
                            Text(
                              DateFormat('dd/mm/yyyy').format(rent.checkOut!),
                              style: _theme.textTheme.subtitle1,
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
