class InputValidators {
  const InputValidators._();

  static String? required(String? value, {String fieldName = 'Поле'}) {
    if (value == null || value.trim().isEmpty) {
      return '$fieldName обязательно для заполнения.';
    }
    return null;
  }

  static String? phone(String? value) {
    final trimmed = value?.trim() ?? '';
    if (trimmed.isEmpty) {
      return 'Телефон обязателен.';
    }

    final phoneRegExp = RegExp(r'^[+]?\d{7,15}$');
    if (!phoneRegExp.hasMatch(trimmed)) {
      return 'Введите корректный номер телефона.';
    }
    return null;
  }

  static String? email(String? value) {
    final trimmed = value?.trim() ?? '';
    if (trimmed.isEmpty) {
      return 'Email обязателен.';
    }

    final emailRegExp = RegExp(
      r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$',
    );
    if (!emailRegExp.hasMatch(trimmed)) {
      return 'Введите корректный email.';
    }
    return null;
  }
}
