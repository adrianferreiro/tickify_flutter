import 'package:dartz/dartz.dart';
import 'package:tickify_flutter/core/network/errors/failures.dart';
import 'package:tickify_flutter/features/ticket/data/datasources/ticket_datasource.dart';
import 'package:tickify_flutter/features/ticket/data/mappers/ticket_mapper.dart';
import 'package:tickify_flutter/features/ticket/domain/entities/ticket_entity.dart';
import 'package:tickify_flutter/features/ticket/domain/repositories/ticket_repository.dart';

class TicketRepositoryImpl implements TicketRepository {
  final TicketDatasource dataSource;

  TicketRepositoryImpl({required this.dataSource});

  @override
  Future<Either<Failure, TicketEntity>> validateTicket({
    required String ticketId,
  }) async {
    try {
      final response = await dataSource.validateTicket(ticketId);
      return Right(response.toEntity());
    } catch (_) {
      return Left(ApiFailure());
    }
  }
}
