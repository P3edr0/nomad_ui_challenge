import 'package:flutter/cupertino.dart';
import 'package:nomad/data/config_storage.dart';
import 'package:nomad/entities/config_entity.dart';
import 'package:nomad/entities/transactios_entity.dart';

class ConfigController extends ChangeNotifier {
  final TextEditingController greetingController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController dollarBalanceController = TextEditingController();
  final TextEditingController realBalanceController = TextEditingController();
  final TextEditingController dollarValueController = TextEditingController();
  ConfigEntity? currentConfig;
  TransactionEntity? transactionOnEditing;
  List<TransactionEntity> transactions = [];

  void startControllers() {
    greetingController.text = currentConfig!.greeting;
    nameController.text = currentConfig!.name;
    dollarBalanceController.text = currentConfig!.dollarBalance;
    realBalanceController.text = currentConfig!.realBalance;
    dollarValueController.text = currentConfig!.dollarValue;
  }

  Future<void> saveChanges() async {
    final name = nameController.text;
    final dollarBalance = dollarBalanceController.text;
    final greeting = greetingController.text;
    final realBalance = realBalanceController.text;
    final dollarValue = dollarValueController.text;

    final newConfig = ConfigEntity(
      name: name,
      greeting: greeting,
      dollarBalance: dollarBalance,
      realBalance: realBalance,
      transactions: transactions,
      dollarValue: dollarValue,
    );
    currentConfig = newConfig;
    notifyListeners();
    await ConfigStorage.saveConfig(newConfig);
  }

  Future<void> getConfigs() async {
    final config = await ConfigStorage.loadConfig();
    if (config == null) {
      currentConfig = ConfigEntity(
        name: 'Maikel De Souza',
        greeting: 'Bom dia,',
        dollarBalance: '00,00',
        realBalance: '00,00',
        dollarValue: '0,00',
        transactions: [],
      );
    } else {
      currentConfig = config;
      transactions = config.transactions;
    }
    notifyListeners();
  }

  void addTransaction(TransactionEntity newTransaction) {
    if (transactionOnEditing == null) {
      transactions.add(newTransaction);
    } else {
      final index = transactions.indexOf(transactionOnEditing!);
      transactions[index] = newTransaction;
    }
    notifyListeners();
  }

  void setTransactionOnEditing(TransactionEntity? newTransaction) {
    transactionOnEditing = newTransaction;
  }

  void removeTransaction(TransactionEntity newTransaction) {
    transactions.remove(newTransaction);
    notifyListeners();
  }
}
