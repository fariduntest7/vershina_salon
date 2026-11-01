import 'package:flutter/material.dart';

class InventoryScreen extends StatelessWidget {
  const InventoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Склад и товары')),
      body: const Center(child: Text('Товары, остатки, поставщики')),
    );
  }
}
