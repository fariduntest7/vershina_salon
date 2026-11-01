/// Сводка панели управления.
///
/// Используется для предоставления актуальных KPI на главной панели.
class DashboardSummary {
  const DashboardSummary({
    required this.totalIncome,
    required this.clientsCount,
    required this.appointmentsCount,
    required this.completedAppointments,
    required this.expenses,
    required this.netProfit,
  });

  final double totalIncome;
  final int clientsCount;
  final int appointmentsCount;
  final int completedAppointments;
  final double expenses;
  final double netProfit;
}
