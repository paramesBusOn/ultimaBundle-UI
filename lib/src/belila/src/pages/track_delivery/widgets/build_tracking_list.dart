part of '../track_delivery_page.dart';

class _BuildTrackingList extends StatelessWidget {
  final int orderId;

  const _BuildTrackingList({
    Key? key,
    required this.orderId,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);

    return Expanded(
      child: ListView.builder(
        itemCount: trackingList.length,
        physics: const ScrollPhysics(),
        itemBuilder: (context, index) {
          // final _data = trackingList.reserved.toList()[index];
          final _data = trackingList.reversed.toList()[index];
          return SizedBox(
            width: double.infinity,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 50,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CircleAvatar(
                        radius: 10,
                        backgroundColor: (index == 0)
                            ? _theme.primaryColor
                            : _theme.disabledColor,
                      ),
                      Container(
                        width: 2,
                        height: 50,
                        decoration: BoxDecoration(
                          color: _theme.disabledColor,
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: SizedBox(
                    height: 60,
                    child: Text(
                      _data.desc ?? '',
                      style: _theme.textTheme.subtitle1?.copyWith(
                        color: (index == 0) ? _theme.primaryColor : null,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 100,
                  child: Text(
                    _data.date ?? '',
                    textAlign: TextAlign.end,
                    style: _theme.textTheme.subtitle2,
                  ),
                ),
                const SizedBox(width: 18),
              ],
            ),
          );
        },
      ),
    );
  }
}
