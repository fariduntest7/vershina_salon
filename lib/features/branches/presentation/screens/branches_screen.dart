import 'package:flutter/material.dart';

class BranchesScreen extends StatelessWidget {
  const BranchesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Филиалы')),
      body: const Center(child: Text('Несколько филиалов в локальной базе')),
    );
  }
}
