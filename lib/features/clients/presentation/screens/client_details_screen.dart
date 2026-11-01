import 'package:flutter/material.dart';

class ClientDetailsScreen extends StatelessWidget {
  const ClientDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Карточка клиента')),
      body: const Center(child: Text('История покупок, визитов и заметок')),
    );
  }
}
