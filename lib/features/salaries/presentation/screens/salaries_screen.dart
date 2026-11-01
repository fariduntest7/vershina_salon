import 'package:flutter/material.dart';

class SalariesScreen extends StatelessWidget {
  const SalariesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Зарплаты')),
      body: const Center(child: Text('Начисления, авансы и выплаты')),
    );
  }
}
