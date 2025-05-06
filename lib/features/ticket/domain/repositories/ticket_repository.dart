import 'package:dartz/dartz.dart';
import 'package:tickify_flutter/core/network/errors/failures.dart';
import 'package:tickify_flutter/features/ticket/domain/entities/ticket_entity.dart';

abstract class TicketRepository {
  Future<Either<Failure, TicketEntity>> validateTicket({
    required String ticketId,
  });
}
