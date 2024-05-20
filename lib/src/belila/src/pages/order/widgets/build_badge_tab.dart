part of '../order_page.dart';

class _BuildBadgeTab extends StatelessWidget {
  final String label;
  final int value;

  const _BuildBadgeTab({
    Key? key,
    required this.label,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);

    return Row(
      children: [
        Text(
          label,
          style: _theme.textTheme.headline4,
        ),
        if (value == 0)
          const SizedBox()
        else
          const SizedBox(width: Const.space5),
        if (value == 0)
          const SizedBox()
        else
          CircleAvatar(
            radius: 10,
            backgroundColor: _theme.primaryColor,
            child: Text(
              (value == 0) ? '' : value.toString(),
              style: _theme.textTheme.bodyText2?.copyWith(
                color: Colors.white,
              ),
            ),
          )
      ],
    );
  }
}
