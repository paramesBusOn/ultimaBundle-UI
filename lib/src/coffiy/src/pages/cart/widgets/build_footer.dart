part of '../cart_page.dart';

class _BuildFooter extends StatelessWidget {
  const _BuildFooter({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: Const.margin),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppLocalizations.of(context)!.total_price,
                  style: _theme.textTheme.subtitle1,
                ),
                const SizedBox(height: Const.space5),
                Text(
                  NumberFormat.currency(
                    symbol: r'$',
                  ).format(25),
                  style: _theme.textTheme.headline1,
                ),
              ],
            ),
          ),
          Expanded(
            child: CustomElevatedButton(
              onTap: () {
                showDialog<dynamic>(
      context: context,
      builder: (context) {
       return _OrderConfirmationScreen();
      });

                // <dynamic>(
                //   context: context,
                //   shape: RoundedRectangleBorder(
                //     borderRadius: BorderRadius.circular(25),
                //   ),
                //   builder: (BuildContext context) => const _OrderConfirmationScreen(),
                // );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    IconlyBroken.buy,
                    color: Colors.white,
                  ),
                  const SizedBox(width: Const.space15),
                  Text(
                    AppLocalizations.of(context)!.checkout,
                    style: _theme.textTheme.button,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
