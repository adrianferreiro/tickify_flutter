import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:sizer/sizer.dart';

import 'package:tickify_flutter/config/routes/router.dart';
import 'package:tickify_flutter/core/theme/app_theme.dart';

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
