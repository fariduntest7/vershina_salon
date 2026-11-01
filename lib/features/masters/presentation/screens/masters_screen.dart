import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:vershina_salon/app/theme/design_tokens.dart';
import 'package:vershina_salon/features/masters/providers/master_providers.dart';

class MastersScreen extends ConsumerWidget {
  const MastersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final masters = ref.watch(masterListControllerProvider);

    return Scaffold(
      backgroundColor: DesignTokens.primaryBackground,
      appBar: AppBar(
        backgroundColor: DesignTokens.secondaryBackground,
        title: const Text('Мастера'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: masters.isEmpty
            ? const Center(
                child: Text(
                  'Пока нет мастеров',
                  style: TextStyle(color: DesignTokens.primaryText),
                ),
              )
            : ListView.separated(
                itemCount: masters.length,
                separatorBuilder: (_, __) => const SizedBox(height: 12),
                itemBuilder: (context, index) {
                  final master = masters[index];
                  return Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: DesignTokens.cardBackground,
                      borderRadius: BorderRadius.circular(18),
                      border: Border.all(color: DesignTokens.border),
                    ),
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: DesignTokens.goldPrimary.withOpacity(0.14),
                          child: const Icon(
                            Icons.person_rounded,
                            color: DesignTokens.goldPrimary,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                master.name,
                                style: const TextStyle(
                                  color: DesignTokens.primaryText,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                master.specialization,
                                style: const TextStyle(
                                  color: DesignTokens.secondaryText,
                                  fontSize: 12,
                                ),
                              ),
                              const SizedBox(height: 6),
                              Text(
                                '⭐ ${master.rating.toStringAsFixed(1)} · ${master.experienceYears} лет опыта',
                                style: const TextStyle(
                                  color: DesignTokens.goldPrimary,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: master.isAvailable
                                ? DesignTokens.goldPrimary.withOpacity(0.12)
                                : DesignTokens.secondaryBackground,
                            borderRadius: BorderRadius.circular(999),
                          ),
                          child: Text(
                            master.isAvailable ? 'Свободен' : 'Занят',
                            style: TextStyle(
                              color: master.isAvailable
                                  ? DesignTokens.goldPrimary
                                  : DesignTokens.secondaryText,
                              fontSize: 11,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          await ref.read(masterListControllerProvider.notifier).addMaster(
            name: 'Новый мастер',
            specialization: 'Профессиональный уход',
            rating: 4.9,
            experienceYears: 5,
            isAvailable: true,
          );
        },
        icon: const Icon(Icons.person_add_alt_1_rounded),
        label: const Text('Добавить'),
      ),
    );
  }
}
