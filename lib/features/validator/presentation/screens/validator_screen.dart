import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:animate_do/animate_do.dart';
import 'package:tickify_flutter/core/localization/strings.dart';
import 'package:tickify_flutter/features/ticket/presentation/widgets/ticket_card.dart';
import 'package:tickify_flutter/features/validator/presentation/providers/validator_provider.dart';
import 'package:tickify_flutter/features/validator/presentation/widgets/widgets.dart';

class ValidatorScreen extends StatelessWidget {
  static const name = 'validator-screen';
  static const path = '/validator';
  const ValidatorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: FadeIn(
          animate: true,
          duration: const Duration(seconds: 2),
          child: Text(Strings.appName),
        ),
      ),
      body: Center(
        child: SizedBox(
          width: size.width * 0.8,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 10,
            children: [ScanQrCard(), _BuildBody()],
          ),
        ),
      ),
    );
  }
}

class _BuildBody extends ConsumerWidget {
  const _BuildBody();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading = ref.watch(validatorProvider).isLoading;
    final ticket = ref.watch(validatorProvider).ticket;

    final hasHandled = ValueNotifier(false); //evita múltiples reacciones

    ref.listen(validatorProvider, (previous, next) {
      if (hasHandled.value) return;

      if (next.ticket != null) {
        hasHandled.value = true;

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('✅ Bienvenido ${next.ticket!.name}')),
        );
      } else if (next.generalResponse?.ok == false) {
        hasHandled.value = true;

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('❌ ${next.generalResponse?.message ?? "Error"}'),
          ),
        );
      }
    });

    if (isLoading) {
      return Center(child: CircularProgressIndicator());
    }
    if (ticket != null) {
      return TikcetCard(ticket: ticket);
    }
    return SizedBox();
  }
}
