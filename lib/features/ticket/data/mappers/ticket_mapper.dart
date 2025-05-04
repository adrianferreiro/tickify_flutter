import '../../domain/entities/ticket_entity.dart';
import '../models/ticket_model.dart';

extension TicketModelMapper on TicketModel {
  TicketEntity toEntity() => TicketEntity(
    id: id,
    name: name,
    surname: surname,
    email: email,
    identifier: identifier,
    attended: attended,
    eventId: eventId,
  );
}
