import 'package:flutter/material.dart';

class ServicesScreen extends StatelessWidget {
  const ServicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Услуги')),
      body: const Center(child: Text('Каталог услуг и их параметры')),
    );
  }
}
