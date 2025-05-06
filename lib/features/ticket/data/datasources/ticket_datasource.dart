import 'package:tickify_flutter/features/ticket/data/models/ticket_model.dart';

abstract class TicketDatasource {
  Future<TicketModel> validateTicket(String ticketId);
}
