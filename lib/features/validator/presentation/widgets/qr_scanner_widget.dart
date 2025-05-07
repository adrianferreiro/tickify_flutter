import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class QrScannerWidget extends StatefulWidget {
  final void Function(String uid) onScanned;

  const QrScannerWidget({super.key, required this.onScanned});

  @override
  State<QrScannerWidget> createState() => _QrScannerWidgetState();
}

class _QrScannerWidgetState extends State<QrScannerWidget> {
  final MobileScannerController controller = MobileScannerController();
  bool hasScanned = false;

  void handleBarcode(BarcodeCapture capture) {
    final uid = capture.barcodes.firstOrNull?.rawValue;
    if (uid != null && !hasScanned && context.mounted) {
      hasScanned = true;
      controller.stop();
      context.pop(uid);
      widget.onScanned(uid);
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        MobileScanner(controller: controller, onDetect: handleBarcode),
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
    );
  }
}
