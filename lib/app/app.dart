import 'package:flutter/material.dart';
import 'package:vershina_salon/app/router/app_router.dart';
import 'package:vershina_salon/app/theme/app_theme.dart';

class VershinaSalonApp extends StatelessWidget {
  const VershinaSalonApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = AppRouter();

    return MaterialApp.router(
      title: 'VERSHINA SALON',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.dark,
      routerConfig: appRouter.router,
    );
  }
}
