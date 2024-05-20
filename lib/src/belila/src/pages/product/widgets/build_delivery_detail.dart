part of '../product_page.dart';

class _BuildDeliveryDetail extends StatelessWidget {
  const _BuildDeliveryDetail({
    Key? key,
    required this.shippingCost,
  }) : super(key: key);

  final List<ProductShippingCostModel>? shippingCost;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    String _shippingMethodName(String val) {
      switch (val) {
        case 'JTR':
          return 'JNE Trucking';
        case 'JTR250':
          return 'JNE Trucking 250';
        case 'JTR<150':
          return 'JNE Trucking < 150';
        case 'JTR>250':
          return 'JNE Trucking > 250';
        case 'OKE':
          return 'JNE OKE';
        case 'REG':
          return 'JNE Reguler';
        case 'SPS':
          return 'JNE SPS';
        case 'YES':
          return 'JNE YES';
        case 'CTC':
          return 'JNE Intracity';
        case 'CTC+':
          return 'JNE Intracity+';
        case 'COD':
          return 'Cash On Delivery';
        default:
          return '';
      }
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppLocalizations.of(context)!.delivery_details,
          style: Theme.of(context).textTheme.headline3,
        ),
        Theme(
          data: theme.copyWith(dividerColor: Colors.transparent),
          child: ExpansionTile(
            tilePadding: EdgeInsets.zero,
            expandedCrossAxisAlignment: CrossAxisAlignment.end,
            collapsedIconColor: theme.primaryColor,
            iconColor: theme.primaryColor,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _shippingMethodName(shippingCost?.first.serviceDisplay ?? ''),
                  style: theme.textTheme.bodyText2,
                ),
                Text(
                  NumberFormat.currency(
                    symbol: 'Rp. ',
                    decimalDigits: 0,
                  ).format(shippingCost?.first.price),
                  style: theme.textTheme.bodyText1,
                ),
              ],
            ),
            subtitle: Text(
              // ignore: lines_longer_than_80_chars
              '${AppLocalizations.of(context)!.estimation}${' ${shippingCost?.first.etdFrom} - ${shippingCost?.first.etdThru} '}${shippingCost?.first.times == 'H' ? AppLocalizations.of(context)!.hours : AppLocalizations.of(context)!.day}',
              style: theme.textTheme.subtitle2,
            ),
            children: shippingCost!
                .map((e) => ListTile(
                      title: Text(
                        _shippingMethodName(e.serviceDisplay ?? ''),
                        style: theme.textTheme.bodyText2,
                      ),
                      subtitle: Text(
                        // ignore: lines_longer_than_80_chars
                        '${AppLocalizations.of(context)!.estimation}${' ${e.etdFrom} - ${e.etdThru} '}${e.times == 'H' ? AppLocalizations.of(context)!.hours : AppLocalizations.of(context)!.day}',
                        style: theme.textTheme.subtitle2,
                      ),
                      trailing: Text(
                        NumberFormat.currency(
                          symbol: 'Rp. ',
                          decimalDigits: 0,
                        ).format(e.price),
                        style: theme.textTheme.bodyText1,
                      ),
                    ))
                .toList(),
          ),
        )
      ],
    );
  }
}
