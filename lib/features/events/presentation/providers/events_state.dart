import 'package:tickify_flutter/core/models/general_response_model.dart';
import 'package:tickify_flutter/features/events/domain/entities/event_entity.dart';

class EventsState {
  final bool isLoading;
  final GeneralResponse? generalResponse;
  final List<EventEntity>? events;

  const EventsState({
    this.isLoading = false,
    this.generalResponse,
    this.events,
  });

  factory EventsState.initial() => const EventsState();

  EventsState copyWith({
    bool? isLoading,
    GeneralResponse? generalResponse,
    List<EventEntity>? events,
  }) {
    return EventsState(
      isLoading: isLoading ?? this.isLoading,
      generalResponse: generalResponse ?? this.generalResponse,
      events: events ?? this.events,
    );
  }
}
