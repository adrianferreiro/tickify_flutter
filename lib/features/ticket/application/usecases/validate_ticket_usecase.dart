import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tickify_flutter/core/domain/repositories/use_case.dart';
import 'package:tickify_flutter/core/network/errors/failures.dart';
import 'package:tickify_flutter/features/ticket/domain/entities/ticket_entity.dart';
import 'package:tickify_flutter/features/ticket/domain/repositories/ticket_repository.dart';
import 'package:tickify_flutter/features/ticket/application/providers/ticket_repository_provider.dart';

///
/// [validateTicketUsecaseProvider] expose Usecase with repository injection
///
final validateTicketUsecaseProvider = Provider((ref) {
  final repository = ref.read(ticketRepositoryProvider);
  final useCase = ValidateTicketUsecase(repository: repository);
  return useCase;
});

///
/// [ValidateTicketUsecase] depends of [TicketRepository] param injection for work
///
class ValidateTicketUsecase
    extends UseCase<TicketEntity, ValidateTicketParams> {
  final TicketRepository repository;

  ValidateTicketUsecase({required this.repository});

  @override
  Future<Either<Failure, TicketEntity>> call(params) {
    return repository.validateTicket(ticketId: params.uid);
  }
}

class ValidateTicketParams {
  final String uid;

  ValidateTicketParams({required this.uid});
}
