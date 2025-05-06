import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:tickify_flutter/features/validator/presentation/providers/validator_provider.dart';

class ScannerScreen extends ConsumerWidget {
  static const path = '/scanner';
  static const name = 'scanner-screen';
  const ScannerScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    void handleBarcode(BarcodeCapture capture) {
      final uid = capture.barcodes.firstOrNull?.rawValue;
      if (uid != null) {
        // ref.read(validatorProvider.notifier).validateQr(uid);
      }
    }

    ref.listen(validatorProvider, (previous, next) {
      if (next.ticket != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('✅ Bienvenido ${next.ticket!.name}')),
        );
        Navigator.pop(context); // salir de la pantalla del escáner
      } else if (next.generalResponse?.ok == false) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('❌ ${next.generalResponse?.message ?? "Error"}'),
          ),
        );
      }
    });

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
