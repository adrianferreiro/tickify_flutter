import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tickify_flutter/core/models/models.dart';
import 'package:tickify_flutter/features/ticket/application/usecases/validate_ticket_usecase.dart';
import 'package:tickify_flutter/features/validator/presentation/providers/validator_state.dart';

class ValidatorNotifier extends StateNotifier<ValidatorState> {
  ValidatorNotifier(this.useCase) : super(ValidatorState.initial());

  final ValidateTicketUsecase useCase;

  Future<void> validateTicket({required ValidateTicketParams params}) async {
    state = state.copyWith(isLoading: true);

    final result = await useCase.call(ValidateTicketParams(uid: params.uid));

    switch (result) {
      case Left():
        state = state.copyWith(
          isLoading: false,
          generalResponse: GeneralResponse(
            ok: false,
            message: result.value.message!,
          ),
          ticket: null,
        );
        break;
      case Right():
        state = state.copyWith(isLoading: false, ticket: result.value);
        break;
    }
  }
}
