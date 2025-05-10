import 'package:hive/hive.dart';
import 'package:tugas_firman/model/user_model.dart';

class AuthLocalStorage {
  late final Box box;

  AuthLocalStorage(this.box);

  Future<void> setToken(String value) async {
    await box.put('token', value);
  }

  String? getToken() {
    return box.get('token');
  }

  Future<void> setUser(User value) async {
    await box.put('name', value.name);
    await box.put('username', value.username);
    await box.put('role', value.role);
  }

  User? getUser() {
    final name = box.get('name');
    final username = box.get('username');
    final role = box.get('role');

    if (name != null && username != null) {
      return User(name: name, username: username, role: role);
    }
    return null;
  }

  Future<void> clear() async {
    await box.delete('token');
    await box.delete('name');
    await box.delete('username');
    await box.delete('role');
  }
}