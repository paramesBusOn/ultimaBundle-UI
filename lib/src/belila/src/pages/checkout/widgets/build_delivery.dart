part of '../checkout_page.dart';

class _BuildDelivery extends StatefulWidget {
  const _BuildDelivery({Key? key}) : super(key: key);

  @override
  State<_BuildDelivery> createState() => _BuildDeliveryState();
}

class _BuildDeliveryState extends State<_BuildDelivery> {
  String _selectedShipping = 'Regular';

  final List<String> _shippingServiceList = [
    'Regular',
    'Instant',
    'Cargo',
  ];
  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);

    return Column(
      children: [
        _BuildLabelSection(
          label: AppLocalizations.of(context)!.shipping_service,
          trailing: '',
          onViewAllTap: () {},
        ),
        const SizedBox(height: Const.space12),
        Column(
          children: _shippingServiceList
              .asMap()
              .entries
              .map(
                (e) => RadioListTile(
                  value: e.value,
                  groupValue: _selectedShipping,
                  activeColor: _theme.primaryColor,
                  title: Text(e.value, style: _theme.textTheme.bodyText2),
                  onChanged: (String? v) {
                    setState(() {
                      _selectedShipping = v!;
                    });
                  },
                ),
              )
              .toList(),
        )
      ],
    );
  }
}
