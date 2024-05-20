part of '../setting_page.dart';


class _BuildSwitchTile extends StatelessWidget {
  const _BuildSwitchTile({
    Key? key,
    required this.value,
    required this.label,
    required this.onChanged,
  }) : super(key: key);

  final bool value;
  final String label;
  final ValueChanged<bool>? onChanged;

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: _theme.textTheme.bodyText2,
        ),
        Switch(
          value: value,
          activeColor: _theme.primaryColor,
          onChanged: onChanged,
        ),
      ],
    );
  }
}
