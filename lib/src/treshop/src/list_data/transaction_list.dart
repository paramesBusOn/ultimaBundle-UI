import 'package:ultimate_bundle/src/treshop/src/models/transaction_model.dart';

class TransactionList {
  static List<TransactionModel> transactionList = [
    TransactionModel(
      title: 'Transfer to Bank Central Asia',
      date: DateTime.now(),
      type: TransactionType.transfer,
    ),
    TransactionModel(
      title: 'Top up from to PayPal',
      date: DateTime.now(),
      type: TransactionType.topUp,
    ),
    TransactionModel(
      title: 'Pay with Trecash',
      date: DateTime.now(),
      type: TransactionType.pay,
    ),
  ];
}
