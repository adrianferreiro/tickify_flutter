import 'package:tickify_flutter/features/ticket/application/usecases/validate_ticket_usecase.dart';

/// Simple wrapper que reutiliza el usecase de ticket dentro de validator
///
/// ✅ Esta solución usa type alias para mantener nombres coherentes dentro de la feature validator, sin duplicar lógica.
///
typedef ValidateQrUsecase = ValidateTicketUsecase;
typedef ValidateQrParams = ValidateTicketParams;
