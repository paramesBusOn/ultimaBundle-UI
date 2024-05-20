import 'package:ultimate_bundle/src/furney/src/helpers/constants.dart';
import 'package:ultimate_bundle/src/furney/src/models/payment_model.dart';

class PaymentList {
  static List<PaymentModel> paymentList = [
    PaymentModel(
      name: 'Cash',
      icon: CustomIcon.cash,
    ),
    PaymentModel(
      name: 'Credit Card',
      icon: CustomIcon.creditCard,
    ),
  ];
}
