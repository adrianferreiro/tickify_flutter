import 'package:dartz/dartz.dart';
import 'package:tickify_flutter/core/network/errors/failures.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}
