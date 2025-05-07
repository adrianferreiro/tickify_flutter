import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tickify_flutter/features/ticket/application/usecases/validate_ticket_usecase.dart';
import 'package:tickify_flutter/features/validator/presentation/providers/validator_notifier.dart';
import 'package:tickify_flutter/features/validator/presentation/providers/validator_state.dart';

///
/// [validatorProvider] expose notifier with [GetPokemonListUsecase] injected
///
final validatorProvider =
    StateNotifierProvider<ValidatorNotifier, ValidatorState>((ref) {
      final useCase = ref.read(validateTicketUsecaseProvider);

      return ValidatorNotifier(useCase);
    });
