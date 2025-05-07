import 'package:dartz/dartz.dart';
import 'package:tickify_flutter/core/network/errors/failures.dart';
import 'package:tickify_flutter/features/events/data/datasources/event_datasource.dart';
import 'package:tickify_flutter/features/events/data/mappers/event_mapper.dart';
import 'package:tickify_flutter/features/events/domain/entities/event_entity.dart';
import 'package:tickify_flutter/features/events/domain/repositories/event_repository.dart';

class EventRepositoryImpl implements EventRepository {
  final EventDatasource dataSource;

  EventRepositoryImpl({required this.dataSource});
  @override
  Future<Either<Failure, EventEntity>> getAllEvents() async {
    try {
      final response = await dataSource.getAllEvents();
      return right(response.toEntity());
    } catch (_) {
      return Left(ApiFailure());
    }
  }
}
