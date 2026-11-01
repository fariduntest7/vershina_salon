import 'package:flutter/material.dart';

class MastersScreen extends StatelessWidget {
  const MastersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Мастера')),
      body: const Center(child: Text('Управление мастерами')),
    );
  }
}
