import 'package:hive_flutter/adapters.dart';
import 'app_keys.dart';

//Singleton Method
class StorageManager {
  StorageManager._();

  static final StorageManager _instance = StorageManager._();

  factory StorageManager() {
    return _instance;
  }

  static StorageManager get instance => _instance;

  Future<Box> openHiveBox() async {
    return Hive.openBox(AppKeys.box);
  }

  Future<void> saveEmail(String value) async {
    final box = await openHiveBox();
    await box.put(AppKeys.email, value);
  }

  Future<void> savePassword(String value) async {
    final box = await openHiveBox();
    await box.put(AppKeys.password, value);
  }

  Future<void> saveName(String value) async {
    final box = await openHiveBox();
    await box.put(AppKeys.name, value);
  }

  Future<void> clearData() async {
    final box = await openHiveBox();
    await box.delete(AppKeys.email);
    await box.delete(AppKeys.phone);
    await box.delete(AppKeys.password);
    await box.delete(AppKeys.name);
  }

  Future<void> savePhone(String value) async {
    final box = await openHiveBox();
    await box.put(AppKeys.phone, value);
  }
}
