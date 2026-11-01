import 'package:flutter/material.dart';
import 'package:vershina_salon/shared/widgets/statistic_tile.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dashboard')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          children: const [
            StatisticTile(label: 'Доход сегодня', value: '₸ 18 450', icon: Icons.trending_up_rounded),
            StatisticTile(label: 'Записи', value: '42', icon: Icons.event_note_rounded),
            StatisticTile(label: 'Клиенты', value: '312', icon: Icons.people_alt_rounded),
            StatisticTile(label: 'Мастера', value: '8', icon: Icons.badge_rounded),
            StatisticTile(label: 'Расходы', value: '₸ 7 600', icon: Icons.payments_rounded),
            StatisticTile(label: 'Чистая прибыль', value: '₸ 10 850', icon: Icons.account_balance_wallet_rounded),
          ],
        ),
      ),
    );
  }
}
