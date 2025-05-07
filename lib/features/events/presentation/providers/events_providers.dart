import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tickify_flutter/features/events/application/usecases/get_all_events_usecase.dart';
import 'package:tickify_flutter/features/events/presentation/providers/events_notifier.dart';
import 'package:tickify_flutter/features/events/presentation/providers/events_state.dart';

///
/// [eventsProvider] expose notifier with [GetAllEventsUsecase] injected
///
final eventsProvider = StateNotifierProvider<EventsNotifier, EventsState>((
  ref,
) {
  final useCase = ref.read(getAllEventsUsecaseProvider);

  return EventsNotifier(useCase);
});
