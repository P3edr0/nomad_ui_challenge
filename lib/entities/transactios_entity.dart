// TransactionEntity.dart - MODELO NORMAL, sem anotações Hive
class TransactionEntity {
  final String title;
  final DateTime date;
  final String value;

  TransactionEntity({
    required this.title,
    required this.date,
    required this.value,
  });

  // Métodos para converter para/from Map
  Map<String, dynamic> toMap() {
    return {'title': title, 'date': date.toIso8601String(), 'value': value};
  }

  factory TransactionEntity.fromMap(Map<String, dynamic> map) {
    return TransactionEntity(
      title: map['title'],
      date: DateTime.parse(map['date']),
      value: map['value'],
    );
  }
}
