import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:sizer/sizer.dart';
import 'package:tickify_flutter/core/theme/app_theme.dart';
import 'package:tickify_flutter/validator/firebase_check.dart';

import 'package:tickify_flutter/config/routes/router.dart';
// import 'package:mobile_scanner_example/screens/mobile_scanner_advanced.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); // Inicializa Firebase
  runApp(
    ProviderScope(
      child: Sizer(
        builder: (context, orientation, deviceType) {
          return MaterialApp.router(
            routerConfig: AppRouter.routes,
            debugShowCheckedModeBanner: false,
            title: 'Tickify',
            theme: getDarkTheme(),
          );
        },
      ),
    ),
  );
}

/// Implementation of Mobile Scanner example with simple configuration
class MobileScannerSimple extends StatefulWidget {
  /// Constructor for simple Mobile Scanner example
  const MobileScannerSimple({super.key});

  @override
  State<MobileScannerSimple> createState() => _MobileScannerSimpleState();
}

class _MobileScannerSimpleState extends State<MobileScannerSimple> {
  Barcode? _barcode;

  Widget _barcodePreview(Barcode? value) {
    if (value == null) {
      return const Text(
        'Scan something!',
        overflow: TextOverflow.fade,
        style: TextStyle(color: Colors.white),
      );
    }

    return Text(
      value.displayValue ?? 'No display value.',
      overflow: TextOverflow.fade,
      style: const TextStyle(color: Colors.white),
    );
  }

  void _handleBarcode(BarcodeCapture barcodes) {
    final uid = barcodes.barcodes.firstOrNull?.rawValue;
    // print(uid);

    if (uid != null && context.mounted) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => FirebaseUpdateStatusScreen(id: uid),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Validar')),
      body: Stack(
        children: [
          MobileScanner(onDetect: _handleBarcode),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              alignment: Alignment.bottomCenter,
              height: 100,
              color: const Color.fromRGBO(0, 0, 0, 0.4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(child: Center(child: _barcodePreview(_barcode))),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Homepage for example app with selection between basic and advanced screen.
class ExampleHome extends StatelessWidget {
  static const name = 'example-screen';
  static const path = '/example';
  const ExampleHome({super.key});
  Widget _buildItem(
    BuildContext context,
    String label,
    String subtitle,
    Widget page,
    IconData icon,
  ) {
    return GestureDetector(
      onTap: () {
        Navigator.of(
          context,
        ).push(MaterialPageRoute<void>(builder: (context) => page));
      },
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(icon, size: 60, color: Colors.blueAccent), // Icono arriba
              const SizedBox(height: 16),
              Text(
                label,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                subtitle,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 14, color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Tickify',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blueAccent, Colors.lightBlue],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              const SizedBox(height: 20),
              _buildItem(
                context,
                'Validar entrada',
                'Asistencia Debatech',
                const MobileScannerSimple(),
                Icons.qr_code_scanner,
              ),
              // _buildItem(
              //   context,
              //   'Advanced Mobile Scanner',
              //   'Example of an advanced mobile scanner instance with a '
              //       'controller, and multiple control widgets.',
              //   const MobileScannerAdvanced(),
              //   Icons.settings_remote,
              // ),
              // TODO(juliansteenbakker): Fix picklist example
              // _buildItem(
              //   context,
              //   'Mobile Scanner with Crosshair',
              //  'Example of a mobile scanner instance with a crosshair, that '
              //       'only detects barcodes which the crosshair hits.',
              //   const BarcodeScannerPicklist(),
              //   Icons.list,
              // ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
