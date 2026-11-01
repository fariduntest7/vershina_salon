import 'package:flutter/material.dart';

class MasterDetailsScreen extends StatelessWidget {
  const MasterDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Карточка мастера')),
      body: const Center(child: Text('Профиль, зарплата, активность')),
    );
  }
}
