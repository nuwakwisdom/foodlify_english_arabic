import 'package:Foodlify/features/home/data/models/order_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'order_list_model.g.dart';

@JsonSerializable()
class OrdersListModel {
  OrdersListModel({
    required this.body,
  });
  factory OrdersListModel.fromJson(Map<String, dynamic> json) =>
      _$OrdersListModelFromJson(json);

  final List<OrderModel>? body;

  Map<String, dynamic> toJson() => _$OrdersListModelToJson(this);
}
