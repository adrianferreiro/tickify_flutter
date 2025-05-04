import 'package:tickify_flutter/features/ticket/domain/entities/ticket_entity.dart';
import 'package:tickify_flutter/features/ticket/data/models/ticket_model.dart';

extension TicketMapper on TicketModel {
  TicketEntity toEntity() {
    return TicketEntity(
      id: id,
      name: name,
      surname: surname,
      email: email,
      identifier: identifier,
      attended: attended,
      eventId: eventId,
    );
  }
}

extension TicketModelMapper on TicketEntity {
  TicketModel toModel() {
    return TicketModel(
      id: id,
      name: name,
      surname: surname,
      email: email,
      identifier: identifier,
      attended: attended,
      eventId: eventId,
    );
  }
}
