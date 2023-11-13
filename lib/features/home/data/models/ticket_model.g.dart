// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticket_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TicketModel _$TicketModelFromJson(Map<String, dynamic> json) => TicketModel(
      category: json['category'] as String?,
      status: json['status'] as String?,
      file: json['file'] as String?,
      message: json['message'] as String?,
      ticket_id: json['ticket_id'] as String?,
    );

Map<String, dynamic> _$TicketModelToJson(TicketModel instance) =>
    <String, dynamic>{
      'category': instance.category,
      'status': instance.status,
      'file': instance.file,
      'message': instance.message,
      'ticket_id': instance.ticket_id,
    };
