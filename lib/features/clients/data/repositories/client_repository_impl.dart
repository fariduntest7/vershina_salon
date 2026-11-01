/// Реализация репозитория клиентов.
///
/// Слой данных инкапсулирует локальное хранилище и не позволяет UI напрямую
/// работать с набором данных. Это важно для поддержки локальной базы и
/// дальнейшего подключения MariaDB через другой источник данных.
class ClientRepositoryImpl implements ClientRepository {
  ClientRepositoryImpl(this._dataSource);

  final ClientLocalDataSource _dataSource;

  @override
  Future<List<Client>> getAll({String? query}) async {
    return _dataSource.getAll(query: query);
  }

  @override
  Future<Client?> getById(String id) async {
    return _dataSource.getById(id);
  }

  @override
  Future<String> create(Client client) async {
    return _dataSource.create(client);
  }

  @override
  Future<void> update(Client client) async {
    await _dataSource.update(client);
  }

  @override
  Future<void> delete(String id) async {
    await _dataSource.delete(id);
  }
}
