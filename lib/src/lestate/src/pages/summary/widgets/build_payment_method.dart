part of '../summary_page.dart';

class _BuildPaymentMethod extends StatelessWidget {
  const _BuildPaymentMethod({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Const.margin),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppLocalizations.of(context)!.payment_method,
            style: _theme.textTheme.headline3,
          ),
          const SizedBox(height: Const.space12),
          Container(
            width: double.infinity,
            height: 45,
            padding: const EdgeInsets.symmetric(horizontal: Const.margin),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Const.radius),
              border: Border.all(color: _theme.disabledColor),
            ),
            child: Row(
              children: [
                SvgPicture.asset(
                  CustomIcons.creditCard,
                  width: 35,
                ),
                const SizedBox(width: Const.space12),
                Text(
                  AppLocalizations.of(context)!.credit_card,
                  style: _theme.textTheme.bodyText2,
                ),
                const Spacer(),
                Icon(
                  Icons.arrow_forward_ios,
                  color: _theme.disabledColor,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
