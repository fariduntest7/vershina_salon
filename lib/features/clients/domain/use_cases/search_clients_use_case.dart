/// Use case поиска клиентов.
///
/// Основан на строковом поиске по имени, телефону и email.
class SearchClientsUseCase {
  const SearchClientsUseCase(this._repository);

  final ClientRepository _repository;

  Future<List<Client>> call(String query) {
    return _repository.getAll(query: query);
  }
}
