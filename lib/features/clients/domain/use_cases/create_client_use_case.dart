/// Use case создания клиента.
///
/// Проверяет обязательные поля и сохраняет клиента через репозиторий.
class CreateClientUseCase {
  const CreateClientUseCase(this._repository);

  final ClientRepository _repository;

  Future<String> call(Client client) async {
    if (client.name.trim().isEmpty) {
      throw const ValidationException('Имя клиента обязательно для заполнения.');
    }
    if (client.phone.trim().isEmpty) {
      throw const ValidationException('Телефон клиента обязателен.');
    }

    return _repository.create(client);
  }
}
