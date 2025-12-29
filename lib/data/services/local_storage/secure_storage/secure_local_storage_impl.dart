import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:meu_estoque/data/exceptions/storage_exception.dart';
import 'package:meu_estoque/data/services/local_storage/secure_storage/secure_local_storage.dart';
import 'package:meu_estoque/data/services/local_storage/secure_storage/secure_storage_options.dart';

class SecureLocalStorageImpl implements SecureLocalStorage {
  SecureLocalStorageImpl._({
    required FlutterSecureStorage storage,
  }) : _storage = storage;

  final FlutterSecureStorage _storage;

  factory SecureLocalStorageImpl() {
    final options = SecureStorageOptions();
    return SecureLocalStorageImpl._(
      storage: FlutterSecureStorage(
        aOptions: options.android,
        iOptions: options.ios,
      ),
    );
  }

  @visibleForTesting
  factory SecureLocalStorageImpl.test({required FlutterSecureStorage storage}) {
    return SecureLocalStorageImpl._(storage: storage);
  }

  @override
  Future<bool> containsKey(String key) async {
    try {
      return await _storage.containsKey(key: key);
    } catch (e) {
      throw StorageException(message: 'Error checking key existence: $e');
    }
  }

  @override
  Future<void> delete(String key) async {
    try {
      await _storage.delete(key: key);
    } catch (e) {
      throw StorageException(message: 'Error deleting key($key): $e');
    }
  }

  @override
  Future<void> deleteAll() async {
    try {
      await _storage.deleteAll();
    } catch (e) {
      throw StorageException(message: 'Error clearing storage: $e');
    }
  }

  @override
  Future<String?> read(String key) async {
    try {
      return await _storage.read(key: key);
    } catch (e) {
      throw StorageException(message: 'Error reading value from key($key): $e');
    }
  }

  @override
  Future<void> write(String key, String value) async {
    try {
      await _storage.write(key: key, value: value);
    } catch (e) {
      throw StorageException(message: 'Error writing value($value) to key($key): $e');
    }
  }
}
