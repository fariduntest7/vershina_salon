import 'package:flutter/material.dart';

class ServiceCategoriesScreen extends StatelessWidget {
  const ServiceCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Категории услуг')),
      body: const Center(child: Text('Категории и сортировка')),
    );
  }
}
