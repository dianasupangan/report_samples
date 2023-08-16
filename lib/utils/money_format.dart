import 'package:intl/intl.dart';

String formatToMoney(int data) {
  final formatCurrency = NumberFormat.currency(symbol: "₱");
  final amount = formatCurrency.format(double.parse(data.toString()));

  return amount;
}
