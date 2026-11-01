# База данных

На текущем этапе проект подготовлен под локальную offline-first модель. Дальнейшая реализация предполагает:

- SQLite + Drift для мобильных и desktop платформ
- IndexedDB + Drift Web для браузера
- UUID в качестве идентификаторов
- created_at, updated_at, deleted_at
- миграции и контроль целостности

## Основные таблицы

- users
- roles
- permissions
- role_permissions
- user_roles
- salons
- branches
- employees
- masters
- clients
- client_notes
- service_categories
- services
- master_services
- work_schedules
- schedule_breaks
- appointments
- appointment_services
- appointment_status_history
- products
- product_categories
- suppliers
- stock_movements
- sales
- sale_items
- income_categories
- incomes
- expense_categories
- expenses
- salary_rules
- salary_accruals
- salary_payments
- reviews
- notifications
- attachments
- activity_logs
- app_settings
- database_migrations
- sync_queue
- sync_metadata

## Важно

Локальная БД не предназначена для прямой публичной синхронизации. Будущая интеграция с MariaDB будет выполняться через отдельный backend.

