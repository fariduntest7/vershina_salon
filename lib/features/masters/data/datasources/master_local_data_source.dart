import 'package:vershina_salon/features/masters/domain/entities/master.dart';

/// Локальный источник мастеров.
class MasterLocalDataSource {
  MasterLocalDataSource()
      : _masters = <Master>[
          const Master(
            id: 'master-1',
            name: 'Сардор',
            specialization: 'Мастер мужских стрижек',
            rating: 4.9,
            experienceYears: 8,
            isAvailable: true,
          ),
          const Master(
            id: 'master-2',
            name: 'Фарид',
            specialization: 'Парикмахер и окрашивание',
            rating: 4.8,
            experienceYears: 7,
            isAvailable: true,
          ),
          const Master(
            id: 'master-3',
            name: 'Али',
            specialization: 'Уход и маникюр',
            rating: 4.7,
            experienceYears: 6,
            isAvailable: false,
          ),
        ];

  final List<Master> _masters;

  Future<List<Master>> getAll() async => List<Master>.from(_masters);

  Future<String> create(Master master) async {
    _masters.add(master);
    return master.id;
  }

  Future<void> update(Master master) async {
    final index = _masters.indexWhere((item) => item.id == master.id);
    if (index == -1) {
      throw StateError('Мастер не найден.');
    }
    _masters[index] = master;
  }

  Future<void> delete(String id) async {
    _masters.removeWhere((item) => item.id == id);
  }
}
