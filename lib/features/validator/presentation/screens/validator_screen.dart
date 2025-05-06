import 'package:flutter/material.dart';
import 'package:tickify_flutter/core/localization/strings.dart';
import 'package:tickify_flutter/features/validator/presentation/widgets/widgets.dart';

class ValidatorScreen extends StatelessWidget {
  static const name = 'validator-screen';
  static const path = '/validator';
  const ValidatorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(Strings.appName)),
      body: ButtonScanQr(),
    );
  }
}
