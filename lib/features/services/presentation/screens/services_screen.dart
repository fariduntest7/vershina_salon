import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:vershina_salon/app/theme/design_tokens.dart';
import 'package:vershina_salon/features/services/providers/service_providers.dart';

class ServicesScreen extends ConsumerWidget {
  const ServicesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final services = ref.watch(serviceListControllerProvider);

    return Scaffold(
      backgroundColor: DesignTokens.primaryBackground,
      appBar: AppBar(
        backgroundColor: DesignTokens.secondaryBackground,
        title: const Text('Услуги'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: services.isEmpty
            ? const Center(
                child: Text(
                  'Пока нет услуг',
                  style: TextStyle(color: DesignTokens.primaryText),
                ),
              )
            : ListView.separated(
                itemCount: services.length,
                separatorBuilder: (_, __) => const SizedBox(height: 12),
                itemBuilder: (context, index) {
                  final service = services[index];
                  return Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: DesignTokens.cardBackground,
                      borderRadius: BorderRadius.circular(18),
                      border: Border.all(color: DesignTokens.border),
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 44,
                          height: 44,
                          decoration: BoxDecoration(
                            color: DesignTokens.goldPrimary.withOpacity(0.12),
                            borderRadius: BorderRadius.circular(14),
                          ),
                          child: const Icon(
                            Icons.cut_rounded,
                            color: DesignTokens.goldPrimary,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                service.name,
                                style: const TextStyle(
                                  color: DesignTokens.primaryText,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                '${service.category} · ${service.durationMinutes} мин',
                                style: const TextStyle(
                                  color: DesignTokens.secondaryText,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              '${service.price.toStringAsFixed(0)} TJS',
                              style: const TextStyle(
                                color: DesignTokens.primaryText,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            if (service.isPopular)
                              Container(
                                margin: const EdgeInsets.only(top: 6),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 4,
                                ),
                                decoration: BoxDecoration(
                                  color: DesignTokens.goldPrimary.withOpacity(0.12),
                                  borderRadius: BorderRadius.circular(999),
                                ),
                                child: const Text(
                                  'Популярно',
                                  style: TextStyle(
                                    color: DesignTokens.goldPrimary,
                                    fontSize: 11,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          await ref.read(serviceListControllerProvider.notifier).addService(
            name: 'Уход за волосами',
            category: 'Уход',
            durationMinutes: 70,
            price: 390,
            isPopular: true,
          );
        },
        icon: const Icon(Icons.add_rounded),
        label: const Text('Добавить'),
      ),
    );
  }
}
