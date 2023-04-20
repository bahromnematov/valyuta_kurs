import 'package:hive/hive.dart';

class UserHive {
  final Box _box;

  UserHive(this._box);

  Future<void> saveToken(String token) async => await _box.put("TOKEN", token);

  String get token => _box.get("TOKEN", defaultValue: "");

  Future<void> clear() async => await _box.clear();
}
