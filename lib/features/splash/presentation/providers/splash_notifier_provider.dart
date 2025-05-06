import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tickify_flutter/features/splash/presentation/providers/splash_notifier.dart';

///
/// [splashNotifierProvider] expose notifier for handle splash
///
final splashNotifierProvider = StateNotifierProvider<SplashNotifier, bool>(
  (ref) => SplashNotifier(false),
);
