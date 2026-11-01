class CurrencyHelper {
  const CurrencyHelper._();

  static String formatAmount(num amount, {String currency = 'TJS'}) {
    final value = amount.toStringAsFixed(2);
    return '$value $currency';
  }
}
