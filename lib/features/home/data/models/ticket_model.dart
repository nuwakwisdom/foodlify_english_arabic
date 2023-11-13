// ignore_for_file: non_constant_identifier_names

import 'package:Foodlify/features/home/domain/entities/ticket_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'ticket_model.g.dart';

@JsonSerializable()
class TicketModel extends TicketEntity {
  const TicketModel({
    super.category,
    super.status,
    super.file,
    super.message,
    super.ticket_id,
  });
  factory TicketModel.fromJson(Map<String, dynamic> json) =>
      _$TicketModelFromJson(json);

  Map<String, dynamic> toJson() => _$TicketModelToJson(this);
}
