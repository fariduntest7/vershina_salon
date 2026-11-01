import 'package:vershina_salon/core/errors/app_exception.dart';
import 'package:vershina_salon/features/clients/domain/entities/client.dart';

/// Локальный источник данных клиентов.
///
/// В текущей версии реализация работает через in-memory список, поэтому
/// приложение остаётся офлайн-совместимым и не требует сетевого доступа.
/// Позже этот источник будет заменён на SQLite/IndexedDB-адаптер.
class ClientLocalDataSource {
  ClientLocalDataSource({List<Client> seedData = const <Client>[]})
      : _clients = List<Client>.from(seedData);

  final List<Client> _clients;

  Future<List<Client>> getAll({String? query}) async {
    final normalizedQuery = (query ?? '').trim().toLowerCase();
    if (normalizedQuery.isEmpty) {
      return List<Client>.unmodifiable(_clients);
    }

    return _clients.where((client) {
      final haystack = '${client.name} ${client.phone} ${client.email ?? ''}'.toLowerCase();
      return haystack.contains(normalizedQuery);
    }).toList();
  }

  Future<Client?> getById(String id) async {
    final index = _clients.indexWhere((client) => client.id == id);
    if (index == -1) {
      return null;
    }
    return _clients[index];
  }

  Future<String> create(Client client) async {
    final exists = _clients.any((item) => item.id == client.id);
    if (exists) {
      throw const AppException(
        'Клиент с таким идентификатором уже существует.',
        code: 'CLIENT_ALREADY_EXISTS',
      );
    }

    _clients.add(client);
    return client.id;
  }

  Future<void> update(Client client) async {
    final index = _clients.indexWhere((item) => item.id == client.id);
    if (index == -1) {
      throw const AppException(
        'Клиент не найден для обновления.',
        code: 'CLIENT_NOT_FOUND',
      );
    }
    _clients[index] = client;
  }

  Future<void> delete(String id) async {
    final index = _clients.indexWhere((client) => client.id == id);
    if (index == -1) {
      throw const AppException(
        'Клиент не найден для удаления.',
        code: 'CLIENT_NOT_FOUND',
      );
    }

    _clients.removeAt(index);
  }
}
