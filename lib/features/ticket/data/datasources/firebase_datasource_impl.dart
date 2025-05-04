import 'package:tickify_flutter/features/ticket/data/datasources/ticket_datasource.dart';
import 'package:tickify_flutter/features/ticket/data/models/ticket_model.dart';

class FirebaseDatasourceImpl extends TicketDatasource {
  @override
  Future<TicketModel> validateTicket(String ticketId) {
    // TODO: implement validateTicket
    throw UnimplementedError();
  }
}
