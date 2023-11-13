import 'package:Foodlify/features/home/data/models/ticket_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'ticket_list_model.g.dart';

@JsonSerializable()
class TicketListModel {
  TicketListModel({
    required this.body,
  });
  factory TicketListModel.fromJson(Map<String, dynamic> json) =>
      _$TicketListModelFromJson(json);

  final List<TicketModel>? body;

  Map<String, dynamic> toJson() => _$TicketListModelToJson(this);
}
