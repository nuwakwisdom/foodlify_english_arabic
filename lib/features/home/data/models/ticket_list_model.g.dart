// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticket_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TicketListModel _$TicketListModelFromJson(Map<String, dynamic> json) =>
    TicketListModel(
      body: (json['body'] as List<dynamic>?)
          ?.map((e) => TicketModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TicketListModelToJson(TicketListModel instance) =>
    <String, dynamic>{
      'body': instance.body,
    };
