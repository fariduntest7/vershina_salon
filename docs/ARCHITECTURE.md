# Архитектура проекта

Проект строится по Clean Architecture с feature-first структурой.

## Основные слои

- `presentation` — экраны, виджеты, провайдеры и навигация.
- `domain` — бизнес-правила и use cases.
- `data` — репозитории, источники данных и локальные адаптеры.

## Модули

- authentication
- dashboard
- calendar
- appointments
- clients
- masters
- services
- categories
- employees
- inventory
- finance
- income
- expenses
- salaries
- analytics
- reviews
- notifications
- reports
- branches
- backup
- settings
- profile
- activity_logs

## Принцип

UI не должен напрямую содержать сложную логику. Все вычисления и проверки выносятся в сущности, use cases и сервисы.

