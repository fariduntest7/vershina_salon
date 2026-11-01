import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

import 'package:vershina_salon/core/database/app_database.dart';
import 'package:vershina_salon/features/clients/data/datasources/client_local_data_source.dart';
import 'package:vershina_salon/features/clients/data/repositories/client_repository_impl.dart';
import 'package:vershina_salon/features/clients/domain/entities/client.dart';
import 'package:vershina_salon/features/clients/domain/repositories/client_repository.dart';

/// Поставщик локальной базы данных приложения.
final appDatabaseProvider = Provider<AppDatabase>((ref) => AppDatabase());

/// Поставщик репозитория клиентов.
final clientRepositoryProvider = Provider<ClientRepository>((ref) {
  final database = ref.watch(appDatabaseProvider);
  final dataSource = ClientLocalDataSource(seedData: database.clients);
  return ClientRepositoryImpl(dataSource);
});

/// Поставщик списка клиентов для UI.
final clientListControllerProvider =
    StateNotifierProvider<ClientListController, List<Client>>((ref) {
  final repository = ref.watch(clientRepositoryProvider);
  return ClientListController(repository);
});

/// Контроллер списка клиентов.
///
/// Этот слой отвечает за загрузку, создание и обновление списка клиентов.
/// Все операции проходят через репозиторий для сохранения архитектуры.
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
    final normalizedName = name.trim();
    final normalizedPhone = phone.trim();

    if (normalizedName.isEmpty) {
      throw ArgumentError('Имя клиента обязательно для заполнения.');
    }
    if (normalizedPhone.isEmpty) {
      throw ArgumentError('Телефон клиента обязателен для заполнения.');
    }

    final client = Client(
      id: const Uuid().v4(),
      name: normalizedName,
      phone: normalizedPhone,
      email: email?.trim(),
      createdAt: DateTime.now(),
      totalSpend: 0,
    );

    await _repository.create(client);
    await load();
  }
}

/// Общий пустой статус для экранов списка.
class EmptyState extends StatelessWidget {
  const EmptyState({
    required this.title,
    this.message,
    this.icon = Icons.inbox_rounded,
    super.key,
  });

  final String title;
  final String? message;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 52, color: Colors.amber.shade300),
          const SizedBox(height: 12),
          Text(
            title,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          if (message != null) ...[
            const SizedBox(height: 8),
            Text(
              message!,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ],
      ),
    );
  }
}
