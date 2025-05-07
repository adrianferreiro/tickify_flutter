import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:tickify_flutter/features/ticket/application/usecases/validate_ticket_usecase.dart';
import 'package:tickify_flutter/features/validator/presentation/providers/validator_provider.dart';

class ScannerScreen extends ConsumerWidget {
  static const path = '/scanner';
  static const name = 'scanner-screen';
  const ScannerScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hasHandled = ValueNotifier(false); //evita múltiples reacciones

    ref.listen(validatorProvider, (previous, next) {
      if (hasHandled.value) return;

      if (next.ticket != null) {
        hasHandled.value = true;

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('✅ Bienvenido ${next.ticket!.name}')),
        );

        if (context.canPop()) {
          context.pop();
        }
      } else if (next.generalResponse?.ok == false) {
        hasHandled.value = true;

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('❌ ${next.generalResponse?.message ?? "Error"}'),
          ),
        );
      }
    });

    void handleBarcode(BarcodeCapture capture) {
      final uid = capture.barcodes.firstOrNull?.rawValue;
      if (uid != null) {
        ref
            .read(validatorProvider.notifier)
            .validateTicket(params: ValidateTicketParams(uid: uid));
      }
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Escanear QR')),
      body: Stack(
        children: [
          MobileScanner(onDetect: handleBarcode),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 100,
              color: const Color.fromRGBO(0, 0, 0, 0.5),
              child: const Center(
                child: Text(
                  'Escaneá el ticket',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
