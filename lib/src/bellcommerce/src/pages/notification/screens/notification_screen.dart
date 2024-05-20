part of '../notification_page.dart';

class BellcommerceNotificationScreen extends StatelessWidget {
  const BellcommerceNotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);

    return Scaffold(
      appBar: CustomAppBar(
        context,
        title: AppLocalizations.of(context)!.notifications,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Const.margin),
        child: Column(
          children: [
            ListTile(
              onTap: ()=> Get.toNamed<dynamic>(BellcommerceRoutes.offer),
              contentPadding: EdgeInsets.zero,
              leading: SvgPicture.asset(Assets.offer),
              title: Text(
                AppLocalizations.of(context)!.offers,
                style: _theme.textTheme.bodyText2,
              ),
              trailing: CircleAvatar(
                radius: 12,
                backgroundColor: _theme.primaryColor,
                child: Text(
                  '5',
                  style: _theme.textTheme.subtitle2?.copyWith(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            ListTile(
             onTap: ()=> Get.toNamed<dynamic>(BellcommerceRoutes.feed),
              contentPadding: EdgeInsets.zero,
              leading: SvgPicture.asset(Assets.feed),
              title: Text(
                AppLocalizations.of(context)!.feeds,
                style: _theme.textTheme.bodyText2,
              ),
              trailing: CircleAvatar(
                radius: 12,
                backgroundColor: _theme.primaryColor,
                child: Text(
                  '2',
                  style: _theme.textTheme.subtitle2?.copyWith(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            ListTile(
             onTap: ()=> Get.toNamed<dynamic>(BellcommerceRoutes.activity),
              contentPadding: EdgeInsets.zero,
              leading: SvgPicture.asset(Assets.activity),
              title: Text(
                AppLocalizations.of(context)!.activities,
                style: _theme.textTheme.bodyText2,
              ),
              trailing: CircleAvatar(
                radius: 12,
                backgroundColor: _theme.primaryColor,
                child: Text(
                  '6',
                  style: _theme.textTheme.subtitle2?.copyWith(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
