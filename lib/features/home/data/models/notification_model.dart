import 'package:Foodlify/features/home/domain/entities/notificationn_entity.dart';
import 'package:json_annotation/json_annotation.dart';
part 'notification_model.g.dart';

@JsonSerializable()
class NotificationModel extends NotificationnEntities {
  const NotificationModel({
    super.id,
    super.title,
    super.content,
    super.timestamp,
    super.viewed,
  });
  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      _$NotificationModelFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationModelToJson(this);
}
