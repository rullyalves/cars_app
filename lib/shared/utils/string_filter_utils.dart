import 'package:intl/intl.dart';

extension SearchExtension on String {
  bool containsAny(String pattern) {
    final patterns = pattern.toLowerCase().trim().split(" ");
    final myInstance = toLowerCase();
    for (final text in patterns) {
      if (myInstance.contains(text)) {
        return true;
      }
    }
    return false;
  }

  String decapitalize() {
    return replaceRange(1, length, substring(1, length).toLowerCase());
  }
}

extension CurrencyFormatter on num {
  static final numberFormatter = NumberFormat.currency(
    locale: "pt_BR",
    name: "R\$",
  );
  String get formatToCurrentCurrency {
    return numberFormatter.format(this);
  }
}
