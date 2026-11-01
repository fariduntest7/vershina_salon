# VERSHINA SALON

Проект представляет собой локально-ориентированную платформу управления салоном красоты и барбершопом для Android, iOS, Windows и Web.

## Быстрый старт

1. Установите Flutter 3.3+
2. Выполните:
   ```bash
   flutter pub get
   flutter run
   ```
3. Для сборки:
   ```bash
   flutter build apk --release
   flutter build appbundle --release
   flutter build windows --release
   flutter build web --release
   ```

## Структура проекта

- `lib/app` — маршрутизация и тема
- `lib/core` — константы, валидация, база и сервисы
- `lib/features` — экраны и функциональные модули
- `lib/shared` — переиспользуемые виджеты
- `docs` — документация по архитектуре, БД, дизайну и тестированию

## Основные принципы

- Local-first
- Offline-first
- Премиальный дизайн
- Clean Architecture
- Flutter + Riverpod + GoRouter

## Ограничения текущей версии

Этот репозиторий создаёт рабочую основу и архитектуру проекта. Полная реализация всех 27 экранов и комплексных сценариев требует продолжения разработки в локальном Flutter SDK-окружении.

