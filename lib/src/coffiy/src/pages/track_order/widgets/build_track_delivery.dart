part of '../track_order_page.dart';


class _BuildTrackDelivery extends StatelessWidget {
  const _BuildTrackDelivery({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      child: Container(
        padding: const EdgeInsets.all(Const.margin),
        decoration:  BoxDecoration(
          color: _theme.backgroundColor,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(Const.radius),
            topRight: Radius.circular(Const.radius),
          ),
        ),
        child: Column(
          children: trackOrderList
              .map(
                (e) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: CircleAvatar(
                        radius: 25,
                        backgroundColor: _theme.primaryColor,
                        child: SvgPicture.asset(
                          e.icon ?? '',
                          color: Colors.white,
                        ),
                      ),
                      title: Text(e.title ?? '',
                          style: _theme.textTheme.headline3),
                      subtitle: Text(e.subtitle ?? '',
                          style: _theme.textTheme.subtitle2),
                    ),
                    if (e.isLast == true)
                      const SizedBox()
                    else
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: Const.space15,
                          vertical: Const.space8,
                        ),
                        child: Column(
                          children: [
                            CircleAvatar(
                              radius: 5,
                              backgroundColor: _theme.disabledColor,
                            ),
                            const SizedBox(height: Const.space5),
                            CircleAvatar(
                              radius: 5,
                              backgroundColor: _theme.disabledColor,
                            ),
                            const SizedBox(height: Const.space5),
                            CircleAvatar(
                              radius: 5,
                              backgroundColor: _theme.disabledColor,
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
