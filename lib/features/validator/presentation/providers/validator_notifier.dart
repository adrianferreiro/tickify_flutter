import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tickify_flutter/core/models/models.dart';
import 'package:tickify_flutter/features/validator/application/validate_ticket_usecase.dart';
import 'package:tickify_flutter/features/validator/presentation/providers/validator_state.dart';

class ValidatorNotifier extends StateNotifier<ValidatorState> {
  ValidatorNotifier(this.useCase) : super(ValidatorState.initial());

  final ValidateQrUsecase useCase;

  Future<void> validateTicket({required ValidateQrParams params}) async {
    state = state.copyWith(isLoading: true);

    final result = await useCase.call(ValidateQrParams(uid: params.uid));

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
        state = state.copyWith(
          isLoading: false,
          ticket: result.value,
          generalResponse: null,
        );
        break;
    }
  }

  void resetState() {
    state = ValidatorState.initial();
  }
}
