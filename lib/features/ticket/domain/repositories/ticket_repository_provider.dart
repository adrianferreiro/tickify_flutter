import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tickify_flutter/features/ticket/data/datasources/ticket_datasource_provider.dart';
import 'package:tickify_flutter/features/ticket/data/repositories/ticket_repository_impl.dart';
import 'package:tickify_flutter/features/ticket/domain/repositories/ticket_repository.dart';

///
/// [ticketRepositoryProvider] expose repository with [TicketDatasource] injected
///
final ticketRepositoryProvider = Provider<TicketRepository>((ref) {
  final dataSource = ref.read(ticketDatasourceProvider);
  final pokedexRepositoryImpl = TicketRepositoryImpl(dataSource: dataSource);

  return pokedexRepositoryImpl;
});
