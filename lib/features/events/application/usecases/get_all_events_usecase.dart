import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tickify_flutter/core/domain/repositories/use_case.dart';
import 'package:tickify_flutter/core/network/errors/failures.dart';
import 'package:tickify_flutter/features/events/application/providers/event_repository_provider.dart';
import 'package:tickify_flutter/features/events/domain/entities/event_entity.dart';
import 'package:tickify_flutter/features/events/domain/repositories/event_repository.dart';

///
/// [getAllEventsUsecaseProvider] expose Usecase with repository injection
///
final getAllEventsUsecaseProvider = Provider((ref) {
  final repository = ref.read(eventRepositoryProvider);
  final useCase = GetAllEventsUsecase(repository: repository);
  return useCase;
});

///
/// [GetAllEventsUsecase] depends of [EventRepository] param injection for work
///
class GetAllEventsUsecase extends UseCase<EventEntity, GetAllEventsParams> {
  final EventRepository repository;

  GetAllEventsUsecase({required this.repository});

  @override
  Future<Either<Failure, EventEntity>> call(params) {
    return repository.getAllEvents();
  }
}

class GetAllEventsParams {
  final String uid;

  GetAllEventsParams({required this.uid});
}
