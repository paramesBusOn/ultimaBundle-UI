part of '../checkout_page.dart';

class _BuildLabelSection extends StatelessWidget {
  const _BuildLabelSection({
    Key? key,
    required this.label,
    required this.onViewAllTap,
    this.trailing,
  }) : super(key: key);

  final String label;
  final String? trailing;
  final VoidCallback onViewAllTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding:const EdgeInsets.symmetric(horizontal: Const.margin),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: theme.textTheme.headline3),
          InkWell(
            onTap: onViewAllTap,
            borderRadius: BorderRadius.circular(Const.radius),
            child: Text(
              trailing ?? AppLocalizations.of(context)!.see_all,
              style: theme.textTheme.subtitle1!
                  .copyWith(color: theme.primaryColor),
            ),
          ),
        ],
      ),
    );
  }
}
