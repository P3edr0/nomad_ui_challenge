import 'package:hive/hive.dart';
import 'package:nomad/entities/config_entity.dart';

class ConfigStorage {
  static const String _boxName = 'app_config';

  // Inicialização básica
  static Future<void> init() async {
    await Hive.openBox(_boxName); // Box genérica, sem tipo específico
  }

  // SALVAR configuração
  static Future<void> saveConfig(ConfigEntity config) async {
    final box = Hive.box(_boxName);
    await box.put('user_config', config.toMap()); // Salva como Map
  }

  // CARREGAR configuração
  static Future<ConfigEntity?> loadConfig() async {
    final box = Hive.box(_boxName);
    final Map<dynamic, dynamic>? data = box.get('user_config');

    if (data == null) return null;

    return ConfigEntity.fromMap(Map<String, dynamic>.from(data));
  }

  // DELETAR configuração
  static Future<void> deleteConfig() async {
    final box = Hive.box(_boxName);
    await box.delete('user_config');
  }
}
