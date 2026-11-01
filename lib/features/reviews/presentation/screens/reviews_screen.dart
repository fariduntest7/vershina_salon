import 'package:flutter/material.dart';

class ReviewsScreen extends StatelessWidget {
  const ReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Отзывы')),
      body: const Center(child: Text('Рейтинг клиентов и обратная связь')),
    );
  }
}
