import 'package:flutter/material.dart';
import 'package:vershina_salon/app/theme/design_tokens.dart';

class StatisticTile extends StatelessWidget {
  const StatisticTile({
    required this.label,
    required this.value,
    required this.icon,
    this.trend,
    super.key,
  });

  final String label;
  final String value;
  final IconData icon;
  final String? trend;

  @override
  Widget build(BuildContext context) {
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
                  label,
                  style: const TextStyle(
                    color: DesignTokens.secondaryText,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  value,
                  style: const TextStyle(
                    color: DesignTokens.primaryText,
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                if (trend != null)
                  Text(
                    trend!,
                    style: const TextStyle(
                      color: DesignTokens.success,
                      fontSize: 12,
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
