import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';
import 'package:animate_do/animate_do.dart';
import 'package:tickify_flutter/core/styles/assets.dart';
import 'package:tickify_flutter/features/splash/presentation/providers/splash_notifier_provider.dart';
import 'package:tickify_flutter/features/validator/presentation/screens/validator_screen.dart';

class SplashScreen extends ConsumerWidget {
  const SplashScreen({super.key});

  static const name = 'splashscreen';
  static const path = '/splash';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(splashNotifierProvider, (previous, next) {
      if (!next) {
        context.goNamed(ValidatorScreen.name);
      }
    });

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: FadeInDown(from: 200, child: Image.asset(Assets.logo))),
          SizedBox(height: 4.h),
        ],
      ),
    );
  }
}
