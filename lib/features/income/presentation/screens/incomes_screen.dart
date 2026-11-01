import 'package:flutter/material.dart';

class IncomesScreen extends StatelessWidget {
  const IncomesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Доходы')),
      body: const Center(child: Text('История доходов')),
    );
  }
}
