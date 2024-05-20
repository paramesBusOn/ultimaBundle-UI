part of '../payment_success_page.dart';

class PaymentSuccessScreen extends StatelessWidget {
  const PaymentSuccessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    final _mode = Provider.of<ThemeProvider>(context);

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            CustomIcons.done,
            color: (_mode.isDarkTheme == true)
                ? Colors.white
                : _theme.primaryColor,
          ),
          const SizedBox(height: Const.space25 * 2),
          Text(
            AppLocalizations.of(context)!.success,
            style: _theme.textTheme.headline1,
          ),
          const SizedBox(height: Const.space12),
          Text(
            AppLocalizations.of(context)!
                .your_successfully_made_a_payment_enjoy_your_room,
            style: _theme.textTheme.subtitle1,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: Const.space25),
          CustomElevatedButton(
            onTap: () => Get.offAllNamed<dynamic>(LestateRoutes.home),
            label: AppLocalizations.of(context)!.back_to_dashboard,
            margin: const EdgeInsets.symmetric(horizontal: Const.margin),
          )
        ],
      ),
    );
  }
}
