/// Репозиторий клиентов.
///
/// Абстракция для работы с данными клиента независимо от конкретного
/// локального хранилища. В будущем можно заменить SQLite/IndexedDB на чистый
/// backend через отдельную реализацию.
abstract interface class ClientRepository {
  Future<List<Client>> getAll({String? query});
  Future<Client?> getById(String id);
  Future<String> create(Client client);
  Future<void> update(Client client);
  Future<void> delete(String id);
}
