import 'package:equatable/equatable.dart';

class NotificationnEntities extends Equatable {
  const NotificationnEntities({
    this.id,
    this.title,
    this.content,
    this.timestamp,
    this.viewed,
  });
  final int? id;
  final String? title;
  final String? content;
  final String? timestamp;
  final bool? viewed;
  @override
  List<Object?> get props => [
        id,
        title,
        content,
        timestamp,
        viewed,
      ];
}
