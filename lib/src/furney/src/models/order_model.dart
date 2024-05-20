
import 'package:ultimate_bundle/src/furney/src/models/product_model.dart';

enum OrderStatus { pending, onDelivery, complete }

class OrderModel {
  final ProductModel? product;
  final OrderStatus orderStatus;

  OrderModel({this.product, this.orderStatus = OrderStatus.pending});
}
