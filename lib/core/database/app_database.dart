import 'package:vershina_salon/features/clients/domain/entities/client.dart';

/// Реализация локального хранилища приложения.
///
/// Данный слой является первым рабочим вариантом локального Storage. В текущей
/// версии данные хранятся в памяти и доступны без интернета. В дальнейшем этот
/// сервис будет заменён на Drift/SQLite и IndexedDB для каждой платформы.
class AppDatabase {
  AppDatabase() : _clients = <Client>[...
    Client(
      id: 'seed-client-1',
      name: 'Анна Петрова',
      phone: '+992900000001',
      email: 'anna@example.com',
      totalSpend: 18500,
      lastVisitAt: DateTime.now().subtract(const Duration(days: 2)),
      createdAt: DateTime.now().subtract(const Duration(days: 30)),
      birthDate: DateTime(1992, 5, 11),
      notes: 'Предпочитает безупречный уход и регулярные записи.',
    ),
    Client(
      id: 'seed-client-2',
      name: 'Рустам Сардаров',
      phone: '+992900000002',
      email: 'rustam@example.com',
      totalSpend: 9300,
      lastVisitAt: DateTime.now().subtract(const Duration(days: 5)),
      createdAt: DateTime.now().subtract(const Duration(days: 18)),
      birthDate: DateTime(1988, 9, 21),
      notes: 'Часто выбирает услуги стрижки и уход за бородой.',
    ),
  ];

  final List<Client> _clients;

  Future<List<Client>> listClients() async {
    return List<Client>.unmodifiable(_clients);
  }

  Future<Client?> getClientById(String id) async {
    return _clients.firstWhere(
      (client) => client.id == id,
      orElse: () => const Client(
        id: '',
        name: '',
        phone: '',
        createdAt: null,
      ),
    );
  }

  Future<void> createClient(Client client) async {
    final exists = _clients.any((item) => item.id == client.id);
    if (exists) {
      throw StateError('Клиент с таким идентификатором уже существует.');
    }
    _clients.add(client);
  }

  Future<void> updateClient(Client client) async {
    final index = _clients.indexWhere((item) => item.id == client.id);
    if (index == -1) {
      throw StateError('Клиент не найден для обновления.');
    }
    _clients[index] = client;
  }

  Future<void> deleteClient(String id) async {
    _clients.removeWhere((client) => client.id == id);
  }
}
