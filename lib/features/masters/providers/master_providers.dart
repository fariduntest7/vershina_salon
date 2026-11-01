import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

import 'package:vershina_salon/features/masters/data/datasources/master_local_data_source.dart';
import 'package:vershina_salon/features/masters/data/repositories/master_repository_impl.dart';
import 'package:vershina_salon/features/masters/domain/entities/master.dart';
import 'package:vershina_salon/features/masters/domain/repositories/master_repository.dart';

final masterRepositoryProvider = Provider<MasterRepository>((ref) {
  return MasterRepositoryImpl(MasterLocalDataSource());
});

final masterListControllerProvider =
    StateNotifierProvider<MasterListController, List<Master>>((ref) {
  final repository = ref.watch(masterRepositoryProvider);
  return MasterListController(repository);
});

class MasterListController extends StateNotifier<List<Master>> {
  MasterListController(this._repository) : super(const <Master>[]) {
    load();
  }

  final MasterRepository _repository;

  Future<void> load() async {
    state = await _repository.getAll();
  }

  Future<void> addMaster({
    required String name,
    required String specialization,
    double rating = 4.8,
    int experienceYears = 5,
    bool isAvailable = true,
  }) async {
    final master = Master(
      id: const Uuid().v4(),
      name: name.trim(),
      specialization: specialization.trim(),
      rating: rating,
      experienceYears: experienceYears,
      isAvailable: isAvailable,
    );

    await _repository.create(master);
    await load();
  }
}
