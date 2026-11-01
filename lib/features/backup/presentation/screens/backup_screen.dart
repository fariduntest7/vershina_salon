import 'package:flutter/material.dart';

class BackupScreen extends StatelessWidget {
  const BackupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Резервное копирование')),
      body: const Center(child: Text('Создание, экспорт и восстановление')),
    );
  }
}
