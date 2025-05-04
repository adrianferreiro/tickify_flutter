import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tickify_flutter/features/ticket/data/datasources/ticket_datasource.dart';
import 'package:tickify_flutter/features/ticket/data/datasources/firebase_datasource_impl.dart';

///
/// [ticketDatasourceProvider] expose datasource
///
final ticketDatasourceProvider = Provider<TicketDatasource>((ref) {
  final ticketDatasourceImpl = FirebaseDatasourceImpl();
  return ticketDatasourceImpl;
});
