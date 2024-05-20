part of '../cart_page.dart';

class _OrderConfirmationScreen extends StatefulWidget {
  const _OrderConfirmationScreen({Key? key}) : super(key: key);

  @override
  __OrderConfirmationScreenState createState() =>
      __OrderConfirmationScreenState();
}

class __OrderConfirmationScreenState extends State<_OrderConfirmationScreen> {
  int _selectedPayment = 0;
  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    final _mode = Provider.of<ThemeProvider>(context);

    return Column(
      children: [
        Expanded(
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: Const.margin),
            children: [
              const SizedBox(height: Const.space25 * 2),
              Align(
                child: Container(
                  width: 50,
                  height: 5,
                  decoration: BoxDecoration(
                    color: _theme.disabledColor,
                    borderRadius: BorderRadius.circular(Const.radius),
                  ),
                ),
              ),
              const SizedBox(height: Const.space25),
              Text(
                AppLocalizations.of(context)!.order_confirmation,
                style: _theme.textTheme.headline1,
                textAlign: TextAlign.left,
              ),
              const SizedBox(height: Const.space25 * 2),
              Text(
                AppLocalizations.of(context)!.delivery_address,
                style: _theme.textTheme.headline3,
                textAlign: TextAlign.left,
              ),
              const SizedBox(height: Const.space12),
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: Container(
                  width: 50,
                  height: 50,
                  padding: const EdgeInsets.all(Const.space12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Const.radius),
                    color: _theme.disabledColor.withOpacity(.2),
                  ),
                  child: SvgPicture.asset(
                    CustomIcons.delivery,
                    color: (_mode.isDarkTheme == true)
                        ? ColorDark.fontTitle
                        : ColorLight.fontTitle,
                  ),
                ),
                title: Text(
                  'Jessica Veranda',
                  style: _theme.textTheme.headline4,
                ),
                subtitle: Text(
                  '3973 Pickens Way, Longview, Texas, 75601',
                  style: _theme.textTheme.subtitle2,
                ),
                trailing: IconButton(
                  onPressed: () {},
                  icon: const Icon(IconlyLight.edit),
                ),
              ),
              const SizedBox(height: Const.space25),
              Text(
                AppLocalizations.of(context)!.payment_method,
                style: _theme.textTheme.headline3,
                textAlign: TextAlign.left,
              ),
              const SizedBox(height: Const.space12),
              Column(
                children: paymentList
                    .asMap()
                    .entries
                    .map(
                      (e) => Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(Const.radius),
                          color: _theme.disabledColor.withOpacity(.2),
                        ),
                        margin: const EdgeInsets.only(bottom: Const.space12),
                        child: RadioListTile(
                          value: e.key,
                          groupValue: _selectedPayment,
                          activeColor: _theme.primaryColor,
                          onChanged: (int? v) {
                            setState(() => _selectedPayment = v!);
                          },
                          title: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  e.value.name ?? '',
                                  style: _theme.textTheme.headline3,
                                ),
                              ),
                              SvgPicture.asset(
                                e.value.icon ?? '',
                                width: 50,
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
              const SizedBox(height: Const.space25),
              Text(
                AppLocalizations.of(context)!.transaction_details,
                style: _theme.textTheme.headline3,
                textAlign: TextAlign.left,
              ),
              const SizedBox(height: Const.space12),
              _BuildTransactionTile(
                label: AppLocalizations.of(context)!.sub_total,
                value: 15,
              ),
              const SizedBox(height: Const.space8),
              _BuildTransactionTile(
                label: '${AppLocalizations.of(context)!.tax} (10%)',
                value: 2,
              ),
              const SizedBox(height: Const.space8),
              _BuildTransactionTile(
                label: AppLocalizations.of(context)!.delivery_fee,
                value: 2,
              ),
              const SizedBox(height: Const.space25),
            ],
          ),
        ),
        const _BuildFooterDialog(),
        const SizedBox(height: Const.space25),
      ],
    );
  }
}
