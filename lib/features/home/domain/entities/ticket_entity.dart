// ignore_for_file: non_constant_identifier_names

import 'package:equatable/equatable.dart';

class TicketEntity extends Equatable {
  const TicketEntity({
    this.category,
    this.status,
    this.file,
    this.message,
    this.ticket_id,
  });
  final String? category;
  final String? status;
  final String? file;
  final String? message;
  final String? ticket_id;
  @override
  List<Object?> get props => [
        category,
        status,
        file,
        message,
        ticket_id,
      ];
}
