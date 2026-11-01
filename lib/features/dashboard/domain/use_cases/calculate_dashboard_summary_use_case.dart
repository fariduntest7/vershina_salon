/// Use case вычисления агрегированных показателей дашборда.
///
/// На текущем этапе логика не подключена к локальной БД, но структура
/// подготовлена для реального вычисления из хранилища.
class CalculateDashboardSummaryUseCase {
  const CalculateDashboardSummaryUseCase();

  DashboardSummary call({
    required double totalIncome,
    required int clientsCount,
    required int appointmentsCount,
    required int completedAppointments,
    required double expenses,
  }) {
    final netProfit = totalIncome - expenses;

    return DashboardSummary(
      totalIncome: totalIncome,
      clientsCount: clientsCount,
      appointmentsCount: appointmentsCount,
      completedAppointments: completedAppointments,
      expenses: expenses,
      netProfit: netProfit,
    );
  }
}
