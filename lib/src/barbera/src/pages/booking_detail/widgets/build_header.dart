part of '../booking_detail_page.dart';

class _BuildHeader extends StatelessWidget {
  const _BuildHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);

    return Container(
      width: Screens.width(context),
      padding: const EdgeInsets.symmetric(
        horizontal: Const.margin,
        vertical: Const.space15,
      ),
      decoration: BoxDecoration(
        color: _theme.primaryColor,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(Const.radius),
          bottomRight: Radius.circular(Const.radius),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: OctoImage(
                  image: const CachedNetworkImageProvider(
                    'https://i.pinimg.com/564x/1a/25/b8/1a25b89ceef860374ee251d941b3fb09.jpg',
                  ),
                  fit: BoxFit.cover,
                  width: 100,
                  height: 100,
                ),
              ),
              const SizedBox(width: Const.space15),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            'Gentleman Barbershop',
                            style: _theme.textTheme.headline4
                                ?.copyWith(color: Colors.white),
                            textAlign: TextAlign.left,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                        ),
                        Row(
                          children: [
                            const Icon(Icons.star, color: Colors.yellow),
                            Text(
                              '4.0',
                              style: _theme.textTheme.subtitle1
                                  ?.copyWith(color: Colors.white),
                            ),
                          ],
                        )
                      ],
                    ),
                    const SizedBox(height: Const.space8),
                    Text(
                      '288 McClure Court, Arkansas',
                      style: _theme.textTheme.subtitle2
                          ?.copyWith(color: Colors.white),
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.location_on,
                          color: Colors.white,
                          size: 12,
                        ),
                        Text(
                          '21 km',
                          style: _theme.textTheme.subtitle2
                              ?.copyWith(color: Colors.white),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          'Booking number: ',
                          style: _theme.textTheme.subtitle2
                              ?.copyWith(color: Colors.white),
                        ),
                        Text(
                          'LKAD24SK',
                          style: _theme.textTheme.subtitle2
                              ?.copyWith(color: Colors.white),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
          const SizedBox(height: Const.space8),
          Container(
            width: Screens.width(context),
            height: 50,
            decoration: BoxDecoration(
              color: _theme.backgroundColor,
              borderRadius: BorderRadius.circular(25),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.date_range, color: _theme.primaryColor),
                const SizedBox(width: Const.space15),
                Text(
                  'Friday, 25 August 2019 @ 8:30am',
                  style: _theme.textTheme.subtitle2,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
