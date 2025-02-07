part of '../checkout_page.dart';

class TreshopCheckoutScreen extends StatefulWidget {
  const TreshopCheckoutScreen({Key? key}) : super(key: key);
  @override
  _TreshopCheckoutScreenState createState() => _TreshopCheckoutScreenState();
}

class _TreshopCheckoutScreenState extends State<TreshopCheckoutScreen> {
  CheckoutModel? checkout;
  final bool _isLoading = false;
  int? _priceTotal = 0;
  final int _total = 1198;
  double? _discount;
  int? _couponId;

  @override
  void initState() {
    super.initState();
    checkout = Get.arguments as CheckoutModel;
    final price = checkout!.products!.map((e) => e.price).toList();
    _priceTotal = price.fold(0, (p, c) => p! + c!);
    _couponId = checkout!.couponId;
    if (_couponId == null) {
      _discount = 0;
    } else {
      _discount = _priceTotal! *
          (CouponList.couponList[checkout!.couponId!].discount! / 100);
    }
  }


  @override
  Widget build(BuildContext context) {
        return Scaffold(
          appBar: CustomAppBar(
            context,
            title: AppLocalizations.of(context)!.checkout,
          ),
          body: Column(
            children: [
              Expanded(
                child: ListView(
                  children: [
                    const _BuildAddress(),
                    const SizedBox(height: Const.space15),
                    _BuildProducts(checkout: checkout),
                    const SizedBox(height: Const.space15),
                    _BuildPaymentMethod(),
                    const SizedBox(height: Const.space15),
                    _BuildDeliveryMethod(),
                    const SizedBox(height: Const.space15),
                  ],
                ),
              ),
              _FooterSection(
                couponId: _couponId,
                checkout: checkout,
                discount: _discount,
                priceTotal: _priceTotal,
                total: _total,
                isLoading: _isLoading,
              ),
            ],
          ),
        );
  }
}
