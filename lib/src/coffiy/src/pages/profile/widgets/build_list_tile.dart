part of '../profile_page.dart';

class _BuildListTile extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;
  final VoidCallback onTap;

  const _BuildListTile({
    Key? key,
    required this.label,
    required this.value,
    required this.icon,
    required this.onTap,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    final _mode = Provider.of<ThemeProvider>(context);
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(
        horizontal: Const.margin,
        vertical: Const.space5,
      ),
      leading: CircleAvatar(
        radius: 25,
        backgroundColor: _theme.disabledColor.withOpacity(.2),
        child: Icon(
          icon,
          color: (_mode.isDarkTheme == true)
              ? ColorDark.fontTitle
              : ColorLight.fontTitle,
        ),
      ),
      title: Text(label, style: _theme.textTheme.subtitle2),
      subtitle: Text(
        value,
        style: _theme.textTheme.bodyText2,
      ),
      trailing: IconButton(
        onPressed: onTap,
        icon: const Icon(IconlyLight.edit),
      ),
    );
  }
}
