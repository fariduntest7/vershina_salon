import 'package:flutter/material.dart';

import 'package:vershina_salon/app/theme/design_tokens.dart';

class AppointmentRow extends StatelessWidget {
  const AppointmentRow({
    required this.time,
    required this.client,
    required this.service,
    required this.master,
    this.status = 'Подтверждена',
    super.key,
  });

  final String time;
  final String client;
  final String service;
  final String master;
  final String status;

  @override
  Widget build(BuildContext context) {
    final isConfirmed = status.toLowerCase().contains('подт') ||
        status.toLowerCase().contains('confirm');
    final statusColor = isConfirmed ? DesignTokens.success : DesignTokens.warning;

    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: DesignTokens.cardBackground,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: DesignTokens.border),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 46,
            height: 46,
            decoration: BoxDecoration(
              color: DesignTokens.goldPrimary.withOpacity(0.14),
              borderRadius: BorderRadius.circular(14),
            ),
            child: const Icon(
              Icons.schedule_rounded,
              color: DesignTokens.goldPrimary,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  client,
                  style: const TextStyle(
                    color: DesignTokens.primaryText,
                    fontWeight: FontWeight.w700,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '$service · $master',
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
                time,
                style: const TextStyle(
                  color: DesignTokens.goldPrimary,
                  fontWeight: FontWeight.w700,
                  fontSize: 13,
                ),
              ),
              const SizedBox(height: 6),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: statusColor.withOpacity(0.12),
                  borderRadius: BorderRadius.circular(999),
                  border: Border.all(color: statusColor.withOpacity(0.3)),
                ),
                child: Text(
                  status,
                  style: TextStyle(
                    color: statusColor,
                    fontSize: 10,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
