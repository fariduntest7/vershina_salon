import 'dart:async';

abstract class LocalDatabase {
  Future<void> initialize();
  Future<void> close();
}

class AppDatabase implements LocalDatabase {
  AppDatabase();

  @override
  Future<void> initialize() async {
    // Инициализация локальной базы данных для offline-first режима.
    // В следующем этапе здесь будет подключён Drift / SQLite / IndexedDB.
  }

  @override
  Future<void> close() async {
    // Корректное закрытие соединения с базой данных.
  }
}
