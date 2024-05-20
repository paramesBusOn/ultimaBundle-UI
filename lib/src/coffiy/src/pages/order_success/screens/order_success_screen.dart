part of '../order_success_page.dart';

class CoffiyOrderSuccessScreen extends StatelessWidget {
  const CoffiyOrderSuccessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    final _mode = Provider.of<ThemeProvider>(context);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Const.margin),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              CustomIcons.takeaway,
              color: (_mode.isDarkTheme == true)
                  ? ColorDark.fontTitle
                  : ColorLight.fontTitle,
            ),
            const SizedBox(height: Const.space25 * 2),
            Text(
              AppLocalizations.of(context)!.order_success,
              style: _theme.textTheme.headline1,
            ),
            const SizedBox(height: Const.space12),
            Text(
              AppLocalizations.of(context)!
                  .your_order_has_been_placed_successfully_for_more_details_go_to_my_orders,
              style: _theme.textTheme.subtitle1,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: Const.space25),
            CustomElevatedButton(
              onTap: () => Get.toNamed<dynamic>(CoffiyRoutes.trackOrder),
              label: AppLocalizations.of(context)!.track_my_order,
            )
          ],
        ),
      ),
    );
  }
}
