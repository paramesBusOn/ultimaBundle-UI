part of '../profile_detail_page.dart';

class _BuildListTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;

  const _BuildListTile({
    Key? key,
    required this.icon,
    required this.title,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);

    return ListTile(
      leading: Icon(
        icon,
        color: _theme.primaryColor,
      ),
      title: Text(
        title,
        style: _theme.textTheme.bodyText2,
      ),
      subtitle: Text(
        value,
        style: _theme.textTheme.subtitle2,
      ),
      trailing: const Icon(
        FeatherIcons.chevronRight,
        size: 15,
      ),
    );
  }
}
