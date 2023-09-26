import 'package:my_wallet/features/transactions/domain/entities/transaction.dart';

(Map<String, List<Transaction>>, double) mergeTransactions(
  List<Transaction> transactions,
) {
  // hold data
  Map<String, List<Transaction>> data = {};
  // store the full amount of money
  double fullAmount = 0.0;
  // collect data
  for (var t in transactions) {
    fullAmount += t.amount;
    data[t.category] ??= [];
    data[t.category] = data[t.category]! + [t];
  }
  return (data, fullAmount);
}
