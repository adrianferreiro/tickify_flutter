import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:tickify_flutter/core/styles/assets.dart';

class ButtonScanQr extends StatelessWidget {
  const ButtonScanQr({super.key});

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    return Center(
      child: FadeIn(
        animate: true,
        duration: const Duration(seconds: 1),
        child: GestureDetector(
          onTap: () {}, // opcional
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                mainAxisSize: MainAxisSize.min, // 👈 clave
                children: [
                  Image.asset(Assets.logo),
                  Text('Validar entrada', style: textStyle.titleLarge),
                  Text('Debatech', style: textStyle.titleMedium),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
