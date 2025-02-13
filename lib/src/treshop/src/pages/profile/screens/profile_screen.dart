part of '../profile_page.dart';

class TreshopProfileScreen extends StatelessWidget {
  const TreshopProfileScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: CustomAppBar(
        context,
        enableLeading: false,
        title: AppLocalizations.of(context)!.profile,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: Const.margin),
        children: [
          ListTile(
            contentPadding: EdgeInsets.zero,
            onTap: () => Get.toNamed<dynamic>(TreshopRoutes.profileDetail),
            leading: Icon(FeatherIcons.user, color: theme.hintColor),
            title: AutoSizeText(AppLocalizations.of(context)!.detail_profile,
                style: theme.textTheme.headline3),
            trailing: Icon(FeatherIcons.chevronRight,
                size: 16, color: theme.hintColor),
          ),
          ListTile(
            contentPadding: EdgeInsets.zero,
            onTap: () => Get.toNamed<dynamic>(TreshopRoutes.favorite),
            leading: Icon(FeatherIcons.heart, color: theme.hintColor),
            title: AutoSizeText(AppLocalizations.of(context)!.favorite,
                style: theme.textTheme.headline3),
            trailing: Icon(FeatherIcons.chevronRight,
                size: 16, color: theme.hintColor),
          ),
          ListTile(
            contentPadding: EdgeInsets.zero,
            onTap: () => Get.toNamed<dynamic>(TreshopRoutes.address),
            leading: Icon(FeatherIcons.mapPin, color: theme.hintColor),
            title: AutoSizeText(AppLocalizations.of(context)!.address,
                style: theme.textTheme.headline3),
            trailing: Icon(FeatherIcons.chevronRight,
                size: 16, color: theme.hintColor),
          ),
          ListTile(
            contentPadding: EdgeInsets.zero,
            onTap: () => Get.toNamed<dynamic>(TreshopRoutes.order),
            leading: Icon(FeatherIcons.truck, color: theme.hintColor),
            title: AutoSizeText(AppLocalizations.of(context)!.my_orders,
                style: theme.textTheme.headline3),
            trailing: Icon(FeatherIcons.chevronRight,
                size: 16, color: theme.hintColor),
          ),
          ListTile(
            contentPadding: EdgeInsets.zero,
            onTap: () => Get.toNamed<dynamic>(TreshopRoutes.wallet),
            leading: Icon(FeatherIcons.creditCard, color: theme.hintColor),
            title: AutoSizeText(AppLocalizations.of(context)!.wallet,
                style: theme.textTheme.headline3),
            trailing: Icon(FeatherIcons.chevronRight,
                size: 16, color: theme.hintColor),
          ),
          ListTile(
            contentPadding: EdgeInsets.zero,
            onTap: () => Get.toNamed<dynamic>(TreshopRoutes.coupon),
            leading: Icon(FeatherIcons.gift, color: theme.hintColor),
            title: AutoSizeText(AppLocalizations.of(context)!.my_coupon,
                style: theme.textTheme.headline3),
            trailing: Icon(FeatherIcons.chevronRight,
                size: 16, color: theme.hintColor),
          ),
          ListTile(
            contentPadding: EdgeInsets.zero,
            onTap: () => Get.toNamed<dynamic>(TreshopRoutes.chat),
            leading: Icon(FeatherIcons.messageCircle, color: theme.hintColor),
            title: AutoSizeText(AppLocalizations.of(context)!.chat_with_us,
                style: theme.textTheme.headline3),
            trailing: Icon(FeatherIcons.chevronRight,
                size: 16, color: theme.hintColor),
          ),
          ListTile(
            contentPadding: EdgeInsets.zero,
            onTap: () {},
            leading: Icon(FeatherIcons.sun, color: theme.hintColor),
            title: AutoSizeText(AppLocalizations.of(context)!.dark_mode,
                style: theme.textTheme.headline3),
            trailing: Switch(
              value: themeProvider.isDarkTheme,
              activeColor: theme.primaryColor,
              onChanged: (v) => themeProvider.changeTheme(),
            ),
          ),
          ListTile(
            contentPadding: EdgeInsets.zero,
            onTap: () => Get.toNamed<dynamic>(TreshopRoutes.language),
            leading: Icon(FeatherIcons.globe, color: theme.hintColor),
            title: AutoSizeText(AppLocalizations.of(context)!.change_language,
                style: theme.textTheme.headline3),
            trailing: Icon(FeatherIcons.chevronRight,
                size: 16, color: theme.hintColor),
          ),
          ListTile(
            contentPadding: EdgeInsets.zero,
            onTap: () => Dialogs.showDialogWithLabel(context,
                title: AppLocalizations.of(context)!.are_you_sure_want_to_quit,
                labelButton: AppLocalizations.of(context)!.exit,
                onTapButton: () => Get.offAllNamed<dynamic>(TreshopRoutes.splash)),
            leading: Icon(FeatherIcons.logOut, color: theme.hintColor),
            title: AutoSizeText(AppLocalizations.of(context)!.log_out,
                style: theme.textTheme.headline3),
            trailing: Icon(FeatherIcons.chevronRight,
                size: 16, color: theme.hintColor),
          ),
          ListTile(
            contentPadding: EdgeInsets.zero,
            onTap: () {
            },
            title: AutoSizeText(AppLocalizations.of(context)!.help,
                style: theme.textTheme.headline3),
            trailing: Icon(FeatherIcons.chevronRight,
                size: 16, color: theme.hintColor),
          ),
          ListTile(
            contentPadding: EdgeInsets.zero,
            onTap: () {},
            title: AutoSizeText(AppLocalizations.of(context)!.privacy_policy,
                style: theme.textTheme.headline3),
            trailing: Icon(FeatherIcons.chevronRight,
                size: 16, color: theme.hintColor),
          ),
          ListTile(
            contentPadding: EdgeInsets.zero,
            onTap: () {},
            title: AutoSizeText(AppLocalizations.of(context)!.about_us,
                style: theme.textTheme.headline3),
            trailing: Icon(FeatherIcons.chevronRight,
                size: 16, color: theme.hintColor),
          ),
          ListTile(
            contentPadding: EdgeInsets.zero,
            onTap: () {},
            title: AutoSizeText(AppLocalizations.of(context)!.contact_us,
                style: theme.textTheme.headline3),
            trailing: Icon(FeatherIcons.chevronRight,
                size: 16, color: theme.hintColor),
          ),
        ],
      ),
    );
  }
}
