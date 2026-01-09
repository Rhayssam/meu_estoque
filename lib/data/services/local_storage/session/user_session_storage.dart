import 'package:flutter/material.dart';
import 'package:meu_estoque/data/services/local_storage/shared_preferences/shared_preferences_local_storage.dart';
import 'package:meu_estoque/domain/models/user_model.dart';

class UserSessionStorage {
  final SharedPreferencesLocalStorage _storage;
  UserSessionStorage(this._storage);

  final String _token = "token";
  final String _name = "name";
  final String _id = "id";
  final String _email = "email";
  final String _themeMode = "theme_mode";

  Future<void> setThemeMode(ThemeMode mode) async {
    String value = mode.name;
    await _storage.setString(_themeMode, value);
  }

  Future<void> saveUser(UserModel user) async {
    await _storage.setString(_token, user.token);
    await _storage.setString(_name, user.name);
    await _storage.setString(_id, user.uuid);
  }

  ThemeMode? getThemeMode() {
    final value = _storage.getString(_themeMode);
    if (value == null) return null;

    switch (value) {
      case 'light':
        return ThemeMode.light;
      case 'dark':
        return ThemeMode.dark;
      case 'system':
      default:
        return ThemeMode.system;
    }
  }

  UserModel? getUser() {
    final token = _storage.getString(_token);
    final name = _storage.getString(_name);
    final id = _storage.getString(_id);
    final email = _storage.getString(_email);

    if (token != null && name != null && id != null && email != null) {
      return UserModel(
        uuid: id,
        name: name,
        token: token,
        email: email,
      );
    }
    return null;
  }
}
