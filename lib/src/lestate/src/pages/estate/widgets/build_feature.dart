part of '../estate_page.dart';

class _BuildFeature extends StatelessWidget {
  final String icon;
  final String value;

  const _BuildFeature({
    Key? key,
    required this.icon,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);

    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            color: _theme.primaryColor.withOpacity(.1),
            borderRadius: BorderRadius.circular(Const.radius)
          ),
          padding: const EdgeInsets.all(Const.space8),
          child: SvgPicture.asset(
            icon,
            width: 17,
            color: _theme.primaryColor,
          ),
        ),
        const SizedBox(width: Const.space5),
        Text(value, style: _theme.textTheme.bodyText2)
      ],
    );
  }
}
