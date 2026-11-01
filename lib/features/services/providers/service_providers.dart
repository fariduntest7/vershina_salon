import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

import 'package:vershina_salon/features/services/data/datasources/service_local_data_source.dart';
import 'package:vershina_salon/features/services/data/repositories/service_repository_impl.dart';
import 'package:vershina_salon/features/services/domain/entities/service_item.dart';
import 'package:vershina_salon/features/services/domain/repositories/service_repository.dart';

final serviceRepositoryProvider = Provider<ServiceRepository>((ref) {
  return ServiceRepositoryImpl(ServiceLocalDataSource());
});

final serviceListControllerProvider =
    StateNotifierProvider<ServiceListController, List<ServiceItem>>((ref) {
  final repository = ref.watch(serviceRepositoryProvider);
  return ServiceListController(repository);
});

class ServiceListController extends StateNotifier<List<ServiceItem>> {
  ServiceListController(this._repository) : super(const <ServiceItem>[]) {
    load();
  }

  final ServiceRepository _repository;

  Future<void> load() async {
    state = await _repository.getAll();
  }

  Future<void> addService({
    required String name,
    required String category,
    required int durationMinutes,
    required double price,
    bool isPopular = false,
  }) async {
    final service = ServiceItem(
      id: const Uuid().v4(),
      name: name.trim(),
      category: category.trim(),
      durationMinutes: durationMinutes,
      price: price,
      isPopular: isPopular,
    );

    await _repository.create(service);
    await load();
  }
}
