// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificationListModel _$NotificationListModelFromJson(
        Map<String, dynamic> json) =>
    NotificationListModel(
      body: (json['body'] as List<dynamic>?)
          ?.map((e) => NotificationModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$NotificationListModelToJson(
        NotificationListModel instance) =>
    <String, dynamic>{
      'body': instance.body,
    };
