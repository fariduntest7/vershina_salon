import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';
import 'package:vershina_salon/core/database/app_database.dart';
import 'package:vershina_salon/features/clients/data/datasources/client_local_data_source.dart';
import 'package:vershina_salon/features/clients/data/repositories/client_repository_impl.dart';
import 'package:vershina_salon/features/clients/domain/entities/client.dart';
import 'package:vershina_salon/features/clients/domain/repositories/client_repository.dart';

final appDatabaseProvider = Provider<AppDatabase>((ref) => AppDatabase());

final clientRepositoryProvider = Provider<ClientRepository>((ref) {
  final database = ref.watch(appDatabaseProvider);
  final dataSource = ClientLocalDataSource(seedData: database.clients);
  return ClientRepositoryImpl(dataSource);
});

final clientListControllerProvider = StateNotifierProvider<ClientListController, List<Client>>((ref) {
  final repository = ref.watch(clientRepositoryProvider);
  return ClientListController(repository);
});

/// Контроллер списка клиентов.
///
/// Отвечает за загрузку, добавление и обновление списка клиентов. Этот слой
/// остаётся в presentation, но работает только через репозиторий, не напрямую с
/// UI-компонентами.
class ClientListController extends StateNotifier<List<Client>> {
  ClientListController(this._repository) : super(const <Client>[]) {
    load();
  }

  final ClientRepository _repository;

  Future<void> load() async {
    final clients = await _repository.getAll();
    state = clients;
  }

  Future<void> addClient({
    required String name,
    required String phone,
    String? email,
  }) async {
    final client = Client(
      id: const Uuid().v4(),
      name: name.trim(),
      phone: phone.trim(),
      email: email?.trim(),
      createdAt: DateTime.now(),
      totalSpend: 0,
    );

    await _repository.create(client);
    await load();
  }
}
