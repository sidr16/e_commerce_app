import 'package:intl/intl.dart';

final currencyFormat = NumberFormat.currency(
  locale: 'ru_RU',
  symbol: 'монет',
  decimalDigits: 0,
  customPattern: '#,##0 ¤',
);
