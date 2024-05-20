part of '../social_network_sign_in_page.dart';

class _BuildBody extends StatelessWidget {
  const _BuildBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);

    return Positioned.fill(
      bottom: 260,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(Const.radius),
            child: SvgPicture.asset(
              Assets.logo,
              width: 75,
            ),
          ),
          const SizedBox(height: Const.space25),
          Text(
            AppLocalizations.of(context)!.welcome_to_barbara,
            textAlign: TextAlign.center,
            style: _theme.textTheme.headline1?.copyWith(
              color: _theme.primaryColor,
              fontSize: 25,
            ),
          ),
          const SizedBox(height: Const.space12),
          Text(
            AppLocalizations.of(context)!
                .we_will_help_find_order_and_buy_barbershop_products_and_services_at_your_location,
            textAlign: TextAlign.center,
            style: _theme.textTheme.subtitle1?.copyWith(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
