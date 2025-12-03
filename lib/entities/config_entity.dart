// ConfigEntity.dart - MODELO NORMAL, sem anotações Hive
import 'package:nomad/entities/transactios_entity.dart';

class ConfigEntity {
  String name;
  String greeting;
  String dollarBalance;
  String realBalance;
  String dollarValue;
  List<TransactionEntity> transactions;

  ConfigEntity({
    required this.name,
    required this.greeting,
    required this.dollarBalance,
    required this.realBalance,
    required this.dollarValue,
    required this.transactions,
  });

  // Converter para Map
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'greeting': greeting,
      'dollarBalance': dollarBalance,
      'realBalance': realBalance,
      'dollarValue': dollarValue,
      'transactions': transactions.map((tx) => tx.toMap()).toList(),
    };
  }

  factory ConfigEntity.fromMap(Map<String, dynamic> map) {
    final transactions = List<Map>.from(map['transactions']);
    final transactionsMaps = transactions
        .map((item) => Map<String, dynamic>.from(item))
        .toList();
    final handledTransactions = transactionsMaps
        .map((element) => TransactionEntity.fromMap(element))
        .toList();
    return ConfigEntity(
      name: map['name'],
      greeting: map['greeting'],
      dollarBalance: map['dollarBalance'],
      realBalance: map['realBalance'],
      dollarValue: map['dollarValue'],
      transactions: handledTransactions,
    );
  }
}
