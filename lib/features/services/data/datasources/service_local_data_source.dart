import 'package:vershina_salon/features/services/domain/entities/service_item.dart';

/// Локальный источник услуг.
class ServiceLocalDataSource {
  ServiceLocalDataSource()
      : _services = <ServiceItem>[
          const ServiceItem(
            id: 'service-1',
            name: 'Мужская стрижка',
            category: 'Стрижка',
            durationMinutes: 60,
            price: 350,
            isPopular: true,
          ),
          const ServiceItem(
            id: 'service-2',
            name: 'Окрашивание',
            category: 'Покраска',
            durationMinutes: 120,
            price: 680,
            isPopular: true,
          ),
          const ServiceItem(
            id: 'service-3',
            name: 'Маникюр',
            category: 'Уход',
            durationMinutes: 90,
            price: 420,
            isPopular: false,
          ),
        ];

  final List<ServiceItem> _services;

  Future<List<ServiceItem>> getAll() async => List<ServiceItem>.from(_services);

  Future<String> create(ServiceItem service) async {
    _services.add(service);
    return service.id;
  }

  Future<void> update(ServiceItem service) async {
    final index = _services.indexWhere((item) => item.id == service.id);
    if (index == -1) {
      throw StateError('Услуга не найдена.');
    }
    _services[index] = service;
  }

  Future<void> delete(String id) async {
    _services.removeWhere((item) => item.id == id);
  }
}
