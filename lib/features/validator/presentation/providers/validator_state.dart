import 'package:tickify_flutter/core/models/general_response_model.dart';
import 'package:tickify_flutter/features/ticket/domain/entities/ticket_entity.dart';

class ValidatorState {
  final bool isLoading;
  final GeneralResponse? generalResponse;
  final TicketEntity? ticket;

  const ValidatorState({
    this.isLoading = false,
    this.generalResponse,
    this.ticket,
  });

  factory ValidatorState.initial() => const ValidatorState();

  ValidatorState copyWith({
    bool? isLoading,
    GeneralResponse? generalResponse,
    TicketEntity? ticket,
  }) {
    return ValidatorState(
      isLoading: isLoading ?? this.isLoading,
      generalResponse: generalResponse ?? this.generalResponse,
      ticket: ticket ?? this.ticket,
    );
  }
}
