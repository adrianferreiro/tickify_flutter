import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tickify_flutter/features/events/data/datasources/event_datasource_provider.dart';
import 'package:tickify_flutter/features/events/data/repositories/event_repository_impl.dart';
import 'package:tickify_flutter/features/events/domain/repositories/event_repository.dart';

///
/// [eventRepositoryProvider] expose repository with [EventDatasource] injected
///
final eventRepositoryProvider = Provider<EventRepository>((ref) {
  final dataSource = ref.read(eventDatasourceProvider);
  final eventRepositoryImpl = EventRepositoryImpl(dataSource: dataSource);

  return eventRepositoryImpl;
});
