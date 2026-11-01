/// Локальный источник данных клиентов.
///
/// В текущей версии он представляет собой in-memory реализацию.
/// Позже он будет заменён на SQLite/IndexedDB через реализацию репозитория.
class ClientLocalDataSource {
  ClientLocalDataSource();

  final List<Client> _clients = <Client>[];

  Future<List<Client>> getAll({String? query}) async {
    final normalizedQuery = (query ?? '').trim().toLowerCase();
    if (normalizedQuery.isEmpty) {
      return List<Client>.from(_clients);
    }

    return _clients.where((client) {
      final haystack = '${client.name} ${client.phone} ${client.email ?? ''}'.toLowerCase();
      return haystack.contains(normalizedQuery);
    }).toList();
  }

  Future<Client?> getById(String id) async {
    return _clients.where((client) => client.id == id).firstOrNull;
  }

  Future<String> create(Client client) async {
    _clients.add(client);
    return client.id;
  }

  Future<void> update(Client client) async {
    final index = _clients.indexWhere((item) => item.id == client.id);
    if (index == -1) {
      throw const AppException('Клиент не найден для обновления.', code: 'CLIENT_NOT_FOUND');
    }
    _clients[index] = client;
  }

  Future<void> delete(String id) async {
    _clients.removeWhere((client) => client.id == id);
  }
}
