import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tickify_flutter/core/models/models.dart';
import 'package:tickify_flutter/features/events/application/usecases/get_all_events_usecase.dart';
import 'package:tickify_flutter/features/events/presentation/providers/events_state.dart';

class EventsNotifier extends StateNotifier<EventsState> {
  EventsNotifier(this.useCase) : super(EventsState.initial()) {
    getAllEvents();
  }

  final GetAllEventsUsecase useCase;

  Future<void> getAllEvents() async {
    state = state.copyWith(isLoading: true);

    final result = await useCase.call(NoParams());

    switch (result) {
      case Left():
        state = state.copyWith(
          isLoading: false,
          generalResponse: GeneralResponse(
            ok: false,
            message: result.value.message!,
          ),
          events: null,
        );
        break;
      case Right():
        state = state.copyWith(
          isLoading: false,
          generalResponse: null,
          events: result.value,
        );
        break;
    }
  }

  void resetState() {
    state = EventsState.initial();
  }
}
