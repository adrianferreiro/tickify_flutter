sealed class Failure {
  final String? message;

  Failure({this.message});
}

final class ApiFailure extends Failure {
  ApiFailure({super.message = 'Error en la petición'});
}

final class NotFoundFailure extends Failure {
  NotFoundFailure({super.message = 'Ticket no encontrado'});
}

final class AlreadyUsedFailure extends Failure {
  AlreadyUsedFailure({super.message = 'El ticket ya fue validado'});
}
