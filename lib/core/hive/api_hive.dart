import 'package:hive/hive.dart';

class ApiHive {
  final Box _box;

  ApiHive(this._box);

  Future<void> save(String key, String value) async =>
      await _box.put(key, value);

  String get(String key) => _box.get(key, defaultValue: "");

  bool has(String key) => _box.get(key) != null;

  Future<void> clear() async => await _box.clear();
}
