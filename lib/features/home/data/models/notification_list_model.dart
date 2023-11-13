import 'package:Foodlify/features/home/data/models/notification_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'notification_list_model.g.dart';

@JsonSerializable()
class NotificationListModel {
  NotificationListModel({
    required this.body,
  });
  factory NotificationListModel.fromJson(Map<String, dynamic> json) =>
      _$NotificationListModelFromJson(json);

  final List<NotificationModel>? body;

  Map<String, dynamic> toJson() => _$NotificationListModelToJson(this);
}
