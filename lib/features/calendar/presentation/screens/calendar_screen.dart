import 'package:flutter/material.dart';

import 'package:vershina_salon/app/theme/design_tokens.dart';
import 'package:vershina_salon/features/appointments/presentation/widgets/appointment_row.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  final DateTime _focusedDate = DateTime(2026, 10, 20);
  final List<String> _weekdays = const ['Пн', 'Вт', 'Ср', 'Чт', 'Пт', 'Сб', 'Вс'];
  late DateTime _selectedDate;

  @override
  void initState() {
    super.initState();
    _selectedDate = _focusedDate;
  }

  @override
  Widget build(BuildContext context) {
    final daysInMonth = DateTime(_focusedDate.year, _focusedDate.month + 1, 0).day;
    final firstWeekday = DateTime(_focusedDate.year, _focusedDate.month, 1).weekday;
    final startOffset = (firstWeekday + 6) % 7;
    final totalCells = ((startOffset + daysInMonth + 6) ~/ 7) * 7;

    final selectedAppointments = <Map<String, String>>[
      {
        'time': '09:00',
        'client': 'Рустам Мирзоев',
        'service': 'Мужская стрижка',
        'master': 'Сардор',
      },
      {
        'time': '11:30',
        'client': 'Анна Петрова',
        'service': 'Брови + уход',
        'master': 'Фарид',
      },
      {
        'time': '15:00',
        'client': 'Бахром',
        'service': 'Окрашивание',
        'master': 'Али',
      },
    ];

    return Scaffold(
      backgroundColor: DesignTokens.primaryBackground,
      appBar: AppBar(
        backgroundColor: DesignTokens.secondaryBackground,
        title: const Text('Календарь'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add_rounded),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: DesignTokens.cardBackground,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: DesignTokens.border),
              ),
              child: Row(
                children: [
                  Text(
                    '${_monthName(_focusedDate.month)} ${_focusedDate.year}',
                    style: const TextStyle(
                      color: DesignTokens.primaryText,
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.chevron_left_rounded),
                    color: DesignTokens.primaryText,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.chevron_right_rounded),
                    color: DesignTokens.primaryText,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: DesignTokens.cardBackground,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: DesignTokens.border),
              ),
              child: Column(
                children: [
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: _weekdays.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 7,
                      crossAxisSpacing: 6,
                      mainAxisSpacing: 6,
                      childAspectRatio: 1.05,
                    ),
                    itemBuilder: (context, index) {
                      return Center(
                        child: Text(
                          _weekdays[index],
                          style: const TextStyle(
                            color: DesignTokens.secondaryText,
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 8),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: totalCells,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 7,
                      crossAxisSpacing: 6,
                      mainAxisSpacing: 6,
                      childAspectRatio: 1.0,
                    ),
                    itemBuilder: (context, index) {
                      final int dayNumber;
                      if (index < startOffset) {
                        dayNumber = 0;
                      } else {
                        dayNumber = index - startOffset + 1;
                      }

                      if (dayNumber <= 0 || dayNumber > daysInMonth) {
                        return Container(
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(12),
                          ),
                        );
                      }

                      final isSelected = dayNumber == _selectedDate.day;
                      final isToday = dayNumber == _focusedDate.day;

                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedDate = DateTime(
                              _focusedDate.year,
                              _focusedDate.month,
                              dayNumber,
                            );
                          });
                        },
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 180),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: isSelected
                                ? DesignTokens.goldPrimary
                                : isToday
                                    ? DesignTokens.goldPrimary.withOpacity(0.18)
                                    : Colors.transparent,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: isSelected
                                  ? DesignTokens.goldPrimary
                                  : DesignTokens.border,
                            ),
                          ),
                          child: Text(
                            '$dayNumber',
                            style: TextStyle(
                              color: isSelected || isToday
                                  ? const Color(0xFF121216)
                                  : DesignTokens.primaryText,
                              fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Записи на ${_selectedDate.day} ${_monthName(_selectedDate.month)}',
                style: const TextStyle(
                  color: DesignTokens.primaryText,
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: ListView.separated(
                itemCount: selectedAppointments.length,
                separatorBuilder: (_, __) => const SizedBox(height: 10),
                itemBuilder: (context, index) {
                  final appointment = selectedAppointments[index];
                  return AppointmentRow(
                    time: appointment['time'] ?? '',
                    client: appointment['client'] ?? '',
                    service: appointment['service'] ?? '',
                    master: appointment['master'] ?? '',
                    status: 'Подтверждена',
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _monthName(int month) {
    const names = [
      'Январь',
      'Февраль',
      'Март',
      'Апрель',
      'Май',
      'Июнь',
      'Июль',
      'Август',
      'Сентябрь',
      'Октябрь',
      'Ноябрь',
      'Декабрь',
    ];
    return names[month - 1];
  }
}
