import 'package:json_annotation/json_annotation.dart';
import 'package:Foodlify/features/account/data/models/delivery_address_model.dart';
part 'address_list_model.g.dart';

@JsonSerializable()
class AddressListModel {
  const AddressListModel({
    required this.body,
  });
  factory AddressListModel.fromJson(Map<String, dynamic> json) =>
      _$AddressListModelFromJson(json);

  final List<DeliveryAddressModel>? body;

  Map<String, dynamic> toJson() => _$AddressListModelToJson(this);
}
