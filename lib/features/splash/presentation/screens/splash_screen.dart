import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Icon(Icons.auto_awesome, size: 72, color: Color(0xFFD6B56D)),
            SizedBox(height: 16),
            Text(
              'VERSHINA SALON',
              style: TextStyle(
                fontSize: 30,
                letterSpacing: 2,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 8),
            Text('Проверка локальной базы и подготовка к работе…'),
          ],
        ),
      ),
    );
  }
}
