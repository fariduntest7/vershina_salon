/// Базовое исключение приложения.
///
/// Используется для информирования UI и сервисов об ошибках,
/// возникающих в доменной логике и хранилищах данных.
class AppException implements Exception {
  const AppException(this.message, {this.code = 'APP_EXCEPTION'});

  /// Короткое человекочитаемое описание ошибки.
  final String message;

  /// Код ошибки для логирования и дальнейшей обработки в UI.
  final String code;

  @override
  String toString() => 'AppException(code: $code, message: $message)';
}

/// Исключение, возникающее при нарушении бизнес-правил.
class BusinessRuleException extends AppException {
  const BusinessRuleException(super.message, {super.code = 'BUSINESS_RULE'});
}

/// Исключение, возникающее при валидации входных параметров.
class ValidationException extends AppException {
  const ValidationException(super.message, {super.code = 'VALIDATION'});
}

/// Исключение, возникающее при ошибках локального хранилища.
class StorageException extends AppException {
  const StorageException(super.message, {super.code = 'STORAGE'});
}
