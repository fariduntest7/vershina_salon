import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:vershina_salon/app/providers/app_providers.dart';
import 'package:vershina_salon/app/theme/design_tokens.dart';

/// Экран списка клиентов.
///
/// В этом экране пользователь может видеть актуальный список клиентов,
/// производить поиск и быстро добавлять новых участников.
class ClientsScreen extends ConsumerWidget {
  const ClientsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final clients = ref.watch(clientListControllerProvider);

    return Scaffold(
      backgroundColor: DesignTokens.primaryBackground,
      appBar: AppBar(
        backgroundColor: DesignTokens.secondaryBackground,
        title: const Text('Клиенты'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: clients.isEmpty
            ? const EmptyState(
                title: 'Нет клиентов',
                message: 'Добавьте нового клиента, чтобы начать работу.',
                icon: Icons.people_alt_rounded,
              )
            : Column(
                children: [
                  TextField(
                    decoration: const InputDecoration(
                      hintText: 'Поиск клиента',
                      prefixIcon: Icon(Icons.search_rounded),
                    ),
                    onChanged: (_) {},
                  ),
                  const SizedBox(height: 16),
                  Expanded(
                    child: ListView.builder(
                      itemCount: clients.length,
                      itemBuilder: (context, index) {
                        final client = clients[index];
                        return _ClientTile(client: client);
                      },
                    ),
                  ),
                ],
              ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          await ref.read(clientListControllerProvider.notifier).addClient(
            name: 'Новый клиент',
            phone: '+992900000099',
            email: 'new.client@example.com',
          );
        },
        icon: const Icon(Icons.person_add_alt_1_rounded),
        label: const Text('Добавить'),
      ),
    );
  }
}

class _ClientTile extends StatelessWidget {
  const _ClientTile({required this.client});

  final dynamic client;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: DesignTokens.cardBackground,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: DesignTokens.border),
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: DesignTokens.goldPrimary.withOpacity(0.12),
            child: const Icon(Icons.person_rounded, color: DesignTokens.goldPrimary),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  client.name,
                  style: const TextStyle(
                    color: DesignTokens.primaryText,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  client.phone,
                  style: const TextStyle(color: DesignTokens.secondaryText),
                ),
              ],
            ),
          ),
          Text(
            '${client.totalSpend.toStringAsFixed(0)} TJS',
            style: const TextStyle(
              color: DesignTokens.goldPrimary,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
