import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:vershina_salon/app/theme/design_tokens.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DesignTokens.primaryBackground,
      appBar: AppBar(
        backgroundColor: DesignTokens.secondaryBackground,
        title: const Text('Настройки'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          _SettingsTile(
            icon: Icons.palette_rounded,
            title: 'Внешний вид',
            subtitle: 'Тёмная тема и комфортная палитра',
          ),
          _SettingsTile(
            icon: Icons.notifications_rounded,
            title: 'Уведомления',
            subtitle: 'Напоминания о записи и событиях',
          ),
          _SettingsTile(
            icon: Icons.security_rounded,
            title: 'Безопасность',
            subtitle: 'Пароль и защита доступа',
          ),
          _SettingsTile(
            icon: Icons.cloud_upload_rounded,
            title: 'Резервные копии',
            subtitle: 'Синхронизация и резервные копии',
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => context.go('/home'),
        icon: const Icon(Icons.home_rounded),
        label: const Text('Главная'),
      ),
    );
  }
}

class _SettingsTile extends StatelessWidget {
  const _SettingsTile({
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  final IconData icon;
  final String title;
  final String subtitle;

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
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              color: DesignTokens.goldPrimary.withOpacity(0.12),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: DesignTokens.goldPrimary),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: DesignTokens.primaryText,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: const TextStyle(
                    color: DesignTokens.secondaryText,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          const Icon(
            Icons.chevron_right_rounded,
            color: DesignTokens.secondaryText,
          ),
        ],
      ),
    );
  }
}
