import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tickify_flutter/features/ticket/application/usecases/validate_ticket_usecase.dart';
import 'package:tickify_flutter/features/validator/presentation/providers/validator_provider.dart';
import 'package:tickify_flutter/features/validator/presentation/widgets/qr_scanner_widget.dart';

class ScannerScreen extends ConsumerWidget {
  static const path = '/scanner';
  static const name = 'scanner-screen';
  const ScannerScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('Escanear QR')),
      body: QrScannerWidget(
        onScanned: (uid) {
          if (context.mounted) {
            ref
                .read(validatorProvider.notifier)
                .validateTicket(params: ValidateTicketParams(uid: uid));
          }
        },
      ),
    );
  }
}
