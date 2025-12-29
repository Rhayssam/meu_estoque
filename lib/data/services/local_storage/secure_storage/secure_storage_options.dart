import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageOptions {
  SecureStorageOptions();

  final AndroidOptions android = AndroidOptions(
    encryptedSharedPreferences: true,
  );

  final IOSOptions ios = IOSOptions(
    accessibility: KeychainAccessibility.first_unlock,
  );
}
