part of '../profile_page.dart';

class _BuildTitleAddress extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AutoSizeText(
          AppLocalizations.of(context)!.address,
          style: theme.textTheme.headline3,
        ),
        InkWell(
          onTap: () => Get.toNamed<dynamic>(FurneyRoutes.addAddress),
          highlightColor: theme.hintColor,
          child: AutoSizeText(
            AppLocalizations.of(context)!.new_address.toUpperCase(),
            style: theme.textTheme.bodyText2,
          ),
        ),
      ],
    );
  }
}
