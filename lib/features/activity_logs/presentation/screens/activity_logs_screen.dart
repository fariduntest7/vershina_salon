import 'package:flutter/material.dart';

class ActivityLogsScreen extends StatelessWidget {
  const ActivityLogsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Журнал действий')),
      body: const Center(child: Text('Логи активности и событий')),
    );
  }
}
