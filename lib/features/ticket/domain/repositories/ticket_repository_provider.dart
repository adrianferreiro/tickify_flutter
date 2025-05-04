import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tickify_flutter/features/ticket/domain/repositories/ticket_repository.dart';

///
/// [ticketRepositoryProvider] expose repository with [TicketDatasource] injected
///
final ticketRepositoryProvider = Provider<TicketRepository>((ref) {
  final dataSource = ref.read(pokedexDatasourceProvider);
  final pokedexRepositoryImpl = PokedexRepositoryImpl(dataSource: dataSource);

  return pokedexRepositoryImpl;
});
