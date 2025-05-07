import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:tickify_flutter/core/styles/assets.dart';
import 'package:tickify_flutter/features/validator/presentation/providers/validator_provider.dart';
import 'package:tickify_flutter/features/validator/presentation/screens/screens.dart';

class ScanQrCard extends ConsumerWidget {
  const ScanQrCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textStyle = Theme.of(context).textTheme;
    return Center(
      child: FadeIn(
        animate: true,
        duration: const Duration(seconds: 1),
        child: GestureDetector(
          onTap: () {
            ref.read(validatorProvider.notifier).resetState();
            String location = '${ValidatorScreen.path}${ScannerScreen.path}';
            context.push(location);
          },
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
